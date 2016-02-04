class WelcomeController < ApplicationController

  def index
    @curators = User.all.order(:handle)
    @featured_chambers = Chamber.where(featured: true)
    @featured_books = Book.where(featured: true)
  end

  def index_update
    @curators = User.all.order(:handle)
    @featured_chambers = Chamber.where(featured: true)
    @featured_books = Book.where(featured: true)
  end

end
