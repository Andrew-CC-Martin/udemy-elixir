defmodule Cards do
  @moduledoc """
  Documentation for Cards.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Cards.create_deck()
      [
        "Ace of Spades", "Two of Spades", "Three of Spades",
        "Four of Spades", "Five of Spades", "Ace of Clubs", "Two of Clubs",
        "Three of Clubs", "Four of Clubs", "Five of Clubs",
        "Ace of Hearts", "Two of Hearts", "Three of Hearts",
        "Four of Hearts", "Five of Hearts", "Ace of Diamonds",
        "Two of Diamonds", "Three of Diamonds", "Four of Diamonds",
        "Five of Diamonds"
      ]

  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end     

  end

  def shuffle(deck) do
    deck
    |> Enum.shuffle
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def deal(deck, hand_size) do
    { a, _ } = Enum.split(deck, hand_size)
    a
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      { :ok, binary } -> :erlang.binary_to_term(binary)
      { :error, _ } -> "File doesn't exist"
    end
  end

  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end
end
