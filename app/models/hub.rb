class Hub
  include Mongoid::Document
  include Mongoid::Timestamps
  field :label
  field :totalbits, type: Integer, default: 0
  key :label
  mount_uploader :image, ImageUploader
  embeds_many :ibits
  embeds_many :lbits
  embeds_many :qbits
  embeds_many :tbits
  validates_presence_of :label
  validates_uniqueness_of :label
  has_and_belongs_to_many :acks
  attr_accessor :title
end
