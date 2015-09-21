module ModelsMacros
  def create_company
    Company.create(name: 'Campus Code',
                   location: 'São Paulo',
                   phone: '11 2369 3476',
                   mail: 'contato@campuscode.com.br')
  end

  def create_category
    Category.create(name: 'Desenvolvedor')
  end

  def create_job
    company = create_company
    category = create_category
    Job.create(title: 'Desenvolvedor Rails',
               description: 'Desenvolvedor Full Stack Rails',
               location: 'São Paulo - SP',
               company_id: company.id,
               category_id: category.id)
  end
end
