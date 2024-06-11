# frozen_string_literal: true

require 'test_helper'

class MissionTest < ActiveSupport::TestCase
  ERRORS_EXPECTED = 8

  test 'should validate mission' do
    @mission = missions(:valid)
    assert @mission.validate!
  end

  test 'should invalidate mission' do
    @invalid_mission = missions(:invalid)
    assert_raises(ActiveRecord::RecordInvalid) do
      @invalid_mission.validate!
    end
    assert_equal(ERRORS_EXPECTED, @invalid_mission.errors.size, "Should show #{ERRORS_EXPECTED} errors.")
  end
end
