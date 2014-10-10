class Incident < ActiveRecord::Base
  has_many :scenes
  has_many :scene_assignments
  has_many :entries

  after_create :create_action
  #after_update :update_action
  
  #accepts_nested_attributes_for :scenes, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :scenes
  accepts_nested_attributes_for :scene_assignments
  

  def create_action
    @entry = Entry.new(incident_id: self.id, name: "Incident: #{self.name} created.")
    @entry.save
    
          
    #self.scenes.each do |scene|
    #  @scene_entry = Entry.new(incident_id: self.id, name: "Created Scene - #{scene.name}")
    #  @scene_entry.save
    #end

  end

  def update_action
    @entry = Entry.new(incident_id: self.id, name: "Updated Incident - #{self.name}")
    @entry.save
     
    @scene_entry = Entry.new(incident_id: self.id, name: "Created Scene - #{self.scenes.last.name}")
    @scene_entry.save
  end

end
