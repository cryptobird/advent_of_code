defmodule Naughty do
  @bad_strings ["ab", "cd", "pq", "xy"]
  @vowels 'aeiou'

  def three_vowels?(string) do
    three_vowels?(String.to_char_list(string), 0)
  end
  defp three_vowels?(_charlist, 3), do: true
  defp three_vowels?([], _acc), do: false
  defp three_vowels?([h | t], acc) do
    if Enum.any?(@vowels, &(&1 == h)) do
       three_vowels?(t, acc + 1)
    else
      three_vowels?(t, acc)
    end
  end
  def three_vowels_?(string) do
    String.to_char_list(string)
    |> Enum.filter(fn x ->
       Enum.any?(@vowels, fn y ->
         y == x
       end)
    end)
    |> to_string()
    |> String.length

  end
  def is_bad?(string), do: String.contains?(string, @bad_strings)

  def double_letters?(string), do: double_letters?(String.to_char_list(string), nil)
  defp double_letters?([h | t], nil), do: double_letters?(t, h)
  defp double_letters?([], _letter), do: false
  defp double_letters?([h | t], letter) do
    if h == letter do
      true
    else
      double_letters?(t, h)
    end
  end

  def is_nice?(string) do
    cond do
      is_bad?(string)                                  -> false
      double_letters?(string) && three_vowels?(string) -> true
      true                                             -> false
    end
  end

  def naughty_count(filename) do
     File.read!(filename)
     |> String.split("\n")
     |> Enum.reject(&(&1 == ""))
     |> naughty_count(0)
  end

  defp naughty_count([], acc), do: "#{acc} nice files!"
  defp naughty_count([h | t], acc) do
    if is_nice?(h) do
      naughty_count(t, acc + 1)
    else
      naughty_count(t, acc)
    end
  end
end
