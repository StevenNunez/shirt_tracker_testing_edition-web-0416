class WearingsController < ApplicationController
  def create
    shirt = Shirt.find(params[:wearing][:shirt_id])
    cohort = Cohort.find(params[:wearing][:cohort_id])

    Wearing.create(shirt: shirt, cohort: cohort)
    redirect_to root_path, notice: "New wearing created"
  end
end
