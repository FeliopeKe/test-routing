class OrganizationsController < ApplicationController
  before_action :authenticate_user!
  
  def index
     @routes = Route.all
     @drivers = Driver.where(organization: current_user.organization)
     @vehicles = Vehicle.where(organization: current_user.organization)
  end

  def set_driver_and_vehicle
    puts(" aca los parametros tiene #{params.inspect}")
  end

end