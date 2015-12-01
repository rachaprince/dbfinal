class InternshipCommittee < ActiveRecord::Base
  belongs_to :internship
  belongs_to :home_c, :class_name => 'Committee'
  belongs_to :away_c, :class_name => 'Committee'
end
