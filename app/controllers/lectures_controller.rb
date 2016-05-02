class LecturesController < InheritedResources::Base



  def create
    @lecture = Lecture.new(lecture_params)
    @lecture.user_id = current_user.id


    respond_to do |format|
      if @lecture.save
        format.html { redirect_to @lecture }
        format.json { render :show, status: :created, location: @lecture }
      else
        format.html { render :new }
        format.json { render json: @lecture.errors, status: :unprocessable_entity }
      end
    end
  end

  def render_404
    respond_to do |format|
      format.html { render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found }
      format.xml  { head :not_found }
      format.any  { head :not_found }
    end
  end

  def create_comment
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      flash[:success] = 'Your comment was successfully added!'
      redirect_to lecture_url(@comment.lecture_id)
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:comment, :lecture_id, :user_id)
    end

    def lecture_params
      params.require(:lecture).permit(:title, :content, :attachment, :course_id, :user_id)
    end
end

