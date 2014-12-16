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
      params.require(:todo).permit(:name, :project_id, :user_id, :important, :completed, :comment_count)
    end
end
