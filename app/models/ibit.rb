class Ibit
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongo::Voteable
  field :posted_by
  mount_uploader :image, ImageUploader
  embedded_in :hub
  embedded_in :profile
  validates_presence_of :image
end
