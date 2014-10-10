class SceneAssignment < ActiveRecord::Base
   belongs_to :scene
   belongs_to :asset
   belongs_to :location
   belongs_to :asset_role
   belongs_to :incident
   
   accepts_nested_attributes_for :asset
   
   after_create :create_action
   before_save :get_incident_id
   
   attr_accessor :incident_id
   
   def create_action
    @entry = Entry.new(incident_id: @incident_id, name: "#{self.asset.name} - assigned role #{self.asset_role.name} #{self.location.name} to Exposure: #{self.scene.name}")
    @entry.save
   end 
   
   def get_incident_id 
     @incident_id = self.scene.incident.id
   end
end
