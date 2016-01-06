class ChambersController < ApplicationController
  before_action :find_chamber, only: [:show, :edit, :update, :destroy]

  def index
    @chambers = Chamber.all.order('name ASC')
  end

  def show
  end

  def new
    @chamber = current_user.chambers.build
  end

  def create
    @chamber = current_user.chambers.build(chamber_params)

    if @chamber.save
      redirect_to chambers_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @chamber.update(chamber_params)
      redirect_to chamber_path(@chamber)
    else
      render 'edit'
    end
  end

  def destroy
    @chamber.destroy
    redirect_to chambers_path
  end


  private

    def chamber_params
      params.require(:chamber).permit(:name, :description,
        :image_uri, :featured)
    end

    def find_chamber
      @chamber = Chamber.find(params[:id])
    end

end
