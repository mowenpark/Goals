class GoalsController < ApplicationController
  before_filter :require_login

  def new
    @goal = Goal.new
    render :new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.is_public = (goal_params[:is_public] == 'yes') ? true : false
    @goal.user_id = current_user.id
    if @goal.save
      redirect_to goal_url(@goal)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  def show
    @goal = Goal.find(params[:id])
    render :show
  end

  def index
    render :index
  end

  def destroy
    @goal = Goal.find(params[:id])
    if @goal.destroy
      redirect_to goals_url
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :show #??
    end
  end

  def edit
    @goal = Goal.find(params[:id])
    render :edit
  end

  def update
    @goal = Goal.find(params[:id])
    if @goal.update(goal_params)
      redirect_to goal_url(@goal)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :edit
    end
  end

private
def goal_params
  params.require(:goal).permit(:title, :is_public)
end

end
