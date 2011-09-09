class Hub
  include Mongoid::Document
  include Mongoid::Timestamps
  field :label, :type => String
  field :weight, :type => Integer, default:10
  key :label
  mount_uploader :image, ImageUploader
  embeds_many :ibits
  embeds_many :lbits
  embeds_many :qbits
  embeds_many :tbits
  has_and_belongs_to_many :hubs
  has_and_belongs_to_many :edges
  validates_presence_of :label
  validates_uniqueness_of :label
  attr_accessor :title
  attr_accessor :description
end
