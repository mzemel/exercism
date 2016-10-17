defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    sentence
    |> String.downcase
    |> String.replace(~r/[:!&@$%^&,]+/, "")
    |> String.replace(~r/_/, " ")
    |> String.split(~r/\s+/)
    |> count_words
  end

  defp count_words(coll) do
    count_words(coll, %{})
  end

  defp count_words([], map) do
    map
  end

  defp count_words([head | tail], map) do
    count_words(tail, Map.update(map, head, 1, fn(_) -> (map[head] + 1) end))
  end
end
