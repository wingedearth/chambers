class BooksController < ApplicationController
  before_action :find_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.all.order("created_at DESC")
  end

  def show
    @book = Book.find(params[:id])
    if (current_user)
      current_user.update_attributes(:current_book_id => @book.id)
      @chamber = Chamber.find(current_user.current_chamber_id)
    end
  end

  def new
    # @book = Book.new
    @chamber = Chamber.find(current_user.current_chamber_id)
    @book = @chamber.books.build
  end

  def create
    @chamber = Chamber.find(current_user.current_chamber_id)
    @book = @chamber.books.build(book_params)
    if @book.save
      redirect_to chamber_books_path(current_user.current_chamber_id)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to book_path(@book)
    else
      render 'edit'
    end
  end

  def add_to_reading_list
    current_user.books << Book.find(params[:id])
    current_user.save
    flash[:notice] = "The book has been added!"
    redirect_to readinglist_path
  end

  def destroy
    @book.destroy
    redirect_to books_path
  end

  private

    def book_params
      params.require(:book).permit(:title, :description, :author,
        :book_uri, :image_uri, :featured)
    end

    def find_book
      @book = Book.find(params[:id])
    end

end
