namespace :create_data do
  desc "create admin"
  task admin: :environment do
    user_admin = User.create!(name: 'admin', 
                              email: 'admin@gmail.com',
                              role: 'admin',
                              password: '12345678')
    puts '=======> Create successfully.'
  end

  task user: :environment do
    1000.times do |t|
      User.create!(name: "test #{t}",
                  email: "test#{t}@gmail.com",
                  password: '12345678')
    end

    puts '=======> success'
  end
end
