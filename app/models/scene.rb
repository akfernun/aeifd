class Scene < ActiveRecord::Base
  has_many :scene_assignments
  has_many :assets, :through => :scene_assignments
  
  belongs_to :incident
  belongs_to :scene_type
  
  accepts_nested_attributes_for :scene_assignments, :allow_destroy => true
  
   after_create :create_action
   before_save :get_incident_id
   
   attr_accessor :incident_id
  
   def create_action
    @entry = Entry.new(incident_id: @incident_id, name: "Exposure: #{self.name} Created.  Structure Type: #{self.scene_type.name}")
    @entry.save
   end 
   
   def get_incident_id 
     @incident_id = self.incident.id
   end
end
