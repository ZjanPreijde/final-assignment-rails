class StudentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @batch = Batch.find(params[:batch_id])
    @students = Student.where(batch_id: @batch.id).order("name")
  end

  def show
    @student = Student.find(params[:student_id])
  end

  def new
    @batch   = Batch.find(params[:batch_id])
    @student = Student.new(batch: @batch)
  end

  def create
    @batch   = Batch.find(params[:batch_id])
    @student = Student.new( student_params )
    if @student.save
      redirect_to @student, :notice => "Student #{@student.name} added"
    else
      render 'new'
    end
  end

  def update
    @student = Student.find(params[:id])
    if @student.update( batch_params )
      redirect_to @student
    else
      render 'edit'
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to batch_student_path
  end

private
  def student_params
    params.require(:student).permit(:batch_id, :name, :image_url)
  end

end
