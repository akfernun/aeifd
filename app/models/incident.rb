class Incident < ActiveRecord::Base
  has_many :scenes
  has_many :scene_assignments
  has_many :entries
  has_one :task
  has_one :timer
  has_many :assets, :through =>  :incident_assignments
  has_many :incident_assignments
  belongs_to :scene_type
  belongs_to :battalion

  after_create :create_action
  #after_update :update_action

  #accepts_nested_attributes_for :scenes, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :scenes, :allow_destroy => true
  accepts_nested_attributes_for :scene_assignments, :allow_destroy => true
  accepts_nested_attributes_for :incident_assignments, :allow_destroy => true


  def create_action
    @entry = Entry.new(incident_id: self.id, name: "Incident: #{self.name} created.")
    @entry.save

    @task = Task.new(incident_id: self.id)
    @task.save

    twmin = (20*60)
    fifmin = (15*60)
    tenmin = (10*60)
    onemin = (1*60)

    @timer = Timer.new(incident_id: self.id, primary_search: Time.now+onemin, all_clear: Time.now+fifmin, utilities_contacted: Time.now+tenmin, safety_officer_arrived: Time.now+tenmin)

    @timer.save




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
