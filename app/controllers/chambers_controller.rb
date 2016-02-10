class ChambersController < ApplicationController
  before_action :find_chamber, only: [:chamberbooksindex, :show, :edit, :update, :destroy]

  def index
    @chambers = Chamber.all.order('name ASC')
  end

  def show
    @chamber = Chamber.find(params["id"])
    if (current_user)
      current_user.update_attributes(:current_chamber_id => @chamber.id)
    end
  end

  def chamberbooksindex
  end

  def new
    @chamber = current_user.chambers.build
  end

  def create
    @chamber = current_user.chambers.build(chamber_params)

    if @chamber.save
      # current_user.chambers << @chamber
      redirect_to chamber_path(@chamber)
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

  def subscribe
    @chamber = Chamber.find(params[:id])
    current_user.chambers << @chamber
    current_user.save
    redirect_to mychambers_path
  end

  def is_curated selected_chamber
    current_user.access_types.find_by(chamber_id: selected_chamber.id).curates
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
