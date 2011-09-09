class Edge
  include Mongoid::Document
  include Mongoid::Timestamps
  field :label, :type => String
  mount_uploader :image, ImageUploader
  has_and_belongs_to_many :hubs
end
