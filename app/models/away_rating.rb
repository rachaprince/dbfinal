class AwayRating < ActiveRecord::Base
  belongs_to :internship
  belongs_to :committee
end
