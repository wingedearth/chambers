class BooksController < ApplicationController
  before_action :find_book, only: [:show, :edit, :update, :destroy]

  def index
    @chamber = Chamber.find(params[:id])
    @books = @chamber.books
  end

  def show
  end

  def new
    @book = Book.new
    @chamber = current_user.chambers.build
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to chamber_books_path
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
