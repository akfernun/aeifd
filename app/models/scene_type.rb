class SceneType < ActiveRecord::Base
  has_many :scenes
  has_many :incidents
end
