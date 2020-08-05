require "minitest/autorun"
require "minitest/pride"
require "./lib/food_truck"
require "./lib/item"

class FoodTruckTest < Minitest::Test

  def test_it_exists
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    assert_instance_of FoodTruck, food_truck
  end

  def test_it_has_attributes
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    assert_equal "Rocky Mountain Pies", food_truck.name
  end

  def test_inventory_starts_empty
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    assert_equal ({}), food_truck.inventory
  end

  def test_it_can_stock_inventory
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    food_truck.stock(item1, 30)
    expected = {item1 => 30}
    assert_equal expected, food_truck.inventory
  end

  def test_it_can_check_stock
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    food_truck.stock(item1, 30)

    assert_equal 30, food_truck.check_stock(item1)
  end

end
