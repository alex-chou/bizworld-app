class TeachersController < ApplicationController

	def index
	end

	def show
    @teacher = session[:teacher]
	end

end
