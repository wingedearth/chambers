class ChambersController < ApplicationController

  def index
    @chambers = Chamber.all.order('name ASC')
  end

  def show
    @chamber = Chamber.find(params[:id])
  end

  def new
    @chamber = Chamber.new
  end

  def create
    @chamber = Chamber.new(chamber_params)

    if @chamber.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

    def chamber_params
      params.require(:chamber).permit(:name, :description,
        :image_uri, :featured)
    end

end
