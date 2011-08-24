class Vote
  include Mongoid::Document
  field :hubname, :type => String
  field :value, :type => Integer
  embedded_in :item, polymorphic: true
end
