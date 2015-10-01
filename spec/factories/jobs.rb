FactoryGirl.define do
  factory :job do
    title 'Desenvolvedor Ruby'
    company
    location 'São Paulo'
    category
    description 'Criar sistemas utilizando a linguagem Ruby.'
    featured true
  end
end
