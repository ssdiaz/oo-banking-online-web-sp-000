class Transfer
  # your code here
  attr_reader :amount
  attr_accessor :status, :sender, :receiver

  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction#(sender, receiver, amount)

    if (sender.balance > amount && status == "pending" && vaid?)
      #  while self.status == "pending"
          sender.balance = sender.balance - amount
          receiver.deposit(amount)
          @status = "complete"
      #  end
      else
        print "Transaction rejected. Please check your account balance."
      end
  end


  def reverse_transfer
    if status == "complete"
      receiver.balance = receiver.balance - amount
      sender.deposit(amount)
      @status = "reversed"
    end
  end


end
#learn spec/transfer_spec.rb
