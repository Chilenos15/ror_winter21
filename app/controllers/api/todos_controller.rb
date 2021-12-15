class Api::TodosController < ApplicationController
  # only going to be the index, show, create, update, destroy 
  # we don't need the new or edit because handled in react 
  # mainly focus on the actions 
  # not returning a component here or html
  # return json 
  # both rails and react knows about json 
  # new pattern for these controllers 
  def index 
    @todos = Todo.all 
    render json: @todos 
  end

  def show 
    @todo = Todo.find(params[:id])
    render json: @todo 
  end

  def create 
    @todo = Todo.new(todo_params)
    if @todo.save 
      render json: @todo
    else
      # 401 error in the server here is where the error is 
      render json: { errors: @todo.errors }, status: :unprocessable_entity
    end
  end

  def update 
    @todo = Todo.find(params[:id])
    if @todo.update(todo_params)
      render json: @todo
    else
      # 401 error in the server here is where the error is 
      render json: { errors: @todo.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    render json: { message: 'todo is deleted' }
  end

  private 
    # { todo: {title: '', desc: '', complete: true }}
    def todo_params
      params.require(:todo).permit( :title, :desc, :complete )
    end

end