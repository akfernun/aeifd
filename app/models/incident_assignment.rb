class IncidentAssignment < ActiveRecord::Base

	belongs_to :incident
	belongs_to :location
	belongs_to :asset_role
	belongs_to :asset

	accepts_nested_attributes_for :asset, :allow_destroy => true


	before_save :get_incident_id
	after_create :create_action

	private

	 def create_action
	    @entry = Entry.new(incident_id: @incident_id, name: "#{self.asset.name} - assigned role #{self.asset_role.name} #{self.location.name} to Incident: #{self.incident.name}")
	    @entry.save
   	end

   	def get_incident_id
     @incident_id = self.incident.id
   	end

end
