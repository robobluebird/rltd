class Hub
  include Mongoid::Document
  include Mongoid::Associations::EmbeddedCallbacks
  include Mongoid::Timestamps
  field :label, :type => String
  field :weight, :type => Integer, default:10
  key :label
  embeds_many :ibits
  embeds_many :lbits
  embeds_many :qbits
  embeds_many :tbits
  has_and_belongs_to_many :hubs
  validates_presence_of :label
  validates_uniqueness_of :label
end
