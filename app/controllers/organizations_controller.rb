class OrganizationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_params, only: :set_driver_and_vehicle
  
  def index
     @routes = Route.all.order(:id)
     @drivers = Driver.where(organization: current_user.organization)
     @vehicles = Vehicle.where(organization: current_user.organization)
     set_timeline
     set_timeline_painted
  end

  def set_driver_and_vehicle
    return redirect_to(organizations_path, alert: 'Error: Conductor con tope de horario') unless @route.can_assing_driver?(@driver)
    return redirect_to(organizations_path, alert: 'Error: Vehículo con tope de horario') unless @route.can_assing_vehicle?(@vehicle)
    
    @route.update(vehicle_id: @vehicle.id, driver_id: @driver.id)
    redirect_to(organizations_path, alert: 'Asignacion exitosa')
  end

  def set_params
    @route = Route.find(params[:route_id])
    @vehicle = Vehicle.find(params[:vehicle_id])
    @driver = Driver.find(params[:driver_id])
  end

  def set_timeline
    @time_hours = []
    init_of_day = Time.zone.today + 9.hours
    end_of_day = Time.zone.today + 18.hours
    while init_of_day <= end_of_day
      @time_hours << init_of_day.strftime("%H:%M")
      init_of_day = init_of_day + 15.minutes
    end
    @time_hours
  end

  def set_timeline_painted
    @time_hours_painted = [] 
    init_of_day = Time.zone.today + 9.hours + 1.days
    end_of_day = Time.zone.today + 18.hours + 1.days
    while init_of_day <= end_of_day
      @time_hours_painted << { time: init_of_day, hour: init_of_day.strftime("%H:%M") }
      init_of_day = init_of_day + 10.minutes
    end
    @time_hours_painted
  end
end