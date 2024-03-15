class VendingMachine
  attr_reader :bottles

  def initialize
    @bottles = 20
  end

  def purchase(amount)
    @bottles -= amount
  end

  def restock(amount)
    @bottles += amount
  end

  def report
    puts "Inventory: #{@bottles} bottles"
  end
end

if __FILE__ == $0
  drink_machine = VendingMachine.new
  drinks_to_buy = gets.to_i
  bottles_to_stock = gets.to_i
  drink_machine.purchase(drinks_to_buy)
  drink_machine.restock(bottles_to_stock)
  drink_machine.report
end 
