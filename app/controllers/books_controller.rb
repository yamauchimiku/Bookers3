class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    # current_userはログイン中のユーザーidを取得
    @book.user_id = current_user.id
    # バリデーションの結果を表示
    if @book.save
      # サクセスメッセージの表示
      flash[:notice] = 'You have created post successfully.'
      redirect_to book_path(@book)
    else
      # renderなのでindexの変数を記載
      @books = Book.all
      render "index"
    end
  end

  def show
    @book = Book.find(params[:id])
    # フォームの値が残ってしまうので新しい変数を定義
    @newbook = Book.new
  end

  def edit
    @book = Book.find(params[:id])
    # 他人の投稿編集画面に推移できないようにする
    if @book.user == current_user
      render "edit"
    else
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    # バリデーションの結果を表示
    if @book.update(book_params)
      # サクセスメッセージの表示
      flash[:notice] = 'You have updated post successfully.'
      redirect_to book_path(@book)
    else
      render "edit"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
