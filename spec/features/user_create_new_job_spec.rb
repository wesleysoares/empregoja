require 'rails_helper'

feature 'User create new job' do

  scenario 'successfully' do

    Company.create!(name: "Campus Code2",
                    location: "São Paulo",
                    phone: "11 5556-5432",
                    mail: "contato@campuscode.com.br")
    Category.create!(name: "Desenvolvedor")

    visit new_job_path

    fill_in "Title", with: "Desenvolvedor Ruby"
    fill_in "Location", with: "São Paulo"
    select "Campus Code2", from: "job[company_id]"
    select "Desenvolvedor", from: "job[category_id]"
    fill_in "Description", with: "Descrição da Vaga"
    click_on "Criar Vaga"
  end

  scenario 'unsuccessfully' do

    visit new_job_path

    click_on "Criar Vaga"

    expect(page).to have_content("Warning! All fields are mandatory.")

  end

end
