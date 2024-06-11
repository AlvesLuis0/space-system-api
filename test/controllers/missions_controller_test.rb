# frozen_string_literal: true

require 'test_helper'

class MissionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mission = missions(:valid)
  end

  test 'should get index' do
    get missions_url
    assert_response :success
  end

  test 'should create mission' do
    assert_difference('Mission.count') do
      post missions_url, params: { mission: @mission }, as: :json
    end
    assert_response :created
  end

  test 'should show mission' do
    get mission_url(@mission)
    assert_response :success
  end

  test 'should update mission' do
    patch mission_url(@mission), params: { mission: @mission }, as: :json
    assert_response :success
  end

  test 'should destroy mission' do
    assert_difference('Mission.count', -1) do
      delete mission_url(@mission)
    end
    assert_response :no_content
  end
end
