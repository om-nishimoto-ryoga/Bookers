class BookersController < ApplicationController
	before_action :set_target_action, only: %i[show edit]


  def top
  end

  def index
  	@bookers = Booker.all
  	@booker = Booker.new
  end

  def create
        bookers = Booker.new(bookers_params)
        if bookers.save
           redirect_to booker_path(bookers.id), notice: "Book was successfully created."
        else
           render :index
        end
  end

  def show
  end

  def edit
  end
  def update
  	bookers = Booker.find(params[:id])
    if bookers.update(bookers_params)
       redirect_to booker_path(bookers), notice: "Book was successfully updated."
    else
       render :edit
    end
  end

  def destroy
  	    bookers = Booker.find(params[:id])
        if bookers.destroy
           redirect_to bookers_path, notice: "Book was successfully destroyed."
        else
           render :index
        end
  end

  def set_target_action
  	@bookers = Booker.find(params[:id])
  end
 
    private

    def bookers_params
      params.require(:booker).permit(:title,:body)
    end
end
