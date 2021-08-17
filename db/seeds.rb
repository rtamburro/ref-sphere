# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Seeding Users"

4.times do
    user = User.new(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.safe_email, 
        password: "password",
        # role: Faker::Number.between(from: 1, to: 3),
        cell_phone: Faker::Number.number(digits: 10),
        work_phone: Faker::Number.number(digits: 10),
        home_phone: Faker::Number.number(digits: 10),
        address: {
            street_address: Faker::Address.street_address,
            city: Faker::Address.city,
            state: Faker::Address.state_abbr, 
            zip_code: Faker::Address.zip_code}
    )
    user.save!
end