class Department < ApplicationRecord

  belongs_to :center
  has_many :doctors

  validates :name, presence: true, uniqueness: true

end
