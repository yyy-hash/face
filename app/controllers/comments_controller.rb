class CommentsController < ApplicationController
	# コメントを保存、投稿するためのアクションです。
  def create
  	# Blogをパラメータの値から探し出し,Blogに紐づくcommentsとしてbuildします。
    @comment = current_user.comments.build(comment_params)
    @topic = @comment.topic
    # クライアント要求に応じてフォーマットを変更
    respond_to do |format|
      if @comment.save
        format.html { redirect_to topic_path(@topic), notice: 'コメントを投稿しました。' }
        # JS形式でレスポンスを返します。
        format.js { render :index }

      else
        format.html { render :new }
      end
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    @topic = @comment.topic
    
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params) #正常に更新できた場合
      @topic = @comment.topic
      redirect_to topic_path(@topic.id), notice: "更新しました" #viewsへnotice変数を渡し、blogs/show.html.erbへ
    else
      render 'edit' #views/blogs/edit.html.erbを呼び出す
    end
  end

  def destroy
   @comment = Comment.find(params[:id])
   @comment.destroy
 
 
   respond_to do |format|
      if @comment.destroy
        format.html { redirect_to topic_path(@topic), notice: 'コメントを削除しました。' }
        # JS形式でレスポンスを返します。
        format.js { render :index }

      else
        format.html { render :new }
      end
    end
  end



  private
    # ストロングパラメーター
    def comment_params
      params.require(:comment).permit(:topic_id, :content)
    end

end
