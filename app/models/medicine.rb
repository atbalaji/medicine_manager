class Medicine < ApplicationRecord
  validates :name, presence: true
  validates :dosage, presence: true
end
