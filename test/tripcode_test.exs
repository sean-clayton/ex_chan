defmodule ExChan.TripcodeTest do
  use ExUnit.Case
  doctest ExChan.Tripcode
  alias ExChan.Tripcode

  describe "generate" do
    test "it generates a string" do
      assert is_binary Tripcode.generate "a#a"
    end

    test "it generates a string 10 characters long" do
      trip = Tripcode.generate "a#a"
      assert String.length(trip) == 10
    end

    test "it handles a # at the beginning of the name" do
      trip = Tripcode.generate "#a#a"
      assert String.length(trip) == 10
    end

    test "it handles multiple #s" do
      trip = Tripcode.generate "a#a#a#a"
      assert String.length(trip) == 10
    end
  end
end
