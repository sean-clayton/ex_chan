defmodule ExChan.Tripcode do
  @moduledoc """
  Provides helper functions for working with tripcodes, such as storing tripcode hashes and generating them.
  """

  @doc """
  Generates a tripcode for posts. Passed string _must_ have at least on # symbol not in the beginning or end.
  """
  @spec generate(String.t) :: String.t
  def generate(name) do
    [_name | secret] = String.split(name, "#")

    secret = Enum.join(secret)

    secret
    # Repeat the secret so we don't pad with the same chars
    |> String.pad_trailing(25, secret)
    # The encode function needs a charlist for some reason
    |> String.to_charlist
    |> Comeonin.Bcrypt.Base64.encode
    |> Enum.take(-10)
    |> List.to_string
  end
end
