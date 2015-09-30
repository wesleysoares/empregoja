require 'rails_helper'

feature 'User update job' do
  scenario 'successfully' do

    company = Company.create!(name: "Campus Code2",
                    location: "São Paulo",
                    phone: "11 5556-5432",
                    mail: "contato@campuscode.com.br")

    category = Category.create!(name: "Desenvolvedor")

    job = Job.create(title: "Desenvolvedor Ruby",
              company: company,
              location: "São Paulo",
              category: category,
              description: "Vaga programador")

    visit edit_job_path(job)

    fill_in "Title", with: "Desenvolvedor Java"
    click_on "Atualizar Vaga"
    expect(page).to have_content "Desenvolvedor Java"

  end
end
