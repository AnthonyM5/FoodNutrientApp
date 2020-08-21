class FoodsController < ApplicationController
    


    def index
        if params[:query] != ""
            @foods = Food.search_by_query(params[:query])
            if params[:sort_options]  != "" 
                sort_column
            end
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
        sort_params = params[:sort_options]
        case sort_params
        when sort_params == "calories"
            @foods = Food.order(:calories)
        when sort_params == "carbs"
            @foods = Food.order(:carbs)
        end
    end

end
