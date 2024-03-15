require_relative 'starter2'

RSpec.describe VendingMachine do
  before :each do
    @vending_machine = VendingMachine.new
  end

  it 'starts with 20 bottles' do
    expect(@vending_machine.bottles).to eq(20)
  end

  it 'decreases the number of bottles when purchased' do
    @vending_machine.purchase(7)
    expect(@vending_machine.bottles).to eq(13)
  end

  it 'increases the number of bottles when restocked' do
    @vending_machine.restock(20)
    expect(@vending_machine.bottles).to eq(40)
  end

  it 'shows correct number of bottles' do
    expect { @vending_machine.report }.to output("Inventory: 20 bottles\n").to_stdout
  end
end
