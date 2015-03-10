class ClassroomController < ActionController::Base
	 def generate_link
		survey_url = %Q{https://docs.google.com/a/bizworld.org/forms/d/192Eqjup01aq3zAvTS-P9wFTCJZChaGNHDAusrUKMd6o/viewform?entry.1402717777=#{}&entry.363323870=#{}&entry.819974938=GHI&entry.1920272073=JKL&entry.942453101&entry.1463927784}

		bitly = Bitly.new('cs169bizworld', 'R_b3491d455043441192ad7e645659cbd0')
		@prefilledURL = bitly.shorten(survey_url).short_url
	end
end
