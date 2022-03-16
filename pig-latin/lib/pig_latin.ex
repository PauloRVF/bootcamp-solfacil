defmodule PigLatin do
  @consonants ~w(qu b c d f g h j k l m n p q r s t v w x y z)
  @vowels ~w(a e i o u)
    ++ Enum.map(@consonants, &("y" <> &1))
    ++ Enum.map(@consonants, &("x" <> &1))


  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase
    |> String.split()
    |> Enum.map(&translate_word/1)
    |> Enum.join(" ")
  end

  defp translate_word(word) do
    cond do
      String.starts_with?(word, @vowels) ->
        word
        |> pigalize()

      String.starts_with?(word, @consonants) ->
        word
        |> consonants_to_end()
        |> pigalize()

      true -> word
    end
  end

  defp pigalize(word), do: word <> "ay"

  defp consonants_to_end(word) do
    match = Enum.find(@consonants, &(String.starts_with?(word, &1)) )

    {first, rest} = String.split_at(word, String.length(match))
    new_word = rest <> first

    cond do
      String.starts_with?(new_word, @consonants) and String.first(rest) != "y" ->
        consonants_to_end(new_word)

      true ->
        new_word
    end

  end
end
