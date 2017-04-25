class UsersController < ApplicationController
  before_action :get_user
  before_action :can_edit?

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = 'Cool beans. All updated.'
    else
      #
    end
    render action: 'edit'
  end

  private

  def get_user
    @user = User.find(params[:id])
  end

  def can_edit?
    unless current_user == @user || current_user.admin?
      flash[:notice] = 'Sorry, we can\'t bring you there'
      redirect_to home_index_path
    end
  end

  def user_params
    params.require(:user).permit(:username)
  end
end
