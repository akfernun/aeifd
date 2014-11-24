class CheckoffMayday < ActiveRecord::Base

	belongs_to :mayday
	belongs_to :checkoff
end
