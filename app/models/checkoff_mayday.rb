class CheckoffMayday < ActiveRecord::Base

	belongs_to :mayday
	belongs_to :checkoff

	after_update :update_action

	def update_action
		@mayday = Mayday.where(id: self.mayday_id)
		@entry = Entry.new(:incident_id => @mayday.incident_id, :name => "Mayday Checkoff Completed: #{self.checkoff.name}")
		@entry.save
	end
end
