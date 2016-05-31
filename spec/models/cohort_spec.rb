require 'rails_helper'

RSpec.describe Cohort, type: :model do
  context "in_session?" do

    it "knows if a cohort is in session" do
      start_date = 10.weeks.ago
      end_date = 2.weeks.from_now
      cohort = Cohort.new(name: "Bangarangs", start_date: start_date, end_date: end_date)
      cohort.save!

      expect(cohort).to be_in_session
    end

    it "knows if a cohort is not in session" do
      start_date = 10.weeks.ago
      end_date = 2.weeks.ago
      cohort = Cohort.new(name: "Greenlights", start_date: start_date, end_date: end_date)
      cohort.save!

      expect(cohort).to_not be_in_session
    end
  end

  context "wearing shirts" do
    let(:cohort) do
      start_date = 10.weeks.ago
      end_date = 2.weeks.from_now
      cohort = Cohort.new(name: "Bangarangs", start_date: start_date, end_date: end_date)
      cohort.save!
      cohort
    end

    let(:science_mouse) {  Shirt.create(:name => "Science Mouse")}

    it "can mark a shirt as worn" do
      cohort.wear(science_mouse)
      expect(cohort.worn_shirts).to include(science_mouse)
    end

    it "does not include unworn shirts" do
      expect(cohort.worn_shirts).to_not include(science_mouse)
    end

    it "knows which shirts are available" do
      expect(cohort.available_shirts).to include(science_mouse)
    end

    it "knows which shirts are note available" do
      not_loading = Shirt.create(:name => "Not Loading Shirt")

      cohort.wear(science_mouse)
      
      expect(cohort.available_shirts).to_not include(science_mouse)
      expect(cohort.available_shirts).to include(not_loading)
    end
  end
end
