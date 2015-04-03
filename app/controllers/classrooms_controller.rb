class ClassroomsController < ApplicationController
  before_filter :authenticate_teacher!

  def new
  	@teacher = session[:teacher]
  end

  def create
  	@teacher = session[:teacher]
  	@teacher.classrooms.create(params[:classroom])
  	redirect_to teacher_path(@teacher)
  end

  def show
    @teacher = session[:teacher]
    params[:teacher_id] = @teacher.id
    if !@teacher.classrooms.include?(Classroom.find(params[:id].to_i))
      flash[:notice] = "You cannot access that classroom"
      redirect_to teacher_path(@teacher.id)
    end
    @classroom = Classroom.find(params[:id])
  end

  def create_link
    teacher = Teacher.find(params[:teacher_id])
    classroom = Classroom.find(params[:id])
    
    teacher_name = teacher.name.split(' ').join('+')
    school = teacher.school_name.split(' ').join('+')
    city = teacher.city.split(' ').join('+')
    state = teacher.state.split(' ').join('+')
    base_url = %Q{https://docs.google.com/a/bizworld.org/forms/d/192Eqjup01aq3zAvTS-P9wFTCJZChaGNHDAusrUKMd6o/viewform?}
    school_field = %Q{&entry.363323870=} + school
    teacher_field = %Q{&entry.819974938=} + teacher_name
    city_field = %Q{&entry.1920272073=} + city
    school_field = %Q{&entry.1402717777=} + school
    teacher_field = %Q{&entry.363323870=} + teacher_name
    city_field = %Q{&entry.819974938=} + city
    state_name = %Q{&entry.1920272073=} + state
    tail_url = %Q{&entry.942453101&entry.1463927784}
    survey_url = base_url + school_field + teacher_field + city_field + state_name + tail_url

    bitly = Bitly.client
    @prefilledURL = bitly.shorten(survey_url).short_url
  end

end
