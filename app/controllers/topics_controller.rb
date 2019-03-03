class TopicsController < ApplicationController
  def index
    @topics = Topic.all.includes(:favorite_users) #includeメソッドは指定したモデルのデータを一括でキャッシュ「N+1問題」防ぐ
    @current_user = current_user
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = current_user.topics.new(topic_params)

    if @topic.save
      redirect_to topics_path, success: "投稿に成功しました"
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @topic.destroy
    redirect_to topics_path, notice: "画像を削除しました"
  end

  private
  def topic_params
    params.require(:topic).permit(:image, :description)
  end
end
