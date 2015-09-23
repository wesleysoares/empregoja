class Job < ActiveRecord::Base
  belongs_to :company
  belongs_to :category

  validates :title, :location, :description, :category, :company, presence: true

  def featured?
    featured
  end

  def recent?
    DateTime.now < (created_at + 5.days)
  end

  def expired?
    created_at < 90.days.ago
  end

end
