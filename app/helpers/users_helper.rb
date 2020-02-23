module UsersHelper
  def authentica_micropost?(micropost)
    micropost.user == current_user
  end
end
