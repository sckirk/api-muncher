class HomepagesController < ApplicationController
    def index
        if params[:search]
            session[:search] = params[:search]
            @results = Recipe.results(params[:search])
        end
    end

    def show
        if session[:search].nil?
            redirect_to root_path
        else
            @result = Recipe.by_name(session[:search], params[:name])
        end
    end
end
