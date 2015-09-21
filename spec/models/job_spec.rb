require 'rails_helper'

RSpec.describe Job, type: :model do

  describe "#recent?" do

    context "created today" do
      it "is recent" do
        job = create_job
        expect(job.recent?).to be true
      end
    end

    context "created 6 days ago" do
      it "is not recent" do
        travel_to 6.days.ago do
          job = create_job
          expect(job.recent?).to be false
        end
      end
    end

    context "created 4 days ago" do
      it "is recent" do
        travel_to 4.days.ago do
          job = create_job
          expect(job.recent?).to be true
        end
      end
    end

  end

end
