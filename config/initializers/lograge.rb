# Rails.application.configure do
# 	config.lograge.enabled = true
#
# 	# including exceptions
# 	config.lograge.custom_options = lambda do |event|
# 		{
# 			exception: event.payload[:exception], # ["ExceptionClass", "the message"]
# 			exception_object: event.payload[:exception_object] # the exception instance
# 		}
#
#
# 	end
#
# 	# including params
# 	config.lograge.custom_options = lambda do |event|
# 		exceptions = %w(controller action format id)
# 		{
# 			params: event.payload[:params].except(*exceptions)
# 		}
# 	end
# end