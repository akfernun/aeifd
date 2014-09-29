class Asset < ActiveRecord::Base
  has_many :scene_assignments
  has_many :scenes, :through => :scene_assignments
end
