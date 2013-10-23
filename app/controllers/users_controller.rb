class UsersController < ApplicationController

  def new
    @reg = RegisterForm.new params[:register_form]
  end

  def create
    @reg = RegisterForm.new params[:register_form]

    user = @reg.save
    if user.present?
      Invite.activate_for(user)
      redirect_to time_shifts_url, :notice => t(:signed_up)
    else
      render :new
    end
  end

  def show
    @user = User.find params[:id]
    authorize_action_for @user
  end

end
