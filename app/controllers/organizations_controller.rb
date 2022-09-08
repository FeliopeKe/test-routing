class OrganizationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_params, only: :set_driver_and_vehicle
  
  def index
     @routes = Route.all.order(:id)
     @drivers = Driver.where(organization: current_user.organization)
     @vehicles = Vehicle.where(organization: current_user.organization)
  end

  def set_driver_and_vehicle
    return 'Error' unless @route.can_assing_driver?(@driver)
    return 'Error' unless @route.can_assing_vehicle?(@vehicle)
    @route.update(vehicle_id: @vehicle.id, driver_id: @driver.id)
  end

  def set_params
    @route = Route.find(params[:route_id])
    @vehicle = Vehicle.find(params[:vehicle_id])
    @driver = Driver.find(params[:driver_id])
  end
end