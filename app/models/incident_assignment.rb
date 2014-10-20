class IncidentAssignment < ActiveRecord::Base

	belongs_to :incident
	belongs_to :location
	belongs_to :asset_role
	belongs_to :asset

	accepts_nested_attributes_for :asset


end
