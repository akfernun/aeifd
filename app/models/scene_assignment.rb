class SceneAssignment < ActiveRecord::Base
   belongs_to :scene
   belongs_to :asset
   belongs_to :location
   belongs_to :asset_role
   belongs_to :incident
   
   accepts_nested_attributes_for :asset
end
