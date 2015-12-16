defmodule DayOne do
  @directions File.read!("directions.txt")
  @floor 0
  def read_directions do
    get_direction(String.split(@directions, ""), @floor)
  end

  def get_direction([], floor), do: IO.inspect floor
  def get_direction([h | t], floor) do
    case h do
      "("  -> get_direction(t, floor + 1)
      ")"  -> get_direction(t, floor - 1)
      "\n" -> IO.inspect floor
    end
  end
end

DayOne.read_directions
