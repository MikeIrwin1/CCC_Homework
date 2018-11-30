class Guest

  attr_reader :name, :wallet

  def initialize(name, wallet)
    @name = name
    @wallet = wallet
  end

  def enter_guest(entry_fee)
    @wallet -= entry_fee
  end

end
