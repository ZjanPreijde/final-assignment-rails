class BatchesController < ApplicationController
  before_action :authenticate_user!

  def index
    @batches = Batch.order("start_date desc")
  end

  def show
    # Done in students#index
  end

  def new
    @batch = Batch.new
  end

  def create
    @batch = Batch.new( batch_params )
    if @batch.save
      redirect_to batch_path(@batch), :notice => "Class #{@batch.name} created"
    else
      render 'new'
    end
  end

  # Not done in this app
  def update
    @batch = Batch.find(params[:id])
    if @batch.update( batch_params )
      redirect_to @batch
    else
      render 'edit'
    end
  end

  # Only for empty batches
  def destroy
    @batch = Batch.find(params[:id])
    @batch.destroy
    redirect_to batches_path
  end

private
  def batch_params
    params.require(:batch).permit(:name, :start_date, :end_date)
  end

end
