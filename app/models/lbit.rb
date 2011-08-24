class Lbit
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongo::Voteable
  voteable self, :up => 1, :down => -2
  field :title
  field :description
  field :url
  embedded_in :hubs, :inverse_of => :lbits
end
