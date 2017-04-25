module ApplicationHelper

	def validation_errors(object)
		if object.errors.any?
			content = ''
			object.errors.full_messages.each_with_index do |msg, i|
				content += "Whoopsie: " if i == 0
				content += ', ' if i != 0
				content += msg
			end
			content = content_tag(:p, content)
			content_with_div = content_tag(:div, class: "alert alert-danger validation-errors") do
				content
			end
			content_with_div.html_safe
		end
	end

end
