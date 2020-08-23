class Food < ApplicationRecord
    has_many :meal_foods
    has_many :meals, through: :meal_foods
    validates :name, uniqueness: true
    serialize :nutrient_hash


    def self.create_by_food_hash(food)
        create(
            name: food["description"],
            nutrient_hash: food["foodNutrients"],
        )
    end

    def self.search_by_query(query)
        where("name LIKE ?", "%#{query}%")
    end

    def self.sort_by_options(sort_option)
        case sort_option
        when "Carbs"
            order(carbs: :desc)
        when "Calories"
            order(calories: :desc)
        when "Selenium"
            order(selenium: :desc)
        when "Protein"
            order(protein: :desc)
        when "Fiber"
            order(fiber: :desc)
        when "Saturated fat"
            order(sat_fats: :desc)
        when "Polyunsaturated fat"
            order(poly_unsat_fats: :desc)
        when "Water"
            order(water: :desc)
        when "Cholesterol"
            order(cholesterol: :desc)
        when "Zinc"
            order(zinc: :desc)
        when "Glucose"
            order(glucose: :desc)
        when "Iron" 
            order(iron: :desc)
        when "Starch"
            order(starch: :desc)
        when "Total Sugar"
            order(total_sugar: :desc)
        else
            all
        end
    end

    def food_nutrient_hash(food)
        new_hash = Hash.new
        food.nutrient_hash.each do |nutrient|
            nutrient_key = nutrient["nutrientNumber"]
            new_hash[nutrient_key] = nutrient["value"] if nutrient_key
        end
        food.update_nutrient(food, new_hash)
    end

    def update_nutrient (food, nutrient_hash)
        food.update(
            total_lipid: nutrient_hash["204"],
            protein: nutrient_hash["203"],
            carbs: nutrient_hash["205"],
            fiber: nutrient_hash["291"],
            starch: nutrient_hash["209"],
            total_sugar: nutrient_hash["269"],
            sucrose: nutrient_hash["210"],
            glucose: nutrient_hash["211"],
            water: nutrient_hash["255"],
            fructose: nutrient_hash["212"],
            lactose: nutrient_hash["213"],
            galactose: nutrient_hash["287"],
            ash: nutrient_hash["207"],
            calcium: nutrient_hash["301"],
            iron: nutrient_hash["303"],
            magnesium: nutrient_hash["304"],
            sodium: nutrient_hash["307"],
            zinc: nutrient_hash["309"],
            copper: nutrient_hash["312"],
            selenium: nutrient_hash["317"],
            vitamin_a: nutrient_hash["318"],
            vitamin_a_r: nutrient_hash["320"],
            cholesterol: nutrient_hash["601"],
            calories: nutrient_hash["208"],
            vitamin_d: nutrient_hash["324"],
            kj: nutrient_hash["268"],
            vitamin_e: nutrient_hash["323"],
            vitamin_c: nutrient_hash["401"],
            niacin: nutrient_hash["406"],
            pantothenic: nutrient_hash["410"],
            vitamin_b6: nutrient_hash["415"],
            total_folate: nutrient_hash["417"],
            folic_acid: nutrient_hash["431"],
            food_folate: nutrient_hash["432"],
            folate_dfe: nutrient_hash["435"],
            sat_fats: nutrient_hash["606"],
            poly_unsat_fats: nutrient_hash["646"]
        )
    end


end
