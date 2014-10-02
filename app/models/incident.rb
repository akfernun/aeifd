class Incident < ActiveRecord::Base
  has_many :scenes
  has_many :scene_assignments
  has_many :entries
  
  #after_create :make_entry
  after_create :create_action
  after_update :update_action
  
  #accepts_nested_attributes_for :scenes, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :scenes
  accepts_nested_attributes_for :scene_assignments
  
  #def make_entry
    #@entry = Entry.new(incident_id: self.id, name: "Created Incident - #{self.name}")
    #@entry.save
  #end

    def create_action
      @entry = Entry.new(incident_id: self.id, name: "Created Incident - #{self.name}")
      @entry.save
    end
    
    def update_action
      @entry = Entry.new(incident_id: self.id, name: "Updated Incident - #{self.name}")
      @entry.save
    end

end
