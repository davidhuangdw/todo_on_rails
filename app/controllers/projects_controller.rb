class ProjectsController < ApplicationController
  before_action :set_project, only: [:edit, :update, :destroy]

  def index
    @projects = Project.all
    respond_with @projects
  end

  def show
    @project = Project.includes([todos:[:complete_user], team: :members]).find(params[:id])
    respond_with @project
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = Project.new(project_params)

    respond_with do |format|
      if @project.save
        track
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
        format.js {head :unprocessable_entity}
      end
    end
  end

  def update
    respond_with do |format|
      if @project.update(project_params)
        track
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
        format.js {head :unprocessable_entity}
      end
    end
  end

  def destroy
    @project.destroy
    respond_with do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end

  private
  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :team_id)
  end

  def track
    track_event(@project, @project.id)
  end
end

