class Doctor < ApplicationRecord

  has_many :time_slots
  has_many :appointments, through: :time_slots
  has_many :users, through: :appointments
  belongs_to :center
  belongs_to :department
  
  EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false },
                    format: { with: EMAIL_REGEX }
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  def just_name
  	if self.time_slots.is_filled == false
  	  self.name
    end
  end

end
