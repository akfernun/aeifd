class SceneAssignment < ActiveRecord::Base
   belongs_to :scene
   belongs_to :asset
   belongs_to :location
   belongs_to :asset_role
   belongs_to :incident
   
   accepts_nested_attributes_for :asset
   
   after_create :create_action
   
   attr_accessor :incident_id
   
   def create_action
    @entry = Entry.new(incident_id: params[:incident_id], name: "This was created by scene assignments")
    @entry.save
   end 
end
