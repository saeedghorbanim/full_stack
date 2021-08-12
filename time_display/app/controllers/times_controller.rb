class TimesController < ApplicationController
    def main
        @time = Time.new
        render "view"
    end 
end
