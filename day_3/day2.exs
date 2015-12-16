defmodule Directions do
  @start {0,0}

  def go(file) do
    file
    |> get_directions
    |> next(@start, [@start])
    |> IO.inspect
  end
  def get_directions(file) do
    File.read!(file)
    |> String.split("")
    |> Enum.reject(&(&1 == ""))
  end

  defp next([], {_x, _y}, record) do
    record
    |> Enum.uniq
    |> length
  end
 
  defp next([n | directions], {x,y}, record) do
    case n do
      "^" -> next(directions, {x, y+1}, [{x, y+1} | record])
      "v" -> next(directions, {x, y-1}, [{x, y-1} | record])
      ">" -> next(directions, {x+1, y}, [{x+1, y} | record])
      "<" -> next(directions, {x-1, y}, [{x-1, y} | record])
    end
  end
end

Directions.go("directions.txt")
