require 'rails_helper'

feature 'User visit recent jobs' do
  scenario 'successfully' do

    job = create(:job)
    job = create(:job, title: 'Dentista')

    travel_to 6.days.ago do
      job = create(:job, title: 'Professor')
    end

    visit root_path

    expect(page).to have_content('Novidade', count: 2)
  end
end
