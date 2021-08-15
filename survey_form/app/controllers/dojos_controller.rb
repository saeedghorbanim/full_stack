class DojosController < ApplicationController
    
    #this method creates a session with value of 0
    #and renders index.html which index.html has a form with a method='post'
    #meaning when index.html page is submitted it connects to the
    # post '/dojos' route and which that connects to create method (in routes.rb file) in order
    #to obtain the data submitted in index.html to redirect it to /dojos/result
    #which dojos/result route is connected to the result method (in routes.rb file) which renders
    #the results into result.html pages
    def index
        session[:views] ||= 0
        render "index"
    end

    def create
        #adding to views in order to increment
        session[:views] = session[:views] + 1

        #we are grabbing the params[:dojo] info from index.html which we have
        #name='dojo[name]'  name='dojo[language]' etc
        #basically saving all section names in params[:dojo]
        #then saving that in session[:result] which we use in result section to save in @result
        #to print them in the result.html file
        session[:result] = params[:dojo]

        #flash message to display session[:views] number when incremented
        flash[:success] = "Thanks for submitting this form! You have submitted this form #{ session[:views] } times now."

        #redirecting to present the results in /dojos/result page once submitted
        redirect_to '/dojos/result'
    end

    #this method is connected to /dojos/result page and saves all the data in session
    #in order to pass it on as @result to the result.html file to display
    def result
        @result = session[:result]
    end 
end
