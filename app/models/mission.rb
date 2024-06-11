# frozen_string_literal: true

class Mission < ApplicationRecord
  STATUS_OPTIONS = %w[COMPLETED ACTIVE ABORTED].freeze

  validates :name, :launch_date, :destination, :status, :crew, :duration_in_days, :cost, :details, presence: true
  validates :launch_date, comparison: { less_than_or_equal_to: Date.today }
  validates :status, inclusion: { in: STATUS_OPTIONS, message: 'must be equal to COMPLETED, ACTIVE or ABORTED' }
  validates :duration_in_days, :cost, comparison: { greater_than: 0 }
end
