class Incident < ActiveRecord::Base
  has_many :scenes
  has_many :scene_assignments
  accepts_nested_attributes_for :scenes, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :scene_assignments
end
