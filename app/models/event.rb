class Event < ApplicationRecord
  belongs_to :user
  has_many :players, dependent: :destroy
  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :date, presence: true
end
