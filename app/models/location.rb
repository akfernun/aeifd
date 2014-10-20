class Location < ActiveRecord::Base
  has_many :scene_assignments
  has_many :incident_assignments
end
