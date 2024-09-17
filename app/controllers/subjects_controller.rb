class SubjectsController < ApplicationController
	
  def index
    subjects = Subject.all
    render json: subjects
  end

def show
  subject = Subject.find(params[:id])
        render json: subject
      end

  def create
    subject = Subject.new(subject_params)
    if subject.save
      render json: subject, status: :created
    else
      render json: subject.errors, status: :unprocessable_entity
    end
  end

  def update
    subject = Subject.find(params[:id])
    if subject.update(subject_params)
      render json: subject
    else
      render json: subject.errors, status: :unprocessable_entity
    end
  end

  def destroy
    subject = Subject.find(params[:id])
    subject.destroy
    head :no_content
  end

  private

  def subject_params
    params.require(:subject).permit(:name, :student_id, :teacher_id)
  end
end
