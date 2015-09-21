require 'rails_helper'

feature 'Visitor view recent jobs' do
  scenario 'successfully' do
    company = Company.create(name:     'Campus Code',
                             location: 'São Paulo',
                             mail:     'contato@campuscode.com.br',
                             phone:    '2369-3476')

    category = Category.create(name: 'Desenvolvedor')

    Job.create(title: 'Vaga de Dev',
               description: 'Dev Junior Rails com ao menos um projeto',
               location: 'São Paulo',
               company_id: company.id,
               category_id: category.id)

    visit root_path

    expect(page).to have_content('Novidade')
  end
end
