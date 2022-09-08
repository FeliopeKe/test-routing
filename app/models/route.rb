class Route < ApplicationRecord
  include AASM
  
  aasm logger: Rails.logger do
    state :pending, initial: true
    state :assigned, :finished

    event :assign do
      transitions from: :pending, to: :assigned
    end
    event :finish do
      transitions from: %i[pending assigned], to: :finished 
    end
  end

  def vehicle
    Vehicle.find_by(id: vehicle_id)
  end

  def driver
    Driver.find_by(id: driver_id)
  end

  def set_assigned
    return if aasm_state == 'assigned'
    return if driver_id.nil? || vehicle_id.nil?
    self.assign!
  end

  def hours
    @date_aux = ((starts_at - ends_at)/1.minutes.second).to_i
  end

end
