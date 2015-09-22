class Company < ActiveRecord::Base
  has_many :jobs
  validates :name, :location, :phone, :mail, presence: true

  def premium?
    if jobs.count >= 5
      true
    end
  end
end
