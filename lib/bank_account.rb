require 'pry'
class BankAccount
    attr_reader :name
    attr_accessor :balance, :status

    def initialize(name, balance=1000, status="open")
        @name = name
        @balance = balance
        @status = status

    end 

    def deposit(deposit)
        @balance += deposit
    end 

    def display_balance
        p "Your balance is $#{@balance}."
    end 

    def valid?
        if self.status == "open" && self.balance > 0
            true
        else
            false
        end
    end 

    def close_account
        self.status = "closed"
    end 
end

#person1 = BankAccount.new
