namespace :populate do
  desc "Populate Users, Stores, Departments, and Products"
  task users: :environment do
  	50.times do
  	  user = User.new
  	  user.first_name = Faker::Name.first_name
  	  user.last_name = Faker::Name.last_name
  	  user.email = Faker::Internet.safe_email
  	  user.password = 'password'
  	  user.save
  	  store = user.stores.create(name: Faker::Company.name, location: Faker::Address.street_address,
  	  	                 owner: "#{user.first_name} #{user.last_name}", 
  	  	                 color: ['red', 'orange', 'blue', 'green', 'purple', 'pink'].sample)
  	  5.times do
  	  	department = store.departments.create(name: Faker::Commerce.department, phone_number: Faker::PhoneNumber.cell_phone)

  	  	10.times do
  	  		department.products.create(name: Faker::Commerce.product_name, price: Faker::Number.number(rand(1..3)), details: Faker::ChuckNorris.fact)
  	  	end
  	  end
  	end
  	puts 'Ecommerce Data Populated'
  end

end