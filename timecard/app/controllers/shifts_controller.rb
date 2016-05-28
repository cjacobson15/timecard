class ShiftsController < ApplicationController
  def index
    @shifts = Shift.all
  end

  def show
    @shift = Shift.find(params[:id])
  end

  def new
    @shift = Shift.new
  end

  def create
    @shift = Shift.new
    @shift.job_id = params[:job_id]
    @shift.total_pay = params[:total_pay]
    @shift.approval = params[:approval]
    @shift.reimbursements = params[:reimbursements]
    @shift.bonus = params[:bonus]
    @shift.hours_worked = params[:hours_worked]
    @shift.time_out = params[:time_out]
    @shift.time_in = params[:time_in]

    if @shift.save
      redirect_to "/shifts", :notice => "Shift created successfully."
    else
      render 'new'
    end
  end

  def edit
    @shift = Shift.find(params[:id])
  end

  def update
    @shift = Shift.find(params[:id])

    @shift.job_id = params[:job_id]
    @shift.total_pay = params[:total_pay]
    @shift.approval = params[:approval]
    @shift.reimbursements = params[:reimbursements]
    @shift.bonus = params[:bonus]
    @shift.hours_worked = params[:hours_worked]
    @shift.time_out = params[:time_out]
    @shift.time_in = params[:time_in]

    if @shift.save
      redirect_to "/shifts", :notice => "Shift updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @shift = Shift.find(params[:id])

    @shift.destroy

    redirect_to "/shifts", :notice => "Shift deleted."
  end
end
