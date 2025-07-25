class ProjectsController < ApplicationController
  def index
    @projects = Project.all
    @todos = Todo.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      flash[:notice] = "Project created successfully"
      redirect_to project_path(@project)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    flash[:notice] = "Project updated successfully"
    @project = Project.find(params[:id])

    if @project.update(project_params)
      redirect_to project_path(@project)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project = Project.find(params[:id])

    @project.destroy
      flash[:notice] = "Project deleted."
      redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :active)
  end
end
