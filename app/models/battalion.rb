class Battalion < ActiveRecord::Base

	has_many :assets
	has_many :scenes
	has_many :incidents

end
