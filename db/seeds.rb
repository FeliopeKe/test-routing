# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Driver.all.destroy_all
Organization.all.destroy_all
Route.all.destroy_all
User.all.destroy_all
Vehicle.all.destroy_all

Organization.create(name: 'Routing')
Organization.create(name: 'Pricing')
User.create(email: 'felipe@avispa.tech', national_id: '20121137-9', subject: 201211379, organization: Organization.first, password:'123123123')
Vehicle.create(plate: 'VE1', organization: Organization.first)
Vehicle.create(plate: 'VE2', organization: Organization.first)
Vehicle.create(plate: 'VE3', organization: Organization.first)
Vehicle.create(plate: 'VE4', organization: Organization.first)
Vehicle.create(plate: 'VE5', organization: Organization.first)
Vehicle.create(plate: 'VE6', organization: Organization.last)
Vehicle.create(plate: 'VE7', organization: Organization.last)
Vehicle.create(plate: 'VE8', organization: Organization.last)
Driver.create(name: 'Diego', organization: Organization.first)
Driver.create(name: 'Carlos', organization: Organization.first)
Driver.create(name: 'Adán', organization: Organization.first)
Driver.create(name: 'Andrea', organization: Organization.last)
Driver.create(name: 'Mauro', organization: Organization.last)
Route.create(starts_at: Time.zone.local(2022, 9, 10, 9, 0, 0), ends_at: Time.zone.local(2022, 9, 10, 11, 30, 0))
Route.create(starts_at: Time.zone.local(2022, 9, 10, 9, 0, 0), ends_at: Time.zone.local(2022, 9, 10, 10, 10, 0))
Route.create(starts_at: Time.zone.local(2022, 9, 10, 11, 0, 0), ends_at: Time.zone.local(2022, 9, 10, 13, 30, 0), vehicle_id: Vehicle.first.id, driver_id: Driver.first.id, aasm_state: 'assigned')