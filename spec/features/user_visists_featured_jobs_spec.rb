require 'rails_helper'

feature "User visists featured jobs" do
  scenario "Successfully" do

    category = create(:category)

    company = create(:company)

    job = create(:job)

    visit job_path(job)

    expect(page).to have_content("Desenvolvedor Ruby")
    expect(page).to have_content("Campus Code")
    expect(page).to have_content("São Paulo")
    expect(page).to have_content("Desenvolvedor")
    expect(page).to have_content("Criar sistemas utilizando a linguagem Ruby.")
    expect(page).to have_content("Vaga em Destaque")

  end
end
