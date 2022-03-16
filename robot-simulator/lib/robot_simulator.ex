defmodule RobotSimulator do
  @direction ~w(north east south west)a
  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec create(direction :: atom, position :: {integer, integer}) :: any
  def create(direction \\ :north, position \\ {0, 0}) do
    with :valid <- validate_position(position),
         :valid <- validate_direction(direction),
         do: {direction, position}
  end

  defp validate_direction(direction) when direction in @direction, do: :valid
  defp validate_direction(_), do: {:error, "invalid direction"}

  defp validate_position({x, y}) when is_integer(x) and is_integer(y), do: :valid
  defp validate_position(_), do: {:error, "invalid position"}

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot :: any, instructions :: String.t()) :: any
  def simulate(robot, instructions) do
    String.graphemes(instructions)
    |> Enum.reduce(robot, fn elem, acc ->
      move(acc, elem)
    end)
  end

  defp new_direction(direction, factor) do
    directions = Stream.cycle(@direction)
    actual_index = Enum.find_index(directions, &(&1 == direction))

    Enum.at(directions, actual_index + factor)
  end

  def move({direction, position}, "R") when direction in @direction, do: {new_direction(direction, _index_rotation = 1), position}
  def move({direction, position}, "L") when direction in @direction, do: {new_direction(direction, _index_rotation = 3), position}

  def move({:north = direction, {x, y}}, "A"), do: {direction, {x, y + 1}}
  def move({:east = direction, {x, y}}, "A"), do: {direction, {x + 1, y}}
  def move({:south = direction, {x, y}}, "A"), do: {direction, {x, y - 1}}
  def move({:west = direction, {x, y}}, "A"), do: {direction, {x - 1, y}}

  def move(_,_), do: {:error, "invalid instruction"}

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: any) :: atom
  def direction({direction, _position}), do: direction

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: any) :: {integer, integer}
  def position({_direction, position}), do: position
end
