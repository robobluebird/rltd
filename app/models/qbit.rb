class Qbit
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongo::Voteable
  voteable self, :up => 1, :down => -2
  field :quotee
  field :quote
  embedded_in :hubs, :inverse_of => :qbits
end
