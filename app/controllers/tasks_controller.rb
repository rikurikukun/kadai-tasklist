class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
   def index
     @tasks = Task.all
   end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      flash[:success] = 'メッセージを投稿しました。'
      redirect_to root_url
    else
      @tasks = current_user.tasks.order('created_at DESC').page(params[:page])
      flash.now[:danger] = 'メッセージの投稿に失敗しました。'
      render 'toppages/index'
    end
  end

  def edit
  end

  def update

    if @task.update(task_params)
      flash[:success] = 'Task は正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Task は更新されませんでした'
      render :edit
    end
  end

  def destroy
    
    @task.destroy
     @task.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_back(fallback_location: root_path)
  end

  end

private

def set_task
  @task = Task.find(params[:id])
end

  # Strong Parameter
  def task_params
    params.require(:task).permit(:content, :status)
  end


def correct_user
    @task = current_user.microposts.find_by(id: params[:id])
    unless @task
      redirect_to root_url
    end
end
