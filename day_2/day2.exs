defmodule WrappingPaper do
  def order(file_name) do
    file_name
    |> File.read!
    |> String.split("\n")
    |> Enum.reject(&(&1 == ""))
    |> total_needed
    |> IO.inspect
  end

  def total_needed(list), do: total_needed(list, 0)
  def total_needed([], total), do: total
  def total_needed([h | t], total), do: total_needed(t, total + area(h))
  
  def area(h) do 
    h
    |> String.split("x")
    |> Enum.map(&String.to_integer/1)
    |> List.to_tuple
    |> calculate
  end

  def calculate({w, l, h}) do 
    [l*w, w*h, h*l]  
    |> double_sum
  end
  
  def double_sum(list), do: Enum.min(list) + Enum.sum(Enum.map(list, &(&1*2)))  
end

WrappingPaper.order("list.txt")
