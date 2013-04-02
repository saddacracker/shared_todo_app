class TodosController < ApplicationController
  
  def index
    @todo_items = Todo.all
  end
  
  def add
    todo = Todo.create(:todo_item => params[:todo_text])
    unless todo.valid?
      flash[:error] = todo.errors.full_messages.join("<br>").html_safe
    end
    redirect_to :action => 'index'
  end
  
  def delete
    @todo_last = Todo.last
    @todo_last.delete
  end
  
end
