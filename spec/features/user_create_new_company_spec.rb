require 'rails_helper'

feature 'User create new company' do
  scenario 'successfully' do
    visit new_company_path

    fill_in 'Name', with: 'Campus Code'
    fill_in 'Phone', with: '5431-1234'
    fill_in 'Mail', with: 'contato@campuscode.com.br'
    fill_in 'Location', with: 'São Paulo'

    click_on 'Criar Empresa'

    expect(page).to have_content 'Campus Code'
    expect(page).to have_content '5431-1234'
    expect(page).to have_content 'contato@campuscode.com.br'
    expect(page).to have_content 'São Paulo'
  end

  scenario 'unsuccessfully' do
    visit new_company_path

    click_on 'Criar Empresa'

    expect(page).to have_content('Warning! All fields are mandatory.')
  end
end
