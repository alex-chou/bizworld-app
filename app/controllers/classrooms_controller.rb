class ClassroomsController < ApplicationController

	def new
		@teacher = session[:teacher]
	end

	def create
		@teacher = session[:teacher]
		@teacher.classrooms.create(params[:classroom])
		redirect_to teacher_path(@teacher)
	end

  def create_link
#    require 'bitly'
    teacher = session[:teacher]
    classroom = Classroom.find(params[:id])
    
    teacher_name = teacher.name.split(' ').join('+')
    school = teacher.school_name.split(' ').join('+')
    city = teacher.city.split(' ').join('+')
    state = teacher.state.split(' ').join('+')
    base_url = %Q{https://docs.google.com/a/bizworld.org/forms/d/192Eqjup01aq3zAvTS-P9wFTCJZChaGNHDAusrUKMd6o/viewform?}
    school_field = %Q{&entry.1402717777=} + school
    teacher_field = %Q{&entry.363323870=} + teacher_name
    city_field = %Q{&entry.819974938=} + city
    state_name = %Q{&entry.1920272073=} + state
    tail_url = %Q{&entry.942453101&entry.1463927784}
    survey_url = base_url + school_field + teacher_field + city_field + state_name + tail_url

#    bitly = Bitly.new('cs169bizworld', 'R_b3491d455043441192ad7e645659cbd0')
#    @prefilledURL = bitly.shorten(survey_url).short_url
    @prefilledURL = survey_url
  end

end
