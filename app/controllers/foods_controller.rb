class FoodsController < ApplicationController
    


    def index
        if params[:query] != ""
            @foods = Food.search_by_query(params[:query])
        else
        @foods = Food.all
        end
    end    

   # def new
        @food = Food.new
   # end

    def show
        @food = Food.find_by(id: params[:id])
        @food.food_nutrient_hash(@food)
    end

    # def create
    #   @food = Food.create(food_params)
    #   if @food.valid?a
    #   @food.save
    #   redirect_to food_path(@food)
    #   else 
    #   render 'new' 
    #   puts @food.errors.full_messages
    #   end
    ## end

    # def food_params
    #    params.require(:food).permit(:name, :nutrient_hash)
    # end
end
