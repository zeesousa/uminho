namespace :test_data do
  desc 'Add test users to the database'
  task create_users: :environment do
    names = Set.new
    genders = %w(Male Female)

    names.add(Faker::Name.name) while names.length < 50

    ActiveRecord::Base.transaction do
      for name in names do
        User.create(
          name: name,
          email: Faker::Internet.free_email(name),
          password: 12_345_678,
          password_confirmation: 12_345_678,
          gender: genders[rand(0..1)],
          birth_date: Faker::Date.between(50.years.ago, 18.years.ago),
          country: Faker::Address.country_code
        )
      end
    end
  end

  task create_reviews: :environment do
    ActiveRecord::Base.transaction do
      for product in Product.all do
        for user in User.all do
          Review.create(
            text: Faker::Hipster.paragraph,
            score: Faker::Number.between(0, 100),
            user: user,
            product: product
          )
        end
      end
    end
  end
end
