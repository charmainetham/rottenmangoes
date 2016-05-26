User.create!(firstname: "Charmaine",
            lastname: "Tham",
            email: "charmainetham@example.com",
            password: "alberta",
            password_confirmation: "alberta",
            admin: true)

25.times do |n|
    firstname = Faker::Name.first_name
    lastname = Faker::Name.last_name
    email = "example-#{n+1}@example.com"
    password = "password"
    User.create!(firstname: firstname,
                 lastname: lastname,
                 email: email,
                 password: password,
                 password_confirmation: password)
end
