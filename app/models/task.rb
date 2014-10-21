class Task < ActiveRecord::Base
	belongs_to :incident

	before_update :before_update_tasks

	def before_update_tasks
		self.attributes.each do |k,v|
			if k != "id" || k!= "incident_id"
				logger.debug "asd;fjasdlkfjas;ljfa;slkdjf"
				if v == 1
					logger.debug "Something is true"
				end
			end
		end
	end
end
