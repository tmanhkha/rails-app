namespace :create_data do
  desc "create micropost"
  task :micropost, [:user_id] => [:environment] do |_, args|
    if User.find_by_id(args.user_id)
      micropost = Micropost.create!(title: 'Task title',
        content: 'Content',
        user_id: args.user_id)
      puts '===========> Create success.'
    else
      puts 'user not exist'
    end
  end
end
