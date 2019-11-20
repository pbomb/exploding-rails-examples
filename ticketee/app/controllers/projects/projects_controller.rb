module Projects
  class ProjectsController < ApplicationController
    def index
      @projects = repo.all
    end

    def show
      @project = repo.by_id(params[:id])
    end

    def new
      @project = Projects::Project.new
    end

    def create
      validation_result = Projects::ProjectContract.new.(project_params)
      if validation_result.success?
        repo.create(project_params)
        flash[:notice] = "Project has been created."
        redirect_to action: :index
      else
        @project = Projects::Project.new(project_params)
        @errors = validation_result.errors.to_h
        flash.now[:alert] = "Project could not be created."
        render :new
      end
    end

    private

    def project_params
      params.require(:project).permit(:name).to_h.symbolize_keys
    end

    def repo
      ProjectRepository.new(rom)
    end
  end
end