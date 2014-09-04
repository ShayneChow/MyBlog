class Admin::WorksController < Admin::ApplicationController

    def index
      @works = Work.order('id DESC').page(params[:page]).per(params[:per] || 8)
    end

    #新建work
    def new
      @work = Work.new
    end

    def create
      @work = Work.new work_params
      #@post.user = current_user
      if @work.save
        redirect_to admin_works_path
      else
        render :new
      end
    end


    #编辑work
    def edit
      @work = Work.find params[:id]
    end

    def update
      @work = Work.find params[:id]
      if @work.update work_params
        redirect_to admin_works_path
      else
        render :edit
      end
    end

    #删除work
    def destroy
      @work = Work.find params[:id]
      @work.destroy
      redirect_to admin_works_url
    end

    private
    def work_params
      params.require(:work).permit(:title, :content, :fromdate, :todate, :desc)
    end
  end
