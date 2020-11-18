class OutputsController < ApplicationController
  
  def index
    @outputs = Output.includes(:images).order("created_at DESC")
  end

  def new
    @output = Output.new
    @output.images.build
  end

  def create
    @output = Output.new(output_params)
    if @output.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
    
  def output_params
    params.require(:output).permit(:title, :text, images_attributes: [:src])
  end

end
