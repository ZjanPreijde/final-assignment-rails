class StudentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @batch = Batch.find(params[:id])
    @students = Student.where(batch_id: @batch.id).order("name")
  end

  def show
    # Done in evaluations#index
  end

  def new
    @batch   = Batch.find(params[:batch_id])
    @student = Student.new(batch: @batch)
  end

  def edit
    @student = Student.find(params[:id])
    @batch   = @student.batch
  end

  def create
    @student       = Student.new( student_params )
    @student.batch = Batch.find(params[:batch_id])
    if @student.save
      redirect_to batch_path(@student.batch.id), :notice => "Student #{@student.name} added"
    else
      render 'new'
    end
  end

  def update
    @student = Student.find(params[:id])
    if @student.update( student_params )
      redirect_to batch_path(@student.batch.id), :notice => "Student #{@student.name} updated"
    else
      render 'edit'
    end
  end

  def destroy
    @student = Student.find(params[:id])
    batch_id = @student.batch.id
    @student.destroy
    redirect_to batch_path(batch_id)
  end

private
  def student_params
    params.require(:student).permit(:batch_id, :name, :image_url)
  end

end
