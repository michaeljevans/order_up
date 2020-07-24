require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
  end

  describe "relationships" do
    it { should belong_to :chef }
    it { should have_many :dish_ingredients }
    it { should have_many(:ingredients).through(:dish_ingredients) }
  end

  describe 'instance methods' do
    it '#total_calories' do
      chef = Chef.create!(name: 'Gordon Ramsey')
      dish = chef.dishes.create!(name: 'Ribeye', description: '10 oz. Grassfed Ribeye with Brussels sprouts')
      ingredient_1 = Ingredient.create!(name: 'Steak', calories: 400)
      ingredient_2 = Ingredient.create!(name: 'Salt', calories: 1)
      ingredient_3 = Ingredient.create!(name: 'Garlic', calories: 5)
      ingredient_4 = Ingredient.create!(name: 'Brussels Sprouts', calories: 75)
      ingredient_5 = Ingredient.create!(name: 'Butter', calories: 125)
      dish_ingredient_1 = DishIngredient.create!(dish_id: dish.id, ingredient_id: ingredient_1.id)
      dish_ingredient_2 = DishIngredient.create!(dish_id: dish.id, ingredient_id: ingredient_2.id)
      dish_ingredient_3 = DishIngredient.create!(dish_id: dish.id, ingredient_id: ingredient_3.id)
      dish_ingredient_4 = DishIngredient.create!(dish_id: dish.id, ingredient_id: ingredient_4.id)
      dish_ingredient_5 = DishIngredient.create!(dish_id: dish.id, ingredient_id: ingredient_5.id)

      expect(dish.total_calories).to eq(606)
    end
  end
end
