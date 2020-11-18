require 'pry'
class CashRegister
    attr_accessor :total, :discount
    attr_reader :title_total, :price_total

    def initialize(discount=nil)
        @total = 0
        @discount = discount
        @title_total = []
        @price_total = []
    end

    def add_item(title, price, quantity=1)
        @total += price * quantity
        quantity.times {@title_total << title}
        @price_total << price
    end

    def apply_discount
        if @discount != nil
            self.total = @total * 0.01 * (100 - @discount)
            p "After the discount, the total comes to $#{@total.to_i}."
        else 
            p "There is no discount to apply."
        end
    end

    def items
        @title_total
    end

    def void_last_transaction
        if @price_total.length == 1
            self.total = 0.0
        else
            self.total = @total - @price_total[-1]
        end
    end
end

