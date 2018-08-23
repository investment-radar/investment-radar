# frozen_string_literal: true

RSpec.describe DecisionEngine::LongTermStock do
  it 'has a BASE_URL' do
    expect(DecisionEngine::LongTermStock::BASE_URL).to eq 'https://dry-falls-81080.herokuapp.com/'
  end
end
