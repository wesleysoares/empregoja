require 'rails_helper'

feature "User update company" do
  scenario "successfully" do

   company = Company.create!(name: "Campus Code",
                             phone: "11 848889383",
                             mail: "wesley@campus.com",
                             location: "São Paulo")

    visit edit_company_path(company)

    fill_in "Name", with: "Locaweb"
    fill_in "Phone", with: "11 6546463"
    fill_in "Mail", with: "sergio@campus.com"
    fill_in "Location", with: "Barcelona"

    click_on "Atualizar Empresa"

    expect(page).to have_content "Locaweb"
    expect(page).to have_content "11 6546463"
    expect(page).to have_content "sergio@campus.com"
    expect(page).to have_content "Barcelona"

  end

end
