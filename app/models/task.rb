class Task < ActiveRecord::Base
	belongs_to :incident

	before_update :before_update_tasks

	def before_update_tasks
		before_update_record = Task.find(self.id)
		# logger.debug "this is the before #{before_update_record[:id]}"
		self.attributes.each do |k,v|
			unless k=="id" or k == "incident_id" or k=="updated_at" or k=="created_at"
				unless v == before_update_record[k]

					logger.debug "This is v #{v} and this is before #{before_update_record[k]}"

					@entry = Entry.new(incident_id: self.incident_id, name: "Benchmark: #{k} was completed.")
    				@entry.save
				end
			end
		end

		self.attributes.each do |k,v|
			if k == "primar_search"
				if v == true
					logger.debug "We're in"
					@timer = Timer.new(:incident_id => self.incident_id);
					@timer.primary_search = Time.now
					@timer.save
				end
			end
		end



	end
end
