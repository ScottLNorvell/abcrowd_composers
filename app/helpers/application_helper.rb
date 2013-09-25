module ApplicationHelper
	
	def get_heading
		heading = "ABCrowdComposers"

		if subject = session[:subject]
			heading += "::#{subject}"

			if topic = session[:topic]
				heading += "::#{topic}"
			end 
		end

		return heading
	end

	
	
end
