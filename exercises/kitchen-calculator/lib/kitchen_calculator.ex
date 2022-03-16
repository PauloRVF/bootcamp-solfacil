defmodule KitchenCalculator do
  @convertion_table %{milliliter: 1, cup: 240, fluid_ounce: 30, teaspoon: 5, tablespoon: 15}

  def get_volume({_, numeric_volume} = _volume_pair), do: numeric_volume

  def to_milliliter({unit, volume} = _volume_pair), do: {:milliliter, volume * @convertion_table[unit]}

  def from_milliliter({_, ml} = _volume_pair, unit), do: {unit, ml / @convertion_table[unit]}

  def convert(volume_pair, unit) do
    volume_pair
    |> to_milliliter()
    |> from_milliliter(unit)
  end
end
