class Job < ActiveRecord::Base
  belongs_to :company
  belongs_to :category

  validates :title, :location, :description, :category, :company, presence: true

  EXPIRATION_DAYS = 90.days

  TYPES = ['intern', 'full-time', 'part-time']

  def featured?
    featured
  end

  def recent?
    DateTime.now.in_time_zone < (created_at + 5.days)
  end

  def expired?
    created_at < EXPIRATION_DAYS.ago
  end

  def self.unexpired_jobs
    Job.where('created_at > ?', EXPIRATION_DAYS.ago)
  end
end
