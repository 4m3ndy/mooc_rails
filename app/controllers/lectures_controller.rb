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

  private

    def lecture_params
      params.require(:lecture).permit(:title, :content, :attachment, :course_id, :user_id)
    end
end

