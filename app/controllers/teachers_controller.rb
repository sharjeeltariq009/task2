class TeachersController < ApplicationController

  def index
    teachers = Teacher.all
    render json: teachers
  end
def show
  teacher = Teacher.find(params[:id])
        render json: teacher
      end

  def create
    teacher = Teacher.new(teacher_params)
    if teacher.save
      render json: teacher, status: :created
    else
      render json: teacher.errors, status: :unprocessable_entity
    end
  end

  def update
    teacher = Teacher.find(params[:id])
    if teacher.update(teacher_params)
      render json: teacher
    else
      render json: teacher.errors, status: :unprocessable_entity
    end
  end

  def destroy
    teacher = Teacher.find(params[:id])
    teacher.destroy
    head :no_content
  end

  private

  def teacher_params
    params.require(:teacher).permit(:name)
  end
end
