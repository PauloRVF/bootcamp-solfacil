defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @spec count(charlist(), char()) :: non_neg_integer()
  def count(strand, nucleotide), do: Enum.count(strand, &(&1 == nucleotide))

  @spec histogram(charlist()) :: map()
  def histogram(strand) do
    new_map = Map.new(@nucleotides, &({&1, 0}))

    strand
    |> Enum.frequencies
    |> Enum.into(new_map)
  end
end
