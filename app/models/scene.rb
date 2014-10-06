class Scene < ActiveRecord::Base
  has_many :scene_assignments
  has_many :assets, :through => :scene_assignments
  
  belongs_to :incident
  belongs_to :scene_type
  
  accepts_nested_attributes_for :scene_assignments, :allow_destroy => true
  
end
