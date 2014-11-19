class IncidentAssignment < ActiveRecord::Base

	belongs_to :incident
	belongs_to :location
	belongs_to :asset_role
	belongs_to :asset
	has_many :maydays

	accepts_nested_attributes_for :asset, :allow_destroy => true


	before_save :get_incident_id
	after_create :create_action
	after_update :update_action

	private

	 def create_action
	    @entry = Entry.new(incident_id: @incident_id, name: "#{self.asset.name} - assigned role #{self.asset_role.name} - location #{self.location.name}")
	    @entry.save
   	end

   	def get_incident_id
     @incident_id = self.incident.id
   	end

   	def update_action
      @entry = Entry.new(incident_id: @incident_id, name: "Updated Assignment for #{self.asset.name} - Now Assigned role #{self.asset_role.name} - location #{self.location.name} ")
      @entry.save
    end

end
