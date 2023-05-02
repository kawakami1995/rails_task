class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
    @count = Schedule.count
    @today = Date.current.strftime("%Y/%m/%d")
  end
  
  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(params.require(:schedule).permit(:title, :start_date, :end_date, :all_day, :content))
    if @schedule.save
      flash[:notice] = "予定を新規登録しました"
      redirect_to "/schedules"
      @schedule.all_day = ""
    else
      flash[:notice] = "予定の新規登録はできませんでした。"
      render "new"
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(params.require(:schedule).permit(:title, :start_date, :end_date, :all_day, :content))
    flash[:notice] = "IDが#{@schedule.id}の情報を更新しました"
    redirect_to "/schedules"
    else
      flash[:notice] = "予定を更新できませんでした。"
      render "edit"
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    flash[:notice] = "スケジュールを削除しました"
    redirect_to "/schedules"
  end

end
