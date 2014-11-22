class Incident < ActiveRecord::Base
  has_many :scenes
  has_many :scene_assignments
  has_many :entries
  has_one :task
  has_one :timer
  has_many :checkoffs, :through => :checkoff_incidents
  has_many :checkoff_incidents
  has_many :assets, :through =>  :incident_assignments
  has_many :incident_assignments
  belongs_to :scene_type
  belongs_to :battalion
  belongs_to :incident_strategy

  after_create :create_action
  after_update :update_action
  before_update :before_update

  attr_accessor :email_address

  #accepts_nested_attributes_for :scenes, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :scenes, :allow_destroy => true
  accepts_nested_attributes_for :scene_assignments, :allow_destroy => true
  accepts_nested_attributes_for :incident_assignments, :allow_destroy => true


  def create_action
    @entry = Entry.new(incident_id: self.id, name: "Incident: #{self.name} created. Strategy set to #{self.incident_strategy.name}")
    @entry.save

    @incident_checkoffs = Checkoff.where(:checkofftype => "incident");
    @incident_checkoffs.each do |m|
      CheckoffIncident.create(incident_id:self.id, checkoff_id:m.id, status:"incomplete")
    end



    #self.scenes.each do |scene|
    #  @scene_entry = Entry.new(incident_id: self.id, name: "Created Scene - #{scene.name}")
    #  @scene_entry.save
    #end

  end

  def update_action
    @after = Incident.find(self.id)


    if self.end_time != nil
      t = self.end_time - self.created_at
      mm, ss = t.divmod(60)
      hh, mm = mm.divmod(60)
      dd, hh = hh.divmod(24)
      @duration= "%d days, %d hours, %d minutes and %d seconds" % [dd, hh, mm, ss]

      @entry = Entry.new(incident_id: self.id, name: "Incident has ended. Duration: #{@duration}")
      @entry.save
    end

    self.attributes.each do |k,v|
      unless k=="id" or k == "id" or k=="updated_at" or k=="created_at" or k=="end_time"
        unless v == @@before[k]
            @entry = Entry.new(incident_id: self.id, name: "#{k} was changed.")
            @entry.save
        end
      end
    end
  end

  def before_update
    @@before = Incident.find(self.id)
  end

end
