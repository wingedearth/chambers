class UsersController < ApplicationController

  def show
    @user = User.find(params["id"])
  end

  def new
    @user = User.new
  end

  def readinglist
  end

  def mychambers
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @featured_chambers = Chamber.where(featured: true)
    @featured_books = Book.where(featured: true)
    if @user.update(user_params)
      redirect_to userupdate_path(@user)
    else
      render 'edit'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Your account has been activated!"
      @user.chambers.create name: "My First Chamber", description: "You\
       can add books to this chamber and edit the name and description.\
       You can also create additional chambers."
      @user.current_chamber_id = @user.chambers.last.id
      @user.chambers.access_types.find_by(chamber_id: @user.chambers.last.id).update_attributes(:curates => true)
      @user.books << Book.first
      @user.chambers.first << Book.first
      redirect_to userupdate_path
    else
      render 'new'
    end
  end

private
  def user_params
    params.require(:user).permit(:handle, :email, :description, :city, :state, :password, :password_confirmation, :image_uri)
  end

end

