class Checkoff < ActiveRecord::Base

	has_many :checkoff_incidents
	has_many :incidents, :through => :checkoff_incidents
	has_many :checkoff_maydays
	has_many :maydays, :through => :checkoff_maydays

end
