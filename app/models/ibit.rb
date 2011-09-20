class Ibit
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongo::Voteable
  field :title
  field :description
  field :posted_by
  mount_uploader :image, ImageUploader
  embedded_in :hub, :inverse_of => :ibits
  # validates_presence_of :image
end
