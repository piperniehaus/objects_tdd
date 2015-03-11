# CashRegister
class CashRegister
  def initialize
    @total = 0.00
  end

  def purchase(price)
    @total += price
    float_to_money(@total)
  end

  def pay(amount)
    if amount >= @total
      change = amount - @total
      @total = 0
      "Your change is $#{float_to_money(change)}"
    else
      @total -= amount
      "Your new total is $#{float_to_money(@total)}"
    end
  end

  def float_to_money(number)
    format('%.2f', number)
  end

  def total
    float_to_money(@total)
  end
end

if __FILE__ == $PROGRAM_NAME
  # puts CashRegister.new.float_to_money(2.5)
end
