class BooksController < ApplicationController
    before_action :find_book, only: [:show, :edit, :update, :destroy]

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

    def edit
    end

    def update
        if @book.update(book_params)
            redirect_to book_path(@book)
        else
           render :edit 
        end
    end

    def show
        @review = Review.find_by_id(params[:id])
        @book = Book.find_by_id(params[:id])
        redirect_to books_path if !@book
    end

    def destroy
        @book.destroy
        redirect_to books_path
    end
    
    private

    def find_book
        @book = Book.find_by_id(params[:id])
    end

    def book_params
        params.require(:book).permit(:title, :author)
    end


end