class TeachersController < ApplicationController
  before_filter :authenticate_teacher!, except: [:index]

	def index
	end

	def show
    session[:teacher] = Teacher.find(params[:id])
    @teacher = session[:teacher]
	end

end
