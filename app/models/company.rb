class Company < ActiveRecord::Base
  has_many :jobs
  validates :name, :location, :phone, :mail, presence: true

end
