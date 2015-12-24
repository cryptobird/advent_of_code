defmodule AdventCoin do
  @key "iwrupvqb"

  def find_my_coin, do: find_coin(@key)
  def find_coin(key), do: find_coin(key, 1)
  def find_coin(key, num) do
    full_key = "#{key}#{num}"
    if is_coin?(full_key) do
      IO.puts(full_key)
    else
      find_coin(key, num+1)
    end
  end

  def is_coin?(string) do
    string
    |> :crypto.md5
    |> Base.encode16
    |> String.starts_with?("00000")
  end

  def is_new_coin?(string) do
    string
    |> :crypto.md5
    |> Base.encode16
    |> String.starts_with?("000000")
  end

  def key_to_hex(string) do
    string
    |> :crypto.md5
    |> Base.encode16
  end
end

# if the bitstring has first two digits
# are 0 mod 256 and the third digit is n < 16
# the hex encoding will begin with 5 zeros.
