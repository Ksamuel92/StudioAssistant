require 'faker'

Faker::Name.name      #=> "Christophe Bartell"

Faker::Internet.email #=> "kirsten.greenholt@corkeryfisher.info"


User.create(name: Faker::Name.name,  )

User.create(:name => "Trisha", :email => "trisha@test.com", :location => "Austin, TX", :password => "1234")
RecordingSession.create(:start_date => "01/01/2020", :end_date => "01/02/2020", :per_hour => "125.00", :hours_per_day => "8")