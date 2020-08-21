class FoodsController < ApplicationController
    


    def index
        if params[:query] != "" && params[:sort_options] != ""
            @foods = Food.search_by_query(params[:query])
            sort_column
        elsif params{:query} != ""
            @foods = Food.search_by_query(params[:query])
        else
        @foods = Food.all
        end
    end    

    def show
        sort_column
        @food = Food.find_by(id: params[:id])
    end

    private

    def sort_column
        if params[:sort_options] == "calories"
            @foods = Food.order(:calories)
        end
        if params[:sort_options] == "carbs"
            @foods = Food.order(:carbs)
        end
    end

end
