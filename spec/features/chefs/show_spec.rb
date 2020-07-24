require 'rails_helper'

RSpec.describe "Chef's show page" do
  it "displays the chef's name and see a link to view ingredients used by the chef" do
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

    dish_ingredient_1 = DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_1.id)
    dish_ingredient_2 = DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_2.id)
    dish_ingredient_3 = DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_3.id)
    dish_ingredient_4 = DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_4.id)
    dish_ingredient_5 = DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_5.id)
    dish_ingredient_6 = DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_6.id)
    dish_ingredient_7 = DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_7.id)

    dish_ingredient_8 = DishIngredient.create!(dish_id: dish_2.id, ingredient_id: ingredient_2.id)
    dish_ingredient_8 = DishIngredient.create!(dish_id: dish_2.id, ingredient_id: ingredient_3.id)
    dish_ingredient_8 = DishIngredient.create!(dish_id: dish_2.id, ingredient_id: ingredient_4.id)
    dish_ingredient_8 = DishIngredient.create!(dish_id: dish_2.id, ingredient_id: ingredient_7.id)
    dish_ingredient_8 = DishIngredient.create!(dish_id: dish_2.id, ingredient_id: ingredient_8.id)
    dish_ingredient_8 = DishIngredient.create!(dish_id: dish_2.id, ingredient_id: ingredient_9.id)
    dish_ingredient_8 = DishIngredient.create!(dish_id: dish_2.id, ingredient_id: ingredient_10.id)
    dish_ingredient_8 = DishIngredient.create!(dish_id: dish_2.id, ingredient_id: ingredient_11.id)


    visit "/chefs/#{chef.id}"

    expect(page).to have_content(chef.name)

    click_link 'View Ingredient Repertoire'

    expect(current_path).to eq("/chefs/#{chef.id}/ingredients")

    expect(page).to have_css('.ingredient', count: 11)

    expect(page).to have_content(ingredient_1.name)
    expect(page).to have_content(ingredient_2.name)
    expect(page).to have_content(ingredient_3.name)
    expect(page).to have_content(ingredient_4.name)
    expect(page).to have_content(ingredient_5.name)
    expect(page).to have_content(ingredient_6.name)
    expect(page).to have_content(ingredient_7.name)
    expect(page).to have_content(ingredient_8.name)
    expect(page).to have_content(ingredient_9.name)
    expect(page).to have_content(ingredient_10.name)
    expect(page).to have_content(ingredient_11.name)
  end
end
