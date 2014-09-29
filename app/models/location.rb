class Location < ActiveRecord::Base
  has_many :scene_assignments
end
