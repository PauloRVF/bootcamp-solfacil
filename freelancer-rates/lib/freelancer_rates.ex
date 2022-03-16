defmodule FreelancerRates do
  @billable_days 22.0
  @hours 8.0

  def daily_rate(hourly_rate), do: hourly_rate * @hours

  def apply_discount(before_discount, discount) do
    discount_value = before_discount * discount / 100

    before_discount - discount_value
  end

  def monthly_rate(hourly_rate, discount) do
    month_amount = daily_rate(hourly_rate) * @billable_days

    month_amount
    |> apply_discount(discount)
    |> Float.ceil()
    |> round()
  end

  def days_in_budget(budget, hourly_rate, discount) do
    day_amount = apply_discount( daily_rate(hourly_rate), discount )

    (budget / day_amount)
    |> Float.floor(1)
  end
end
