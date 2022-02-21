class BooksController < ApplicationController

   def create

    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book)

   end

   def show

   end

   def index
    @books = Book.all
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
