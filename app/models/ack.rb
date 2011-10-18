class Ack
  include Mongoid::Document
  include Mongoid::Timestamps
  recursively_embeds_many
  field :author
  field :body
  embedded_in :ackable, polymorphic: true
end
