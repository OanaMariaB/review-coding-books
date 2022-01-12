class BooksController < ApplicationController

    def new
        @book = Book.new
    end

    def index
        @books = Book.all
    end

    def create
        @book = Book.new(book_params)
        if @book.save
        redirect_to books_path
        else
            render :new
        end
    end

    def show
        @book = Book.find_by_id(params[:id])
        redirect_to books_path if !@book
    end


    
    
    private

    def book_params
        params.require(:book).permit(:title, :author)
    end

end