class ProfilesController < ApplicationController
  def show
    authorize current_user
  end

  def edit
    authorize current_user
  end

  def update
    authorize current_user
    if current_user.update(profile_params)
      redirect_to profile_path
    else
      render :show
    end
  end

  private

  def profile_params
    params.require(:user).permit(:email, :first_name, :last_name, :avatar)
  end
end