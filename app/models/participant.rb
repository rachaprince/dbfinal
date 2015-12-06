class Participant < ActiveRecord::Base
	has_many :internships
	validates :email, :presence =>true, :uniqueness =>true
end
