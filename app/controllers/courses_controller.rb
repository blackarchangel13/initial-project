class CoursesController < ApplicationController
  before_action :set_courses, only: [:show, :edit, :update, :destroy]



  def index 
    @courses = Course.all
  end

  def show
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)

    if @course.save 
      redirect_to @course
    else 
      render :new
  end


  def update
    if @course.update(course_params)
      
    else
      render :edit
    end
  end

  def destroy
    @course.destroy
    redirect_to root_path
  end


  def edit
  end
  Private 
  def course_params
    params.require(:course).permit(:name)
  end

  def set_course
    @course = Course.find(params[:id])
  end
end
