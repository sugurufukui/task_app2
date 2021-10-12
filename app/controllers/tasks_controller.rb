class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task= Task.new(params.require(:task).permit(:title, :start_date, :end_date, :fulltime, :memo))
    if @task.save
      flash[:notice] = "スケジュールを作成しました"
      redirect_to :tasks
    else
      flash[:notice] = "スケジュールの作成に失敗しました"
      render 'new'
    end
  end


  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
      if @task.update(params.require(:task).permit(:title, :start_date, :end_date, :fulltime, :memo))
        flash[:notice] = "スケジュールを変更しました"
        redirect_to :tasks
      else
        flash[:notice] = "スケジュールを変更できませんでした"
        render 'edit'
      end
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      flash[:notice] = "スケジュールが削除されました"
      redirect_to :tasks
    else
      flash[:notice] = "スケジュールの削除ができませんでした"
      redirect_to :tasks
    end
  end

end