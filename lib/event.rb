class Event
  attr_reader :name,
              :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    @food_trucks.map(&:name)
  end

  def food_trucks_that_sell(item)
    @food_trucks.find_all do |food_truck|
      food_truck.check_stock(item) > 0
    end
  end

  def total_inventory
    total = Hash.new { |hash,key| hash[key] = { quantity: 0, food_trucks: [] }}
    @food_trucks.each do |food_truck|
      food_truck.inventory.each do |item, amount|
        total[item][:quantity] += amount
        total[item][:food_trucks] << food_truck
        end
      end
    total
  end

  def items_array
    list = []
    total_inventory.each do |item,info|
      list << item
    end
    list
  end

  def overstocked_items
    items_array.find_all do |item|
      total_inventory[item][:quantity] > 50 && food_trucks_that_sell(item).count > 1
    end
  end

end
