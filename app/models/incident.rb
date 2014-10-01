class Incident < ActiveRecord::Base
  has_many :scenes
  has_many :scene_assignments
  has_many :entries
  
  after_save :make_entry
  
  accepts_nested_attributes_for :scenes, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :scene_assignments
  
  def make_entry
    @entry = Entry.new(incident_id: self.id, name: "Incident - #{self.name} - was created at #{self.created_at}")
    @entry.save
  end
end
