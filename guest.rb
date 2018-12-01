class Guest

  attr_reader :name, :wallet, :favourite_song

  def initialize(name, wallet, fave_song)
    @name = name
    @wallet = wallet
    @favourite_song = fave_song
  end

  def enter_guest(entry_fee)
    @wallet -= entry_fee
  end

end
