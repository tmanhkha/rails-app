require 'benchmark'
require 'bcrypt'

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
    # ~ 20 minutes
    time = Benchmark.measure do
      10000.times do |t|
        User.create!(name: "test #{t}",
                    email: "test#{t}@gmail.com",
                    password: '12345678')
      end
    end

    puts "=======> success #{time}"
  end

  task user_optimize: :environment do
    # ~ 1.2 seconds
    time = Benchmark.measure do
      password = BCrypt::Password.create('12345678')
      data = 10000.times.map do |t|
        { 
          name: "test #{t}",
          email: "test#{t}@gmail.com",
          password_digest: password,
          created_at: Time.now, 
          updated_at: Time.now
        }
      end
      User.insert_all(data)

    end
    puts "=======> success #{time}"
  end
end
