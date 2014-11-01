class Battalion < ActiveRecord::Base

	has_many :assets
	has_many :scenes
end
