class UsersController < ApplicationController
  include UsersHelper
  before_action :get_user
  before_action :can_edit?

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = 'Cool beans. All updated.'
    else
      render action: 'edit'
    end
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

end
