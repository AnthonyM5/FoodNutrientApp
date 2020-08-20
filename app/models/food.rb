class Food < ApplicationRecord
    has_many :meal_foods
    has_many :meals, through: :meal_foods
    serialize :nutrient_hash
    serialize :protein 
    serialize :total_lipid
    serialize :water
    serialize :carbs
    serialize :calories
    serialize :kj
    validates :name, uniqueness: true


    def self.create_by_food_hash(food)
        create(
            name: food["description"],
            nutrient_hash: food["foodNutrients"],
        )
    end

    def self.update_all
        @foods = Food.all
        @foods.each do |food|
        food.update_lipid(food)
        food.update_protein(food)
        food.update_water(food)
        food.update_carbs(food)
        food.update_calories(food)
        food.update_kj(food)
        end
    end

    def self.search_by_query(query)
        where("name LIKE ?", "%#{query}%")
    end

    def update_lipid(food, num)
            nutrient = food.nutrient_hash.find {|h| h['nutrientNumber'] == num }
            update(total_lipid: nutrient['value']) if nutrient 
    end

    def update_protein(food)
        !!food.nutrient_hash.find {|h| h['nutrientNumber'] == "203" } ? update(
            protein: food.nutrient_hash.find {|h| h['nutrientNumber'] == "203" }['value']
            ) : nil 
    end

    def update_water(food)
        !!food.nutrient_hash.find {|h| h['nutrientNumber'] == "255" } ? update(
            water: food.nutrient_hash.find {|h| h['nutrientNumber'] == "255" }['value']
            ) : nil 
    end

    def update_carbs(food)
        !!food.nutrient_hash.find {|h| h['nutrientNumber'] == "205" } ? update(
            carbs: food.nutrient_hash.find {|h| h['nutrientNumber'] == "205" }['value']
            ) : nil 
    end

    def update_calories(food)
        !!food.nutrient_hash.find {|h| h['nutrientNumber'] == "208" } ? update(
                calories: food.nutrient_hash.find {|h| h['nutrientNumber'] == "208" }['value']
                ) : nil 
    end

    def update_kj(food)        
            !!food.nutrient_hash.find {|h| h['nutrientNumber'] == "268" } ? update(
                kj: food.nutrient_hash.find {|h| h['nutrientNumber'] == "268" }['value']
                ) : nil 
    end
            
                
    #         !!food.nutrient_hash.find {|h| h['nutrientNumber'] == "209" } ? update(
    #             starch: food.nutrient_hash.find {|h| h['nutrientNumber'] == "209" }['value']
    #             ) : nil 
                
    #         !!food.nutrient_hash.find {|h| h['nutrientNumber'] == "269" } ? update(
    #             total_sugar: food.nutrient_hash.find {|h| h['nutrientNumber'] == "269" }['value']
    #             ) : nil 
                
    #         !!food.nutrient_hash.find {|h| h['nutrientNumber'] == "210" } ? update(
    #             sucrose: food.nutrient_hash.find {|h| h['nutrientNumber'] == "210" }['value']
    #             ) : nil 
                
    #         !!food.nutrient_hash.find {|h| h['nutrientNumber'] == "211" } ? update(
    #             glucose: food.nutrient_hash.find {|h| h['nutrientNumber'] == "211" }['value']
    #             ) : nil 
                
    #         !!food.nutrient_hash.find {|h| h['nutrientNumber'] == "212" } ? update(
    #             fructose: food.nutrient_hash.find {|h| h['nutrientNumber'] == "212" }['value']
    #             ) : nil 
                
    #         !!food.nutrient_hash.find {|h| h['nutrientNumber'] == "213" } ? update(
    #             lactose: food.nutrient_hash.find {|h| h['nutrientNumber'] == "213" }['value']
    #             ) : nil 
                
    #         !!food.nutrient_hash.find {|h| h['nutrientNumber'] == "287" } ? update(
    #             galactose: food.nutrient_hash.find {|h| h['nutrientNumber'] == "287" }['value']
    #             ) : nil 
                
    #         !!food.nutrient_hash.find {|h| h['nutrientNumber'] == "207" } ? update(
    #             ash: food.nutrient_hash.find {|h| h['nutrientNumber'] == "207" }['value']
    #             ) : nil 
                
    #         !!food.nutrient_hash.find {|h| h['nutrientNumber'] == "301" } ? update(
    #             calcium: food.nutrient_hash.find {|h| h['nutrientNumber'] == "301" }['value']
    #             ) : nil 

    #         !!food.nutrient_hash.find {|h| h['nutrientNumber'] == "303" } ? update(
    #             iron: food.nutrient_hash.find {|h| h['nutrientNumber'] == "303" }['value']
    #             ) : nil 

    #         !!food.nutrient_hash.find {|h| h['nutrientNumber'] == "304" } ? update(
    #             magnesium: food.nutrient_hash.find {|h| h['nutrientNumber'] == "304" }['value']
    #             ) : nil 

    #         !!food.nutrient_hash.find {|h| h['nutrientNumber'] == "307" } ? update(
    #             sodium: food.nutrient_hash.find {|h| h['nutrientNumber'] == "307" }['value']
    #             ) : nil 
            
    #         !!food.nutrient_hash.find {|h| h['nutrientNumber'] == "309" } ? update(
    #             zinc: food.nutrient_hash.find {|h| h['nutrientNumber'] == "309" }['value']
    #             ) : nil 
        
    #         !!food.nutrient_hash.find {|h| h['nutrientNumber'] == "312" } ? update(
    #             copper: food.nutrient_hash.find {|h| h['nutrientNumber'] == "312" }['value']
    #             ) : nil 
                    
    #         !!food.nutrient_hash.find {|h| h['nutrientNumber'] == "317" } ? update(
    #             selenium: food.nutrient_hash.find {|h| h['nutrientNumber'] == "317" }['value']
    #             ) : nil 
                
    #         !!food.nutrient_hash.find {|h| h['nutrientNumber'] == "318" } ? update(
    #             vitamin_a: food.nutrient_hash.find {|h| h['nutrientNumber'] == "318" }['value']
    #             ) : nil 

    #         !!food.nutrient_hash.find {|h| h['nutrientNumber'] == "320" } ? update(
    #             vitamin_a_r: food.nutrient_hash.find {|h| h['nutrientNumber'] == "320" }['value']
    #             ) : nil      

    #         !!food.nutrient_hash.find {|h| h['nutrientNumber'] == "324" } ? update(
    #             vitamin_d: food.nutrient_hash.find {|h| h['nutrientNumber'] == "324" }['value']
    #             ) : nil     
                
    #         !!food.nutrient_hash.find {|h| h['nutrientNumber'] == "323" } ? update(
    #             vitamin_e: food.nutrient_hash.find {|h| h['nutrientNumber'] == "323" }['value']
    #             ) : nil    
                
    #         !!food.nutrient_hash.find {|h| h['nutrientNumber'] == "401" } ? update(
    #             vitamin_c: food.nutrient_hash.find {|h| h['nutrientNumber'] == "401" }['value']
    #             ) : nil 

    #         !!food.nutrient_hash.find {|h| h['nutrientNumber'] == "404" } ? update(
    #             thiamin: food.nutrient_hash.find {|h| h['nutrientNumber'] == "404" }['value']
    #             ) : nil 

    #         !!food.nutrient_hash.find {|h| h['nutrientNumber'] == "405" } ? update(
    #             riboflavin: food.nutrient_hash.find {|h| h['nutrientNumber'] == "405" }['value']
    #             ) : nil 

    #         !!food.nutrient_hash.find {|h| h['nutrientNumber'] == "406" } ? update(
    #             niacin: food.nutrient_hash.find {|h| h['nutrientNumber'] == "406" }['value']
    #             ) : nil 
                
    #         !!food.nutrient_hash.find {|h| h['nutrientNumber'] == "410" } ? update(
    #             pantothenic: food.nutrient_hash.find {|h| h['nutrientNumber'] == "410" }['value']
    #             ) : nil 

    #         !!food.nutrient_hash.find {|h| h['nutrientNumber'] == "415" } ? update(
    #             vitamin_b6: food.nutrient_hash.find {|h| h['nutrientNumber'] == "415" }['value']
    #             ) : nil 

    #         !!food.nutrient_hash.find {|h| h['nutrientNumber'] == "417" } ? update(
    #             total_folate: food.nutrient_hash.find {|h| h['nutrientNumber'] == "417" }['value']
    #             ) : nil 

    #         !!food.nutrient_hash.find {|h| h['nutrientNumber'] == "431" } ? update(
    #             folic_acid: food.nutrient_hash.find {|h| h['nutrientNumber'] == "431" }['value']
    #             ) : nil 

    #         !!food.nutrient_hash.find {|h| h['nutrientNumber'] == "432" } ? update(
    #             food_folate: food.nutrient_hash.find {|h| h['nutrientNumber'] == "432" }['value']
    #             ) : nil 

    #         !!food.nutrient_hash.find {|h| h['nutrientNumber'] == "435" } ? update(
    #             folate_dfe: food.nutrient_hash.find {|h| h['nutrientNumber'] == "435" }['value']
    #             ) : nil 

    #         !!food.nutrient_hash.find {|h| h['nutrientNumber'] == "418" } ? update(
    #             vitamin_b12: food.nutrient_hash.find {|h| h['nutrientNumber'] == "418" }['value']
    #             ) : nil 
                
    #         !!food.nutrient_hash.find {|h| h['nutrientNumber'] == "601" } ? update(
    #             cholesterol: food.nutrient_hash.find {|h| h['nutrientNumber'] == "601" }['value']
    #             ) : nil 
                
    #         !!food.nutrient_hash.find {|h| h['nutrientNumber'] == "606" } ? update(
    #             sat_fats: food.nutrient_hash.find {|h| h['nutrientNumber'] == "606" }['value']
    #             ) : nil 
    
    #         !!food.nutrient_hash.find {|h| h['nutrientNumber'] == "646" } ? update(
    #             poly_unsat_fats: food.nutrient_hash.find {|h| h['nutrientNumber'] == "646" }['value']
    #             ) : nil 
                    
    #         !!food.nutrient_hash.find {|h| h['nutrientNumber'] == "208" } ? update(
    #             calories: food.nutrient_hash.find {|h| h['nutrientNumber'] == "208" }['value']
    #             ) : nil 
            
    #         !!food.nutrient_hash.find {|h| h['nutrientNumber'] == "268" } ? update(
    #             kj: food.nutrient_hash.find {|h| h['nutrientNumber'] == "268" }['value']
    #             ) : nil 
    # end

end
