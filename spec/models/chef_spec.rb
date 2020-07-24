require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
  end

  describe "relationships" do
    it { should have_many :dishes }
  end

  describe 'instance methods' do
    it '#unique_ingredients' do
      chef = Chef.create!(name: 'Gordon Ramsey')
      dish_1 = chef.dishes.create!(name: 'Ribeye', description: 'Grassfed Ribeye with Brussels Sprouts')
      dish_2 = chef.dishes.create!(name: 'Breakfast Scramble', description: 'Scrambled Eggs, Potatoes, Veggie Medley')
      ingredient_1 = Ingredient.create!(name: 'Steak', calories: 400)
      ingredient_2 = Ingredient.create!(name: 'Salt', calories: 1)
      ingredient_3 = Ingredient.create!(name: 'Pepper', calories: 1)
      ingredient_4 = Ingredient.create!(name: 'Garlic', calories: 5)
      ingredient_5 = Ingredient.create!(name: 'Brussels Sprouts', calories: 75)
      ingredient_6 = Ingredient.create!(name: 'Olive Oil', calories: 100)
      ingredient_7 = Ingredient.create!(name: 'Butter', calories: 125)
      ingredient_8 = Ingredient.create!(name: 'Bell Pepper', calories: 25)
      ingredient_9 = Ingredient.create!(name: 'Onion', calories: 20)
      ingredient_10 = Ingredient.create!(name: 'Potato', calories: 90)
      ingredient_11 = Ingredient.create!(name: 'Egg', calories: 70)

      DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_1.id)
      DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_2.id)
      DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_3.id)
      DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_4.id)
      DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_5.id)
      DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_6.id)
      DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_7.id)

      DishIngredient.create!(dish_id: dish_2.id, ingredient_id: ingredient_2.id)
      DishIngredient.create!(dish_id: dish_2.id, ingredient_id: ingredient_3.id)
      DishIngredient.create!(dish_id: dish_2.id, ingredient_id: ingredient_4.id)
      DishIngredient.create!(dish_id: dish_2.id, ingredient_id: ingredient_7.id)
      DishIngredient.create!(dish_id: dish_2.id, ingredient_id: ingredient_8.id)
      DishIngredient.create!(dish_id: dish_2.id, ingredient_id: ingredient_9.id)
      DishIngredient.create!(dish_id: dish_2.id, ingredient_id: ingredient_10.id)
      DishIngredient.create!(dish_id: dish_2.id, ingredient_id: ingredient_11.id)

      expect(chef.unique_ingredients.count).to eq(11)
    end
  end
end
