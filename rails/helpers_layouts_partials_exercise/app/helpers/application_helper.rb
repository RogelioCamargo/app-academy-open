module ApplicationHelper
	def auth_token 
		"<input>
		type='hidden'
		name='authenticity_token'
		value='#{form_authenticity_token}'
		/>".html.safe
	end
end
