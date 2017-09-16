require 'rails_helper'

describe 'Welcome Page' do
  it 'visit welcome' do
    visit '/'

    expect(page).to have_content 'Hello World'
    expect(page).to have_content '2017-09-15'
  end
end
