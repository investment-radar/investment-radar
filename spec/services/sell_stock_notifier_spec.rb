# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SellStockNotifier do
  include ActiveSupport::Testing::TimeHelpers

  let(:stocks_to_notify) { [] }

  before { allow(LongTermStockService).to receive(:call).and_return(stocks_to_notify) }

  context "when it's weekend" do
    it 'dose not call LongTermStockService' do
      travel_to Time.find_zone('Eastern Time (US & Canada)').local(2017, 10, 1) do
        described_class.call
        expect(LongTermStockService).not_to have_received(:call)
      end
    end
  end

  context "when it's not weekend" do
    it 'calls LongTermStockService' do
      travel_to Time.find_zone('Eastern Time (US & Canada)').local(2017, 10, 2) do
        described_class.call
        expect(LongTermStockService).to have_received(:call)
      end
    end
  end

  describe 'send email notification' do
    around do |example|
      travel_to Time.find_zone('Eastern Time (US & Canada)').local(2017, 10, 2) do
        example.run
      end
    end

    context 'when there are no stocks with sell action' do
      it 'does not call NoticesMailer.notify_to_sell' do
        allow(NoticesMailer).to receive(:notify_to_sell)
        described_class.call
        expect(NoticesMailer).not_to have_received(:notify_to_sell)
      end
    end

    context 'when there is one stock with sell action' do
      let(:stocks_to_notify) { LongTermStock.to_sell }

      before do
        create(:long_term_stock, stock_symbol: 'tsla', action: 'sell')
        create(:long_term_stock, stock_symbol: 'msft', action: 'sell')
        create(:long_term_stock, stock_symbol: 'team', action: 'hold')
      end

      # rubocop:disable RSpec/MultipleExpectations
      it 'calls NoticesMailer.notify_to_sell' do
        message_delivery = instance_double(ActionMailer::MessageDelivery)
        allow(message_delivery).to receive(:deliver_later)
        allow(NoticesMailer).to receive(:notify_to_sell).with(email: 'bing.xie78@gmail.com').once
                                                        .and_return(message_delivery)
        allow(TwilioSmsService).to receive(:call)

        described_class.call

        expect(LongTermStockService).to have_received(:call).with(LongTermStock.to_hold)
        expect(NoticesMailer).to have_received(:notify_to_sell)
        expect(TwilioSmsService).to have_received(:call).with('Sell: tsla, msft', '+61455500146')
        expect(LongTermStock.to_sell.first.reload.notified_at).not_to be_nil
        expect(LongTermStock.to_sell.second.reload.notified_at).not_to be_nil
      end
      # rubocop:enable RSpec/MultipleExpectations
    end
  end
end
