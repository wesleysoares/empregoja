require 'rails_helper'

feature 'Visitor visits homepage' do
  scenario 'successfully' do
    visit root_path
    expect(page).to have_content 'Emprego Já'
  end
end
