module Trackable
	extend ActiveSupport::Concern

	included do
	end

	def update_tracked_fields(request)
		old_current, new_current = self.current_sign_in_at, Time.now.utc
		self.last_sign_in_at     = old_current || new_current
		self.current_sign_in_at  = new_current

		old_current, new_current = self.current_sign_in_ip, request.remote_ip
		self.last_sign_in_ip     = old_current || new_current
		self.current_sign_in_ip  = new_current

		self.sign_in_count ||= 0
		self.sign_in_count += 1
	end

	def update_tracked_fields!(request)
		update_tracked_fields(request)
		save(validate: false)
	end

	module ClassMethods
	end

end