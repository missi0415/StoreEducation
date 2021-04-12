class HomesController < ApplicationController
  def top
  end
  
  def guest_sign_in
    user = Manager.find_or_create_by!(email: 'manager@example.com') do |user|
      manager.password = "password"
    end
    
    sign_in manager
    redirect_to manager_groups_path, notice: 'ゲストユーザーとしてログインしました。'
  end
  
  def about
  end
end
