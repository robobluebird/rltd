class Profile
  include Mongoid::Document
  field :nickname
  field :bio
  embeds_one :ibit
  embedded_in :user
end
