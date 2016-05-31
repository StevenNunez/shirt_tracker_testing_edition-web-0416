require 'rails_helper'

RSpec.describe WearingsController, type: :controller do
  it "redirects you to the home page after you've given it shirt to wear" do
    cohort = Cohort.new(name: "Bangarangs", start_date: 10.weeks.ago, end_date: 2.weeks.from_now)
    shirt = Shirt.new(name: "Science Mouse")

    allow(Shirt).to receive(:find).with("3").and_return(shirt)
    allow(Cohort).to receive(:find).with("1").and_return(cohort)
    post :create, wearing: {shirt_id: 3, cohort_id: 1}
    expect(response).to redirect_to(root_path)
    expect(flash[:notice]).to eq("New wearing created")
    # flash
    # sessions
    # expect(assigns(:shirts)).to eq([])
  end
end
