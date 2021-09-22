class Movie < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 160 }
  validates :year, presence: true, numericality: { only_integer: true, greater_than: 0 }, length: { maximum: 45 }
  validates :description, presence: true, length: { maximum: 500 }
  validates :image_url, presence: true, length: { maximum: 150 }
  validates :is_showing, presence: true
end
