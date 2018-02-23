class BatchesController < ApplicationController
  before_action :authenticate_user!

  def index

  end

  def batch_stats

  end

  def make_batch
    name_par       = params[:name]
    start_date_par = params[:start_date]
    end_date_par   = params[:end_date]
    name           = name_par
    start_date     = start_date_par.to_date
    end_date       = start_date_par.to_date
    if !check_name(name_par, name)
      redirect_to batches_path, :alert => "Invalid name"
    elsif Batch.where(name: name).count > 0
      redirect_to batches_path, :alert => "Batch with this name already exists"
    elsif !check_date_format(start_date_par, start_date)
      redirect_to batches_path, :alert => "Invalid start date format"
    elsif !check_date_format(end_date_par, end_date)
      redirect_to batches_path, :alert => "Invalid end date format"
    elsif start_date.sunday?
      redirect_to batches_path, :alert => "Start date is a Sunday"
    elsif end_date.sunday?
      redirect_to batches_path, :alert => "End date is a Sunday"
    elsif !check_date_range(start_date, end_date)
      redirect_to batches_path, :alert => "Invalid dates"
    else
      batch = Batch.new
      batch.create_new_batch(name, start_date, end_date)
      redirect_to batches_path, :notice => "Batch " + name " created"
    end
  end

  def check_name(name_par, name)
    return !name.blank?
  end

  def check_date_format(date_par, date)
    if date.nil? || date.class != Date
      return false
    elsif date.to_s != date_par
      return false
    end
    return true # Should not be necessary, but had issues
  end

  def check_date_range(start_date, end_date)
    if end_date < start_date
      return false
    end
    return true # Should not be necessary, but had issues
  end

end
