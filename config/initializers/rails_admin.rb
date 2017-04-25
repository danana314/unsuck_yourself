RailsAdmin.config do |config|

  config.authorize_with do
	  current_user = User.find_by(id: session[:user_id])
	  unless current_user.try(:admin?)
			flash[:notice] = 'That page does not exist.'
      redirect_to main_app.root_path unless current_user.try(:is_admin?)
    end
  end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    # bulk_delete
    show
    edit
    # delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
