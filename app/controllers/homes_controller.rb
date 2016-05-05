class HomesController < ApplicationController
  def index
    @courses = Course.all.limit(4);
  end
end