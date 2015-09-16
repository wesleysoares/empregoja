class Job < ActiveRecord::Base
  validates :title, presence: true

  belongs_to :company

  def featured?
    featured
  end
end
