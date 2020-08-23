# FoodNutrientApp
This is app is an attempt to consolidate the data from the USDA FoodData Central and provide some rudimentary filtering capaiblities to sort by nutrient values.  Users will be able to export a portion of Food Data Central's database system that provides expanded nutrient profile data for over 7,000 records.  Users can search through this index by and sort by certian nutrient values such as: calories, carbs, total sugar, protein, etc.   
## Local Installation
- Clone this repository, and change into the correct directory.  Run bundle install to install all the necessary gems.  
- The database seed will require the following:
  + <a href="https://fdc.nal.usda.gov/api-key-signup.html">Food Data Central API Key:</a>(Simply Sign Up via Link)
- You will need to fire up your favorite editor and create a .env file to store your API Key (this will be called in the seed file as ENV['FDC_KEY']), via the <a href="https://github.com/bkeepers/dotenv">dotenv gem</a>
- Run all necessary migrations  
  + ```$ rails db:migrate```
- Seed the Database: (!! Warning this will take a considerable amount of time, there are over 7,000 records each with unique nutrient attributes !!) 
  + ```$ rake db:seed``` 
## Usage
- Filtered Searches: 
    + An example search could be "Spinach, sorted by nutrient value: Iron" revealing a list of food records containing the word spinach, ranked by iron content).   
- Saved Meals/Lists: 
    + Users can also craete mealsor lists of foods, with an option to display publically for all users to see; otherwise, lists are private to individual user accounts.  
- Comments: 
    + Registered users can leave comments on their own meals, or leave comments on published meals. 
## Extra Stuff
- <a href='https://github.com/antimonysayz/FoodNutrientApp/issues'>Issues</a>



