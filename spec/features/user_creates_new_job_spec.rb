require 'rails_helper'

feature 'User creates a new job' do

  scenario 'successfully' do
    company = Company.create(name:     'Campus Code',
                          location: 'São Paulo',
                          mail:     'contato@campuscode.com.br',
                          phone:    '2369-3476')

    category = Category.create(name: 'Desenvolvedor')

    job = Job.new(title:    'Dev Master',
                  location: 'Rio de Janeiro',
                  description: 'Vaga para Dev Master para o Bootcamp Rails')

    visit new_job_path
    fill_in 'Title',       with: job.title
    fill_in 'Location',    with: job.location
    fill_in 'Category',    with: job.category
    select  'Campus Code'
    select  'Desenvolvedor'
    fill_in 'Description', with: job.description

    click_on 'Criar Vaga'

    expect(page).to have_content 'Dev Master'
    expect(page).to have_content 'Rio de Janeiro'
    expect(page).to have_content 'Desenvolvedor'
    expect(page).to have_content 'Campus Code'
    expect(page).to have_content 'Vaga para Dev Master para o Bootcamp Rails'
  end

  scenario 'featured job' do
    company = Company.create(name:     'Campus Code',
                            location: 'São Paulo',
                            mail:     'contato@campuscode.com.br',
                            phone:    '2369-3476')

    category = Category.create(name: 'Desenvolvedor')

    job = Job.new(title:    'Dev Master',
                  location: 'Rio de Janeiro',
                  description: 'Vaga para Dev Master para o Bootcamp Rails')

    visit new_job_path
    fill_in 'Title',       with: job.title
    fill_in 'Location',    with: job.location
    fill_in 'Category',    with: job.category
    select  'Campus Code'
    select  'Desenvolvedor'
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

  scenario 'invalid' do
    visit new_job_path

    click_on 'Criar Vaga'

    expect(page).to have_content 'Warning! All fields are mandatory.'

  end

end
