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

  ASSIGNABLES = %w[vehicle driver].freeze

  ASSIGNABLES.each do |assignable|
    # Checks if the times of routes permit to assing
    #
    # @return [Boolean] true if can assing, otherwise false
    define_method :"can_assing_#{assignable}?" do |assignable|
      routes = assignable.routes
      routes.each do |r|
        return true if r == self
        return false if r.starts_at.between?(starts_at, ends_at)
        return false if r.ends_at.between?(starts_at, ends_at)
      end
      true
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

  def hours_duration
    date_aux = ((ends_at - starts_at)/1.minutes.second).abs.to_i
    minutes = date_aux%60
    hours = date_aux/60
    return "#{hours}H" if minutes.zero?
    "#{hours}H #{minutes}M"
  end

  def starts_at_hour
    starts_at.strftime("%H:%M")
  end

  def ends_at_hour
    ends_at.strftime("%H:%M")
  end

  def date
    starts_at.strftime("%d-%m-%Y")
  end

end
