module UsersHelper
  def authentica_micropost?(micropost)
    current_user && ((micropost.user == current_user) || (current_user.role == 'admin'))
  end
end
