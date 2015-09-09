require 'rails_helper'

feature 'User creates a new job' do
  scenario 'successfully' do
    visit new_job_path
    fill_in 'Title',    with: 'Dev Master'
    fill_in 'Location', with: 'Rio de Janeiro'
    fill_in 'Category', with: 'Desenvolvedor'
    fill_in 'Company',  with: 'Campus Code'
    fill_in 'Description', with: 'Vaga para Dev Master para o Bootcamp Rails'
    click_on 'Criar Vaga'
    expect(page).to have_content 'Dev Master'
    expect(page).to have_content 'Rio de Janeiro'
    expect(page).to have_content 'Desenvolvedor'
    expect(page).to have_content 'Campus Code'
    expect(page).to have_content 'Vaga para Dev Master para o Bootcamp Rails'
  end

end
