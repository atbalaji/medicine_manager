class Patient < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
end
