require 'faker'

# Faker::Name.name      #=> "Christophe Bartell"

# Faker::Internet.email #=> "kirsten.greenholt@corkeryfisher.info"

User.create(
  name: "#{Faker::Name.name}",
  email: "#{Faker::Internet.email}",
  location: "#{Faker::Address.city}",
  password: "#{Faker::String.random}"
)
User.create(
  name: "#{Faker::Name.name}",
  email: "#{Faker::Internet.email}",
  location: "#{Faker::Address.city}",
  password: "#{Faker::String.random}"
)
User.create(
  name: "#{Faker::Name.name}",
  email: "#{Faker::Internet.email}",
  location: "#{Faker::Address.city}",
  password: "#{Faker::String.random}"
)
User.create(
  name: "#{Faker::Name.name}",
  email: "#{Faker::Internet.email}",
  location: "#{Faker::Address.city}",
  password: "#{Faker::String.random}"
)
User.create(
  name: "#{Faker::Name.name}",
  email: "#{Faker::Internet.email}",
  location: "#{Faker::Address.city}",
  password: "#{Faker::String.random}"
)
User.create(
  name: "#{Faker::Name.name}",
  email: "#{Faker::Internet.email}",
  location: "#{Faker::Address.city}",
  password: "#{Faker::String.random}"
)
User.create(
  name: "#{Faker::Name.name}",
  email: "#{Faker::Internet.email}",
  location: "#{Faker::Address.city}",
  password: "#{Faker::String.random}"
)
User.create(
  name: "#{Faker::Name.name}",
  email: "#{Faker::Internet.email}",
  location: "#{Faker::Address.city}",
  password: "#{Faker::String.random}"
)
User.create(
  name: "#{Faker::Name.name}",
  email: "#{Faker::Internet.email}",
  location: "#{Faker::Address.city}",
  password: "#{Faker::String.random}"
)
User.create(
  name: "#{Faker::Name.name}",
  email: "#{Faker::Internet.email}",
  location: "#{Faker::Address.city}",
  password: "#{Faker::String.random}"
)

RecordingSession.find_or_create_by(
  start_date: '01/01/2021',
  end_date: "#{Faker::Date.in_date_period}",
  per_hour: "#{Faker::Number.number(digits: 2)}",
  hours_per_day: "#{Faker::Number.number(digits: 1)}",
  band?: "#{Faker::Boolean.boolean}",
  has_producer?: "#{Faker::Boolean.boolean}",
  budget: '1500.24',
  genre: "#{Faker::Music.genre}"
)
RecordingSession.find_or_create_by(
  start_date: '01/02/2021',
  end_date: "#{Faker::Date.in_date_period}",
  per_hour: "#{Faker::Number.number(digits: 2)}",
  hours_per_day: "#{Faker::Number.number(digits: 1)}",
  band?: "#{Faker::Boolean.boolean}",
  has_producer?: "#{Faker::Boolean.boolean}",
  budget: '1500.24',
  genre: "#{Faker::Music.genre}"
)
RecordingSession.find_or_create_by(
  start_date: '01/03/2021',
  end_date: "#{Faker::Date.in_date_period}",
  per_hour: "#{Faker::Number.number(digits: 2)}",
  hours_per_day: "#{Faker::Number.number(digits: 1)}",
  band?: "#{Faker::Boolean.boolean}",
  has_producer?: "#{Faker::Boolean.boolean}",
  budget: '1500.24',
  genre: "#{Faker::Music.genre}"
)
RecordingSession.find_or_create_by(
  start_date: '01/04/2021',
  end_date: "#{Faker::Date.in_date_period}",
  per_hour: "#{Faker::Number.number(digits: 2)}",
  hours_per_day: "#{Faker::Number.number(digits: 1)}",
  band?: "#{Faker::Boolean.boolean}",
  has_producer?: "#{Faker::Boolean.boolean}",
  budget: '1500.24',
  genre: "#{Faker::Music.genre}"
)
RecordingSession.find_or_create_by(
  start_date: '01/05/2021',
  end_date: "#{Faker::Date.in_date_period}",
  per_hour: "#{Faker::Number.number(digits: 2)}",
  hours_per_day: "#{Faker::Number.number(digits: 1)}",
  band?: "#{Faker::Boolean.boolean}",
  has_producer?: "#{Faker::Boolean.boolean}",
  budget: '1500.24',
  genre: "#{Faker::Music.genre}"
)
RecordingSession.find_or_create_by(
  start_date: '01/06/2021',
  end_date: "#{Faker::Date.in_date_period}",
  per_hour: "#{Faker::Number.number(digits: 2)}",
  hours_per_day: "#{Faker::Number.number(digits: 1)}",
  band?: "#{Faker::Boolean.boolean}",
  has_producer?: "#{Faker::Boolean.boolean}",
  budget: '1500.24',
  genre: "#{Faker::Music.genre}"
)
RecordingSession.find_or_create_by(
  start_date: '01/07/2021',
  end_date: "#{Faker::Date.in_date_period}",
  per_hour: "#{Faker::Number.number(digits: 2)}",
  hours_per_day: "#{Faker::Number.number(digits: 1)}",
  band?: "#{Faker::Boolean.boolean}",
  has_producer?: "#{Faker::Boolean.boolean}",
  budget: '1500.24',
  genre: "#{Faker::Music.genre}"
)
RecordingSession.find_or_create_by(
  start_date: '01/08/2021',
  end_date: "#{Faker::Date.in_date_period}",
  per_hour: "#{Faker::Number.number(digits: 2)}",
  hours_per_day: "#{Faker::Number.number(digits: 1)}",
  band?: "#{Faker::Boolean.boolean}",
  has_producer?: "#{Faker::Boolean.boolean}",
  budget: '1500.24',
  genre: "#{Faker::Music.genre}"
)
RecordingSession.find_or_create_by(
  start_date: '01/09/2021',
  end_date: "#{Faker::Date.in_date_period}",
  per_hour: "#{Faker::Number.number(digits: 2)}",
  hours_per_day: "#{Faker::Number.number(digits: 1)}",
  band?: "#{Faker::Boolean.boolean}",
  has_producer?: "#{Faker::Boolean.boolean}",
  budget: '1500.24',
  genre: "#{Faker::Music.genre}"
)
RecordingSession.find_or_create_by(
  start_date: '01/10/2021',
  end_date: "#{Faker::Date.in_date_period}",
  per_hour: "#{Faker::Number.number(digits: 2)}",
  hours_per_day: "#{Faker::Number.number(digits: 1)}",
  band?: "#{Faker::Boolean.boolean}",
  has_producer?: "#{Faker::Boolean.boolean}",
  budget: '1500.24',
  genre: "#{Faker::Music.genre}"
)

Client.create(name: "#{Faker::Name.name}", email: "#{Faker::Internet.email}")
Client.create(name: "#{Faker::Name.name}", email: "#{Faker::Internet.email}")
Client.create(name: "#{Faker::Name.name}", email: "#{Faker::Internet.email}")
Client.create(name: "#{Faker::Name.name}", email: "#{Faker::Internet.email}")
Client.create(name: "#{Faker::Name.name}", email: "#{Faker::Internet.email}")
Client.create(name: "#{Faker::Name.name}", email: "#{Faker::Internet.email}")
Client.create(name: "#{Faker::Name.name}", email: "#{Faker::Internet.email}")
Client.create(name: "#{Faker::Name.name}", email: "#{Faker::Internet.email}")
Client.create(name: "#{Faker::Name.name}", email: "#{Faker::Internet.email}")
