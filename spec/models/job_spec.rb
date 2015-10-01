require 'rails_helper'

describe Job do
  it "should be recent" do
    job = create(:job)

    expect(job).to be_recent
  end

  it "should not be recent" do
    job = nil

    travel_to 6.days.ago do
      job = create(:job)
    end

    expect(job).to_not be_recent
  end

  it "should be expired" do
    job = nil

    travel_to 90.days.ago do
      job = create(:job)
    end

    expect(job).to be_expired
  end

  it "should not be expired" do
    job = create(:job)

    expect(job).to_not be_expired
  end

end
