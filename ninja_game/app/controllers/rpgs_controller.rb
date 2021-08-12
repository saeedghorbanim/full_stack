class RpgsController < ApplicationController
    def index
        session[:gold] ||= 0
        session[:activities] ||= []

        @gold = session[:gold]
        @activities = session[:activities]

        render 'index'
    end

    def new
        if params[:building] == 'farm'
            gold = rand(10...20)
            # session[:activities].push(gold)
        elsif params[:building] == 'cave'
            gold = rand(5...10)
            # session[:activities].push(gold)
        elsif params[:building] == 'house'
            gold = rand(2...5)
            # session[:activities].push(gold)
        elsif params[:building] =='casino'
            gold = rand(-50...50)
            # session[:activities].push(gold)
        end

        time_now = Time.now

        if gold > 0 
            session[:activities] << "Earned #{gold} golds from the #{params[:building]}! (#{time_now.strftime('%Y/%m/%d %l:%M %P')})"
        else
            session[:activities] << "Entered a casino and lost #{gold} golds... Ouch. (#{time_now.strftime('%Y/%m/%d %l:%M %P')})"
        end
        
        session[:gold] += gold
        redirect_to :root
    end
end
