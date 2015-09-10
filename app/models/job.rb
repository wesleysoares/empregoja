class Job < ActiveRecord::Base
  belongs_to :company
  
  def featured?
    featured
  end
end
