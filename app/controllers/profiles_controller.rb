class ProfilesController < ApplicationController
  def show
    authorize current_user
  end

  def edit
    authorize current_user
  end

  def update
    authorize current_user
    if current_user.update(user_params)
      redirect_to edit_profile_path
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:user).permit(:email, :first_name, :last_name, :avatar)
  end
end
