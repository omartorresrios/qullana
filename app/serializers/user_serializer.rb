class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :username, :created_at#, :authentication_token

  has_many :appointments
  has_many :doctors, through: :appointments
  belongs_to :center
  
  def authentication_token
    JsonWebToken.encode({ user_id: object.id })
  end
end
