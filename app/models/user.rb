class User
  include Mongoid::Document
  include Mongo::Voter
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  field :points, type: Integer, default: 0
  has_and_belongs_to_many :acks
end
