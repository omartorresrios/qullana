class Center < ApplicationRecord

  has_many :users
  has_many :doctors
  has_many :departments

end
