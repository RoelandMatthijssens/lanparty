module GamesHelper
	def games_view_selector_class(toggles_to)
		session[:games_view] == toggles_to ? "btn active" : "btn"
	end
end
