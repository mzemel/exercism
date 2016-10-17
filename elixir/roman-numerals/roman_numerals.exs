defmodule Roman do

  @numeral_values [
    {"M", 1000},
    {"CM", 900},
    {"D", 500},
    {"CD", 400},
    {"C", 100},
    {"XC", 90},
    {"L", 50},
    {"XL", 40},
    {"X", 10},
    {"IX", 9},
    {"V", 5},
    {"IV", 4},
    {"I", 1}
  ]

  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t
  def numerals(number) do
    count_numerals("", number)
  end

  defp count_numerals(numerals, 0), do: numerals
  defp count_numerals(numerals, number) do
    {char, val} = Enum.find(@numeral_values, fn({_, val}) -> val <= number end)
    count_numerals(numerals <> char, number - val)
  end
end
