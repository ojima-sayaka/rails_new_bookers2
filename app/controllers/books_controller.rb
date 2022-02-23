class BooksController < ApplicationController

   def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
     redirect_to book_path(@book), notice: "You have created book successfully."
    else
      @books = Book.all
      @user = current_user
      render :index
    end
   end

   def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path(@book), notice: "You have update book successfully."
    else
     render :edit
    end
   end

  def edit
    @book = Book.find(params[:id])
    @book.user
    redirect_to books_path unless @book.user == current_user
  end


   def show
     @newbook = Book.new
     @book = Book.find(params[:id])
     @user = @book.user

   end

   def index
    @books = Book.all
    @book = Book.new
    @user = current_user
   end

   def destroy
     book = Book.find(params[:id])
     book.destroy
     redirect_to books_path
   end

     # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:body, :title, :user_id)
  end



end
