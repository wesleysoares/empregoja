require 'rails_helper'

feature 'Visitor visits job details' do
  scenario 'successfully' do
    Job.create(title: 'Vaga de Dev',
               category: 'Desenvolvedor',
               company: 'Campus Code',
               description: 'Dev Junior Rails com ao menos um projeto',
               location: 'São Paulo')
    visit root_path
    click_on 'Ver mais'
    expect(page).to have_content 'Vaga de Dev'
    expect(page).to have_content 'Desenvolvedor'
    expect(page).to have_content 'Campus Code'
    expect(page).to have_content 'Dev Junior Rails com ao menos um projeto'
    expect(page).to have_content 'São Paulo'
  end
end
