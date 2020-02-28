namespace :hello do
  desc 'puts hello'
  task puts_hello: :enviroment do
    puts 'hello'
  end
end
