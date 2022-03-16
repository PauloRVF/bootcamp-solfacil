defmodule BirdCount do
  def today(list), do: Enum.at(list, 0)

  def increment_day_count([]), do: [1]
  def increment_day_count(list), do: [today(list) + 1 | tl(list)]

  def has_day_without_birds?(list), do: Enum.member?(list, 0)

  def total(list), do: Enum.sum(list)

  def busy_days(list), do: Enum.count(list, fn elem -> elem >= 5 end)
end
