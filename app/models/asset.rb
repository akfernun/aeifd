class Asset < ActiveRecord::Base
  has_many :scene_assignments
  has_many :incident_assignments
  has_many :mayday_assignments
  has_many :scenes, :through => :scene_assignments
  has_many :incidents, :through => :incident_assignments
  has_many :maydays, :through => :mayday_assignments
  belongs_to :battalion
end
