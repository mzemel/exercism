defmodule Bob do
  def hey(input) do
    cond do
      is_silence?(input) -> "Fine. Be that way!"
      is_question?(input) -> "Sure."
      is_shouting?(input) -> "Whoa, chill out!"
      is_russian?(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  defp is_silence?(input) do
    Regex.match?(~r/^\s*$/, input)
  end

  defp is_question?(input) do
    Regex.match?(~r/\?$/, input)
  end

  defp is_shouting?(input) do
    has_no_lowercase_letters?(input) && has_capital_letter?(input)
  end

  defp is_russian?(input) do
    Regex.match?(~r/УХОДИ/, input)
  end

  defp has_capital_letter?(input) do
    Regex.match?(~r/[A-Z]+/, input)
  end

  defp has_no_lowercase_letters?(input) do
    Regex.match?(~r/^[^a-z]+$/, input)
  end

end
