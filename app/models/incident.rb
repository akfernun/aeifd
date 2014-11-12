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
  belongs_to :incident_strategy

  after_create :create_action
  after_update :update_action

  attr_accessor :email_address

  #accepts_nested_attributes_for :scenes, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :scenes, :allow_destroy => true
  accepts_nested_attributes_for :scene_assignments, :allow_destroy => true
  accepts_nested_attributes_for :incident_assignments, :allow_destroy => true


  def create_action
    @entry = Entry.new(incident_id: self.id, name: "Incident: #{self.name} created. Strategy set to #{self.incident_strategy.name}")
    @entry.save

    @task = Task.new(incident_id: self.id, primar_search:false, all_clear:false, utilities_contacted:false, safety_officer_arrived:false, utilities_disconnected:false, secondary_search:false, fire_under_control:false)
    @task.save



    #self.scenes.each do |scene|
    #  @scene_entry = Entry.new(incident_id: self.id, name: "Created Scene - #{scene.name}")
    #  @scene_entry.save
    #end

  end

  def update_action
    @entry = Entry.new(incident_id: self.id, name: "Updated Incident - #{self.name}. Strategy is #{self.incident_strategy.name}")
    @entry.save

    # @scene_entry = Entry.new(incident_id: self.id, name: "Created Scene - #{self.scenes.last.name}")
    # @scene_entry.save
  end

end
