class TodosController < ApplicationController
  before_action :set_todo, only: [:edit, :update, :destroy]

  def index
    @todos = Todo.all
    respond_with @todos
  end

  def show
    @todo = Todo.includes(comments: :user).find(params[:id])
    respond_with @todo
  end

  def new
    @todo = Todo.new
  end

  def edit
  end

  def create
    @todo = Todo.new(todo_params)

    respond_with do |format|
      if @todo.save
        track
        format.html { redirect_to @todo, notice: 'Todo was successfully created.' }
        format.json { render json: @todo, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
        format.js {head :unprocessable_entity}
      end
    end
  end

  def update
    respond_with do |format|
      if @todo.update(todo_params)
        @todo.adjust_user(current_user)
        track_update_action
        format.html { redirect_to @todo, notice: 'Todo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
        format.js {head :unprocessable_entity}
      end
    end
  end

  def destroy
    @todo.destroy
    track
    respond_with do |format|
      format.html { redirect_to todos_url }
      format.json { head :no_content }
    end
  end

  private
    def set_todo
      @todo = Todo.find(params[:id])
    end

    def todo_params
      params.require(:todo)
          .permit(:name, :project_id, :user_id, :important, :completed, :comment_count)
    end

    def track(detail='')
      track_event(@todo, @todo.project_id, detail:detail)
    end
    def track_update_action
      track(get_detail)
    end
    def get_detail
      completed = todo_params[:completed]
      if completed.nil?
        todo_params[:user_id] ?
            "assign #{link_for_user(@todo.user)} for" :
            "updated"
      else
        completed=='true' ? 'completed' : 're-opened'
      end
    end
    def link_for_user(user)
      user ? view_context.link_to(user.username, user) : 'nobody'
    end
end
