class SectionsController < ApplicationController

  layout false

  def index
    @sections = Section.sorted
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new({:name => "Default"})
  end

  def create
    @section = Section.new(section_params)
    if @section.save
      flash[:notice] = "Section created successfully."
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(section_params)
      flash[:notice] = "Section updated successfully"
    end
  end

  def edit
    @section = Section.find(params[:id])
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    section =  Section.find(params[:id]).destroy
    flash[:notice] = "Section destroyed"
    redirect_to(:action => 'index')
  end

  private

  def section_params
    params.require(:section).permit(:page_id, :name, :position, :visible, :content_type, :context)
  end
end