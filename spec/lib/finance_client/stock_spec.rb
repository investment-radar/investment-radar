require 'rails_helper'
require './lib/finance_client/stock'

RSpec.describe FinanceClient::Stock do
  describe '#quote' do
    subject(:body) { described_class.quote('team') }

    it { is_expected.to be_kind_of Hash }

    it { is_expected.to include 'symbol' => 'TEAM'}

    it { expect(body["latestPrice"]).to be_kind_of Float }
  end
end
