require 'carrierwave/orm/mongoid'
class Ibit
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongo::Voteable
  field :title
  field :description
  mount_uploader :image, ImageUploader
  embedded_in :hub, :inverse_of => :ibits
end