require "minitest/autorun"
require "minitest/pride"
require "./lib/item"
require "./lib/food_truck"
require "./lib/event"

class ClassTest < Minitest::Test

  def test_it_exists
    event = Event.new("South Pearl Street Farmers Market")
    assert_instance_of Event, event
  end

  def test_it_has_attributes
    event = Event.new("South Pearl Street Farmers Market")
    assert_equal "South Pearl Street Farmers Market", event.name
  end

  def test_food_trucks_start_empty
    event = Event.new("South Pearl Street Farmers Market")
    assert_equal [], event.food_trucks 
  end

end
