require 'rails_helper'

RSpec.describe SellStockNotifier do
  include ActiveSupport::Testing::TimeHelpers

  subject { described_class.call }

  context "when it's weekend" do
    it 'dose not call StockService' do
      travel_to Time.find_zone('Eastern Time (US & Canada)').local(2017,10,1) do
        expect(StockService).not_to receive(:call)
      end
    end
  end

  context "when it's not weekend" do
    around(:example) do |example|
      travel_to Time.find_zone('Eastern Time (US & Canada)').local(2017,10,2) do
        example.run
      end
    end

    it "calls StockService" do
      expect(StockService).to receive(:call)

      subject
    end

    describe "send email notification" do
      before { allow(StockService).to receive(:call) }

      context "when there are no stocks with sell action" do
        before do
          create(:long_term_stock, stock_symbol: 'tsla', action: 'hold')
          create(:long_term_stock, stock_symbol: 'shop', action: 'hold')
        end

        it "does not call NoticesMailer.notify_to_sell" do
          expect(NoticesMailer).not_to receive(:notify_to_sell)

          subject
        end
      end

      context "when there is one stock with sell action" do
        before do
          create(:long_term_stock, stock_symbol: 'tsla', action: 'sell')
          create(:long_term_stock, stock_symbol: 'shop', action: 'hold')
        end

        it "calls NoticesMailer.notify_to_sell" do
          message_delivery = instance_double(ActionMailer::MessageDelivery)
          expect(NoticesMailer).not_to receive(:notify_to_sell).with(email: 'bing708@gmail.com').once.and_return(message_delivery)
          allow(message_delivery).to receive(:deliver_later)

          subject
        end
      end
    end
  end
end
