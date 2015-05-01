class TeachersController < ApplicationController
  before_filter :authenticate_teacher!, except: [:index]

	def index
    if !current_teacher.try(:admin?)
      if !current_teacher
        redirect_to new_teacher_session_path
      else
        redirect_to teacher_path(current_teacher.id)
      end
    end
    @teacher = current_teacher
	end

	def show
    if params[:id].to_i != current_teacher.id and !current_teacher.try(:admin?)
      flash[:notice] = "You cannot access that page"
      redirect_to teacher_path(current_teacher.id)
    end
    @teacher = current_teacher
    @admin = false
    if current_teacher.admin?
      @teacher = Teacher.find(params[:id])
      @admin = true
    end
	end

  def raw_data_pre
    respond_to do |format|
      format.html { render text: Teacher.all_students_raw_data_pre}
      format.csv {send_data Teacher.all_students_raw_data_pre}
    end
  end

  def raw_data_post
    respond_to do |format|
      format.html { render text: Teacher.all_students_raw_data_post}
      format.csv {send_data Teacher.all_students_raw_data_post}
    end
  end

  def edit_admin
    if !current_teacher.admin?
      redirect_to teacher_path
    end
    if params[:edit_admin]
      admins = params[:edit_admin]
      Teacher.all.each do |teacher|
        if admins.keys.include?(teacher.id.to_s)
          teacher.admin = true
        else
          teacher.admin = false
        end
        teacher.save!
      end
    end
  end

end
