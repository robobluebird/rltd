class Tbit
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongo::Voteable
  voteable self, :up => 1, :down => -2
  field :title
  field :body
  embedded_in :hubs, :inverse_of => :tbits
end
