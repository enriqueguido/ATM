# ============================ Lending Options Class ================================
class Lend
  attr_accessor :loan_amount, :payoff, :due_date, :funding_date

  def initialize(loan_amount, payoff, due_date, funding_date)
    @balance = 0
    @loan_amount = loan_amount
    @payoff = payoff
    @due_date = due_date
    @funding_date = Time.now.strftime("%B %d, %Y")
    @min_lend_amount = 5
    if @min_lend_amount < 5
      raise ArgumentError.new "The min amount to lend is $#{@min_lend_amount}."
    end

  end

  def balance
    @balance
  end

  def set_interest(principle, interest_as_percent, time_period)
    principle = @loan_amount
    time_period = @due_date
    principle(1 + interest_as_percent * time_period)
  end

  def set_date(month, day, year)
    @month = month
    @day = day
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

# ============================ Lending Options Class Instantiation ================================

lend_option_1 = Lend.new(18, 20, "May 26, 2017", "today")
lend_option_2 = Lend.new(18, 24, "June 2, 2017", "today")
lend_option_3 = Lend.new(45, 50, "May 26, 2017", "today")

# ============================ Bot Interaction & User Lending Options ================================

while true
  puts "How much Bot money would you like to lend?"
  puts "Here are your options:"
  puts "type 1 to lend $#{lend_option_1.loan_amount} on #{lend_option_1.funding_date}, and receive back $#{lend_option_1.payoff} on #{lend_option_1.due_date}"
  puts "type 2 to lend $#{lend_option_2.loan_amount} on #{lend_option_2.funding_date}, and receive back $#{lend_option_2.payoff} on #{lend_option_2.due_date}"
  puts "type 3 to lend $#{lend_option_3.loan_amount} on #{lend_option_3.funding_date}, and receive back $#{lend_option_3.payoff} on #{lend_option_3.due_date}"
  option = gets.chomp.to_i
  if option == 1 || option == 2 || option == 3
    break
  end
end

case option
when 1
  puts "Great! You will be lending out $#{lend_option_1.loan_amount} to our users."
  puts "As a return your payback will be a total of $#{lend_option_1.payoff}."
  puts "Your payment will be directly deposited to your account on #{lend_option_1.due_date}"
  puts "We will send you a notification when the deposit has been completed."
when 2
  puts "Great! You will be lending out $#{lend_option_2.loan_amount} to our users."
  puts "As a return your payback will be a total of $#{lend_option_2.payoff}."
  puts "Your payment will be directly deposited to your account on #{lend_option_2.due_date}"
  puts "We will send you a notification when the deposit has been completed."
when 3
  puts "Great! You will be lending out $#{lend_option_3.loan_amount} to our users."
  puts "As a return your payback will be a total of $#{lend_option_3.payoff}."
  puts "Your payment will be directly deposited to your account on #{lend_option_3.due_date}"
  puts "We will send you a notification when the deposit has been completed."
end
