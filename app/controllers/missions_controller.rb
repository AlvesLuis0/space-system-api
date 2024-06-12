# frozen_string_literal: true

class MissionsController < ApplicationController
  before_action :set_mission, only: %i[show update destroy]

  # GET /missions
  def index
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    @missions = Mission
                .select(:id, :name, :launch_date, :destination, :status)
                .order(launch_date: :desc)
    @missions.where!('launch_date >= ?', @start_date) if @start_date.present?
    @missions.where!('launch_date <= ?', @end_date) if @end_date.present?
    render json: @missions
  end

  # GET /missions/1
  def show
    render json: @mission
  end

  # POST /missions
  def create
    @mission = Mission.new(mission_params)
    if @mission.save
      render json: @mission, status: :created, location: @mission
    else
      render json: @mission.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /missions/1
  def update
    if @mission.update(mission_params)
      render json: @mission
    else
      render json: @mission.errors, status: :unprocessable_entity
    end
  end

  # DELETE /missions/1
  def destroy
    @mission.destroy!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_mission
    @mission = Mission.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def mission_params
    params
      .require(:mission)
      .permit(:name, :launch_date, :destination, :status, :crew, :duration_in_days, :cost, :details)
  end
end
