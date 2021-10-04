class Reservation < ApplicationRecord
  belongs_to :schedule
  has_many :sheets, dependent: :destroy
  validates :email, presence: true, length: { maximum: 300 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
end
