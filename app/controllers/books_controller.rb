class BooksController < ApplicationController
  def index
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
    @book = Book.find(params[:id])
    # フォームの値が残ってしまうので新しい変数を定義
    @newbook = Book.new
  end

  def edit

  end

  def update

  end

  # 投稿データのストロングパラメータ
  private

  def book_params
    params.permit(:title, :body)
  end
end
