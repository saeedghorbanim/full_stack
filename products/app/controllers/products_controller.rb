class ProductsController < ApplicationController
    def index
        render text: "What do you want me to day?"
    end
    
    def hello
        render text: "Hello CodingDojo!"
    end
    
    def say
        render text: "Saying Hello!"
    end

    def say_name
        if params[:name] == "michael"
            redirect_to "/say/hello/joe"
        else
            render text: "Saying Hello #{params[:name]}!"
        end
    end

    def times
        # if session[:count] exists, leave it as is. Else set it to 0
        session[:count] ||= 0
        render text: "You visited this url #{session[:count] += 1} times"
    end
    
    def restart
        reset_session
        render text: "Destroyed the session!"
    end
end
