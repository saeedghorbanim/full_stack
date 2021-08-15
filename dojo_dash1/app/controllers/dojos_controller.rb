class DojosController < ApplicationController

    def index
        @dojos = Dojo.all
        @num_of_dojos = @dojos.count
        render 'index'
    end
    
    def new
        render "new"
    end

    def create
        @dojo = Dojo.new(dojo_params)

        if @dojo.valid?
          @dojo.save
          redirect_to :root
        else
          flash[:errors] = @dojo.errors.full_messages
          redirect_to "/dojos/new"
        end
    end


    def show
        @dojo = Dojo.find(params[:id])
        render "show"
    end


    def edit
        @dojo = Dojo.find(params[:id])
        render "edit"
    end


    def update
        @dojo = Dojo.find(params[:id])
        @dojo.update(dojo_params)
        if @dojo.valid?
            redirect_to :root
        else 
            flash[:errors] = @dojo.errors.full_messages
            redirect_to :back
        end
    end

    def destroy
        Dojo.find(params[:id]).destroy
        redirect_to ""
    end

    private
        def dojo_params
            params.require(:dojo).permit(:branch, :street, :city, :state)
        end
end
