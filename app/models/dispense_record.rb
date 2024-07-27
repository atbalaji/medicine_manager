class DispenseRecord < ApplicationRecord
  belongs_to :prescription

  validates :prescription, presence: true
  validates :dispense_time, presence: true
  validate :dispense_time_cannot_be_in_the_future


  private

  def dispense_time_cannot_be_in_the_future
    return if dispense_time.blank?

    errors.add(:dispense_time, "can't be in the future") if dispense_time > Time.current
  end
end
