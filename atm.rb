# ================================ ATM Class ===============================

class Atm
  # attr_reader :balance

  def initialize
    @balance = 0
  end

  def balance
    @balance
  end

  def deposit(amount)
    @balance += amount.to_i
  end

  def withdrawal(amount)
    @balance -= amount
  end

  def transfer(amount, account)
    withdrawal(amount)
    account.deposit(amount)
  end

end

# ================================ ATM Class Instantiation ===============================
atm = Atm.new

# ================================ ATM Bot Interaction ===============================
while true
  puts "Welcome to the Virtual ATM"
  puts "Here are your options:"
  puts "Press 1 to make a Deposit"
  puts "Press 2 to make a Withdraw"
  puts "Press 3 to see Balance"
  puts "(Type the number on the screen to access the option)"
  option = gets.chomp.to_i
  if option == 1 || option == 2 || option == 3
    break
  end
end

puts "Option entered #{option}"

case option
when 1
  puts "How much would you like to desposit?"
  amount = gets.chomp.to_i
  atm.deposit(amount)
  puts "Your total balance is #{atm.balance}"
when 2
  puts "How much would you like to withdraw"
  amount = gets.chomp.to_i
  atm.withdrawal(amount)
  puts "After your withdrawal your total balance is #{atm.balance}"
when 3
  puts "This is your total valance $ #{atm.balance}"
end
