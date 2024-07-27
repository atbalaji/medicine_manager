class Prescription < ApplicationRecord
  belongs_to :user
  belongs_to :medicine

  validates :dosage, presence: true
  validates :frequency, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  validate :end_date_after_start_date
  validate :dates_in_valid_range

  private

  def end_date_after_start_date
    if end_date.present? && start_date.present? && end_date <= start_date
      errors.add(:end_date, 'must be after the start date')
    end
  end

  def dates_in_valid_range
    return if start_date.blank? || end_date.blank?

    if start_date < 1.year.ago.to_date || start_date > Date.today
      errors.add(:start_date, "must be within a valid range")
    end

    if end_date < Date.today || end_date > 1.year.from_now.to_date
      errors.add(:end_date, "must be within a valid range")
    end
  end

end
