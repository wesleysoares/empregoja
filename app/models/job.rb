class Job < ActiveRecord::Base
  belongs_to :company
  validates :title, :location, :description, :category, :company, presence: true

  def featured?
    featured
  end
end
