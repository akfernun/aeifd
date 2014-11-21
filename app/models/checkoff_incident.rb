class CheckoffIncident < ActiveRecord::Base
	belongs_to :incident
	belongs_to :checkoff

	after_update :update_action

	def update_action

		@entry = Entry.new(:incident_id => self.incident_id, :name => "#{self.checkoff.name} was completed."  )
		@entry.save

	end

end
