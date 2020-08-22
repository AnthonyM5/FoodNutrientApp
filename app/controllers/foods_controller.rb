class FoodsController < ApplicationController
    


    def index
        @foods = Food.search_by_query(params[:query]).sort_by_options(params[:sort_options])
    end    

    def show
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
