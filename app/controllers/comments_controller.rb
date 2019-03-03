class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

   def create
    comment = Comment.create(create_params)

    if comment.persisted? #DBに保存されているか？
      redirect_to topics_path, success: 'コメントしました'
    else
      redirect_to new_topic_comment_path, danger: 'コメントできませんでした'
    end

   end

  private
  def create_params
   params.require(:comment).permit(:body).merge(user_id: current_user.id, topic_id: params[:topic_id])  # require POSTで受け取る値のキー  permit 許可するカラム
  end

end
