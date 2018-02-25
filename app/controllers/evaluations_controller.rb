class EvaluationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @student = Student.find(params[:id])
    @batch   = @student.batch
    @evaluations = Evaluation.where(student_id: @student.id).order("date asc")
  end

  def show
    # Should not get here
  end

  def new
    @student = Student.find(params[:student_id])
    @batch   = @student.batch
    @evaluation = Evaluation.new(student: @student, batch: @batch)
  end

  def edit
    @evaluation = Evaluation.find(params[:id])
    @student = @evaluation.student
    @batch   = @student.batch
  end

  def create
    @evaluation         = Evaluation.new( evaluation_params )
    @evaluation.student = Student.find(params[:student_id])
    @evaluation.batch   = @evaluation.student.batch
    if @evaluation.save
      redirect_to student_path(@evaluation.student.id), :notice => "Evaluation added"
    else
      render 'new'
    end
  end

  def update
    @evaluation = Evaluation.find(params[:id])
    if @evaluation.update( evaluation_params )
      redirect_to student_path(@evaluation.student.id), :notice => "Evaluation updated"
    else
      render 'edit'
    end
  end

  def destroy
    @evaluation = Evaluation.find(params[:id])
    student_id = @evaluation.student.id
    @evaluation.destroy
    redirect_to student_path(student_id)
  end

private
  def evaluation_params
    params.require(:evaluation).permit(:batch_id, :student_id, :date, :score, :remarks)
  end

end
