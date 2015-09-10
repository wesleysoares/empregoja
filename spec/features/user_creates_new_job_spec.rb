require 'rails_helper'

feature 'User creates a new job' do

  scenario 'successfully' do
    job = Job.new(title:    'Dev Master',
                  location: 'Rio de Janeiro',
                  category: 'Desenvolvedor',
                  company:  'Campus Code',
                  description: 'Vaga para Dev Master para o Bootcamp Rails')
    visit new_job_path
    fill_in 'Title',       with: job.title
    fill_in 'Location',    with: job.location
    fill_in 'Category',    with: job.category
    fill_in 'Company',     with: job.company
    fill_in 'Description', with: job.description

    click_on 'Criar Vaga'

    expect(page).to have_content 'Dev Master'
    expect(page).to have_content 'Rio de Janeiro'
    expect(page).to have_content 'Desenvolvedor'
    expect(page).to have_content 'Campus Code'
    expect(page).to have_content 'Vaga para Dev Master para o Bootcamp Rails'
  end

  scenario 'featured job' do
    job = Job.new(title:    'Dev Master',
                  location: 'Rio de Janeiro',
                  category: 'Desenvolvedor',
                  company:  'Campus Code',
                  description: 'Vaga para Dev Master para o Bootcamp Rails')
    visit new_job_path
    fill_in 'Title',       with: job.title
    fill_in 'Location',    with: job.location
    fill_in 'Category',    with: job.category
    fill_in 'Company',     with: job.company
    fill_in 'Description', with: job.description
    check   'Featured'

    click_on 'Criar Vaga'

    expect(page).to have_content 'Dev Master'
    expect(page).to have_content 'Rio de Janeiro'
    expect(page).to have_content 'Desenvolvedor'
    expect(page).to have_content 'Campus Code'
    expect(page).to have_content 'Vaga para Dev Master para o Bootcamp Rails'
    expect(page).to have_content 'Vaga em Destaque'
  end

end
