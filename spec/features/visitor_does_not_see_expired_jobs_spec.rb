require 'rails_helper'

feature 'Visitor does not see expired jobs' do
  scenario 'successfully' do
    company = create_company

    travel_to 91.days.ago do
      create_job(company)
    end

    visit root_path

    expect(page).not_to have_content('Desenvolvedor Rails')
  end

  scenario 'visit expired job page' do
    company = create_company

    travel_to 91.days.ago do
      @job = create_job(company)
    end

    visit job_path(@job)

    expect(page).to have_content('Vaga Expirada')
  end
end
