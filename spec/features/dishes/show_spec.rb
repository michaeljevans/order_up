require 'rails_helper'

RSpec.describe "Dish's show page" do
  it "displays a list of ingredients for that dish and the chef's name " do
    chef = Chef.create!(name: 'Gordon Ramsey')
    dish = chef.dishes.create!(name: 'Ribeye', description: '10 oz. Grassfed Ribeye with Brussels sprouts')
    ingredient_1 = Ingredient.create!(name: 'Steak', calories: 400)
    ingredient_2 = Ingredient.create!(name: 'Salt', calories: 1)
    ingredient_3 = Ingredient.create!(name: 'Pepper', calories: 1)
    ingredient_4 = Ingredient.create!(name: 'Garlic', calories: 5)
    ingredient_5 = Ingredient.create!(name: 'Brussels Sprouts', calories: 75)
    ingredient_6 = Ingredient.create!(name: 'Olive Oil', calories: 100)
    ingredient_7 = Ingredient.create!(name: 'Butter', calories: 125)
    dish_ingredient_1 = DishIngredient.create!(dish_id: dish.id, ingredient_id: ingredient_1.id)
    dish_ingredient_2 = DishIngredient.create!(dish_id: dish.id, ingredient_id: ingredient_2.id)
    dish_ingredient_3 = DishIngredient.create!(dish_id: dish.id, ingredient_id: ingredient_3.id)
    dish_ingredient_4 = DishIngredient.create!(dish_id: dish.id, ingredient_id: ingredient_4.id)
    dish_ingredient_5 = DishIngredient.create!(dish_id: dish.id, ingredient_id: ingredient_5.id)
    dish_ingredient_6 = DishIngredient.create!(dish_id: dish.id, ingredient_id: ingredient_6.id)
    dish_ingredient_7 = DishIngredient.create!(dish_id: dish.id, ingredient_id: ingredient_7.id)

    visit "/dishes/#{dish.id}"

    expect(page).to have_content(dish.name)

    within '.ingredients' do
      expect(page).to have_content(ingredient_1.name)
      expect(page).to have_content(ingredient_2.name)
      expect(page).to have_content(ingredient_3.name)
      expect(page).to have_content(ingredient_4.name)
      expect(page).to have_content(ingredient_5.name)
      expect(page).to have_content(ingredient_6.name)
      expect(page).to have_content(ingredient_7.name)
    end

    expect(page).to have_content(chef.name)
  end
end
