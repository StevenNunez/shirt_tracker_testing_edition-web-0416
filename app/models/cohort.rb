class Cohort < ActiveRecord::Base
  has_many :wearings
  has_many :worn_shirts, through: :wearings, source: :shirt

  def in_session?
    (start_date..end_date).include?(Date.today)
  end

  def wear(shirt)
    self.wearings.create(shirt: shirt)
  end

  def available_shirts
    Shirt.where.not(id: worn_shirts.pluck(:id))
  end
end
