class Player < ApplicationRecord
  belongs_to :event
  validates :name, presence: true, uniqueness: { scope: :event_id, message: "Someone has already chosen that name" }
  # validates :country_code, presence: true, uniqueness: { scope: :event_id, message: "Someone has already chosen this country" }
end
