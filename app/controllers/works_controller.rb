class WorksController < ApplicationController
  def index
    @works = Work.order('id DESC')
  end

end
