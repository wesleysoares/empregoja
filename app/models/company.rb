class Company < ActiveRecord::Base
  validates :name, :phone, :mail, :location, presence: true
  has_many :jobs
end
