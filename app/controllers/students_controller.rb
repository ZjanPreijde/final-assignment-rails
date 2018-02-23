class StudentsController < ApplicationController
  before_action :authenticate_user!

  def index
    batch_id = params[:batch_id].to_i
    @batch = Batch.find(batch_id)
    @students = Student.where(batch_id: batch_id).order("name")
  end

  def new_student
    batch_id = params[:batch_id].to_i
    redirect_to students_path, batch_id: batch_id, :notice => "Yes, wouldn't you like to be able to do that?"
  end


  def create_student
    batch_id = params[:batch_id].to_i
    name     = params[:name]
    if !check_name(name)
      redirect_to students_path, :alert => "Invalid name"
    else
      student = Student.new(name: name, batch_id: batch_id)
      student.save
      redirect_to students_path, batch_id: batch_id, :notice => "Student " + name + " created"
    end
  end

  def check_name(name)
    # TODO: Check whether name is unique for batch
    return !name.blank?
  end

  def create_evaluation

  end
  def update_evaluation

  end

end
