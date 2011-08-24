class Edge
  include Mongoid::Document
  include Mongoid::Timestamps
  field :label, :type => String
  field :weight, :type => Integer, default:10
  key :label
  has_and_belongs_to_many :ibits
  has_and_belongs_to_many :lbits
  validates_presence_of :label
  validates_uniqueness_of :label
end
