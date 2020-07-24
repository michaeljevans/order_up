class Chef < ApplicationRecord
  validates_presence_of :name

  has_many :dishes

  def unique_ingredients
    dishes.select('ingredients.name').joins(:ingredients).distinct
  end

  def three_most_popular_ingredients
    require "pry"; binding.pry
  end
end
