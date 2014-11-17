class Mayday < ActiveRecord::Base
	belongs_to :incident_assignment
	has_many :mayday_assignments
	has_many :assets, :through =>  :mayday_assignments

	after_create :create_action

	accepts_nested_attributes_for :mayday_assignments, :allow_destroy => true

 def create_action
 	get_incident_assignment = IncidentAssignment.find(self.incident_assignment_id)
 	rit = IncidentAssignment.where(incident_id: get_incident_assignment.incident_id, asset_role_id: 5  )
 	logger.debug "************************************************#{rit[0].asset.name}"
    @entry = Entry.new(incident_id: get_incident_assignment.incident_id, name: "Mayday Created.  RIT Team - #{rit[0].asset.name} - has responded to a Mayday for #{get_incident_assignment.asset.name}")
    @entry.save
  end
end
