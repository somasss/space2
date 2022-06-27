class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]
  before_action :set_q, only: [:index, :search]
  before_action :authenticate_user!

  # GET /tasks or /tasks.json
  def index
    @tasks = Task.all.where(user_id: current_user.id).page(params[:page]).per(12)
  end

  # GET /tasks/1 or /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks or /tasks.json
  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id

    respond_to do |format|
      if @task.save
        format.html { redirect_to task_url(@task), notice: "タスクの作成に成功しました" }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to task_url(@task), notice: "タスクの更新に成功しました" }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "タスクの削除に成功しました" }
      format.json { head :no_content }
    end
  end

  def search
    @results = @q.result.includes(:tasklabels)
  end


  private
    # Use callbacks to share common setup or constraints between actions.

    def search_params
      params.require(:q).permit(:labels_name_cont)
    end


  def set_task
    @task = Task.find(params[:id])
   end

    # Only allow a list of trusted parameters through.
  def task_params
    params.require(:task).permit(:task_title, :due_date, :task_content, :status, :user_id, label_ids: [])
  end

  def set_q
    @q = Task.all.where(user_id: current_user.id).ransack(params[:q])
  end 

end
