class Task < ActiveRecord::Base
	belongs_to :incident

	before_update :before_update_tasks

	def before_update_tasks
		before_update_record = Task.find(self.id)
		# logger.debug "this is the before #{before_update_record[:id]}"
		self.attributes.each do |k,v|
			unless k=="id" or k == "incident_id" or k=="updated_at" or k=="created_at"
				unless v == before_update_record[k]

					@entry = Entry.new(incident_id: self.incident_id, name: "Benchmark: #{k} was completed.")
    				@entry.save
				end
			end
		end
	end
end
