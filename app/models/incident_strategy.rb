class IncidentStrategy < ActiveRecord::Base
	has_many :incidents
	has_many :scenes
end
