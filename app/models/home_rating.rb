class HomeRating < ActiveRecord::Base
  belongs_to :participant
  belongs_to :committee
end
