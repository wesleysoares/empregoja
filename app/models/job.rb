class Job < ActiveRecord::Base
  def featured?
    featured
  end
end
