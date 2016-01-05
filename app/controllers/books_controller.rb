class BooksController < ApplicationController
  before_action :find_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.all.order('title ASC')
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to books_path
    else
      render 'new'
    end
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
