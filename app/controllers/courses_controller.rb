class CoursesController < InheritedResources::Base



  # GET /courses/1/edit
  #def edit
    #Check if the user session equal to the user_id of the course
  #end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)
    @course.user_id = current_user.id

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_course
    @course = Course.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:title, :user_id)
    end
end

