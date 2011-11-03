class Ack
  include Mongoid::Document
  include Mongoid::Timestamps
  field :sent_by, :type => String
  field :body, :type => String
  has_and_belongs_to_many :hubs
  has_and_belongs_to_many :users
end
