class PagesController < ApplicationController
	def about
		@title = "About us"
		@content = 'Created by: Sebastian Reyes, Adina Chen, Andrew Chen, Amy Doo, and Winnie Wu. '
	end
end
