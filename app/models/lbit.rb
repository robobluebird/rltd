class Lbit
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongo::Voteable
  voteable self, :up => 1, :down => -2
  field :title
  field :description
  field :url
  field :posted_by
  embedded_in :hubs, :inverse_of => :lbits
end
