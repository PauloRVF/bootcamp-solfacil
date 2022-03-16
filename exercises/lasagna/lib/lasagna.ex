defmodule Lasagna do
  @preparation_time 40
  @spent_time_by_layer 2

  def expected_minutes_in_oven, do: @preparation_time

  def remaining_minutes_in_oven(minutes_in_oven), do: expected_minutes_in_oven() - minutes_in_oven

  def preparation_time_in_minutes(layers), do: layers * @spent_time_by_layer

  def total_time_in_minutes(layers, minutes_in_oven), do: preparation_time_in_minutes(layers) + minutes_in_oven

  def alarm, do: "Ding!"
end
