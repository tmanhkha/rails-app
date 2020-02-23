namespace :create_admin do
  desc "create admin"
  task admin: :environment do
    user_admin = User.create!(name: 'admin', 
                              email: 'admin@gmail.com',
                              role: 'admin',
                              password: '12345678')
    puts '=======> Create successfully.'
  end
end
