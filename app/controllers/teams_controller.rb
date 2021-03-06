class TeamsController < ApplicationController
  before_action :require_login
  before_action :set_team, only: [:edit, :update, :destroy]
  include Eventable

  def index
    @teams = Team.order('created_at desc').page(params[:page])
    respond_with @teams
  end

  def show
    @team = Team.includes(memberships: :user).find(params[:id])
    respond_with @team
  end

  def new
    @team = Team.new
  end

  def edit
  end

  def create
    @team = current_user.create_team(team_params)

    respond_with do |format|
      if @team.save
        format.html { redirect_to @team, notice: 'Team was successfully created.' }
        format.json { render json: @team, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @team.errors, status: :unprocessable_entity }
        format.js {head :unprocessable_entity}
      end
    end
  end

  def update
    respond_with do |format|
      if @team.update(team_params)
        format.html { redirect_back_or_default @team, notice: 'Team was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @team.errors, status: :unprocessable_entity }
        format.js {head :unprocessable_entity}
      end
    end
  end

  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url }
      format.json { head :no_content }
    end
  end

  private
    def set_team
      @team = Team.find(params[:id])
    end

    def team_params
      params.require(:team).permit(:name)
    end
end
