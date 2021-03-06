class Onboarding::SessionsController < ApplicationController

# This is the action triggered by login link
  def new
    # We don't sign in user with token which expired
    user = User.where(login_token: params[:token])
             .where('login_token_valid_until > ?', Time.now).first

    if user
      # Here we nullify login token so it can't be reused
      user.update!(login_token: nil, login_token_valid_until: 1.year.ago)

      user.update_tracked_fields!(request)

      self.current_user = user

      if user.sign_in_count == 1
        redirect_to tour_index_path
      else
        redirect_to home_index_path, notice: 'Signed-in successfully'
      end
    else
      redirect_to new_login_path, alert: 'Invalid or expired login link'
    end
  end

  # Simple sign-out. Just set current user to NullUser
  def destroy
    self.current_user = nil
    redirect_to new_login_path, notice: 'Successfully signed-out'
  end

end
