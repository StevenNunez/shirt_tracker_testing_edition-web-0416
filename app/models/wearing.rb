class Wearing < ActiveRecord::Base
  belongs_to :cohort
  belongs_to :shirt
end
