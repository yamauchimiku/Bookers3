class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    # current_userはログイン中のユーザーidを取得
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end

  def show

  end

  def edit

  end

  def update

  end

  # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
