# ============================ Borrowing Options Class ================================
class Borrow
attr_accessor :loan_amount, :payoff, :due_date, :funding_date

  def initialize(loan_amount, payoff, due_date, funding_date)
    @balance = 0
    @loan_amount = loan_amount
    @payoff = payoff
    @due_date = due_date
    @funding_date = Time.now.strftime("%B %d, %Y")
  end

  def balance
    @balance
  end

  def set_interest(principle, interest_as_percent, time_period)
    principle = @loan_amount
    time_period = @due_date
    principle(1 + interest_as_percent * time_period)
  end

  def set_date(day, month, year)
    @day = day
    @month = month
    @year = year
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


# ============================ Borrow Options Class Instantiation ================================

option_1 = Borrow.new(18, 20, "May 26, 2017", "today")
option_2 = Borrow.new(18, 24, "June 2, 2017", "today")
option_3 = Borrow.new(45, 50, "May 26, 2017", "today")

# ============================ Bot Interaction & User Borrowing Options ================================

while true
  puts "How much Bot money would you like to borrow?"
  puts "Here are your options:"
  puts "type 1 to borrow $#{option_1.loan_amount} on #{option_1.funding_date}, and pay me back $#{option_1.payoff} on #{option_1.due_date}"
  puts "type 2 to borrow $#{option_2.loan_amount} on #{option_2.funding_date}, and pay me back $#{option_2.payoff} on #{option_2.due_date}"
  puts "type 3 to borrow $#{option_3.loan_amount} on #{option_3.funding_date}, and pay me back $#{option_3.payoff} on #{option_3.due_date}"
  option = gets.chomp.to_i
  if option == 1 || option == 2 || option == 3
    break
  end
end

case option
when 1
  puts "Great! You will be transfered $#{option_1.loan_amount} to your account"
  puts "Your payment due date is #{option_1.due_date}, and your total due is $#{option_1.payoff}"
  puts "We will send you a notification when it's closer to the date"
when 2
  puts "Great! You will be transfered $#{option_2.loan_amount} to your account"
  puts "Your payment due date is #{option_2.due_date}, and your total due is $#{option_2.payoff}"
  puts "We will send you a notification when it's closer to the date"
when 3
  puts "Great! You will be transfered $#{option_3.loan_amount} to your account"
  puts "Your payment due date is #{option_3.due_date}, and your total due is $#{option_3.payoff}"
  puts "We will send you a notification when it's closer to the date"
end
