defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(number) do
    do_convert(number, [])
  end

  defp do_convert(number, noises) when rem(number,3) == 0 do
    round(number / 3) |> do_convert(noises ++ ["Pling"])
  end

  defp do_convert(number, noises) when rem(number,5) == 0 do
    round(number / 5) |> do_convert(noises ++ ["Plang"])
  end

  defp do_convert(number, noises) when rem(number,7) == 0 do
    round(number / 7) |> do_convert(noises ++ ["Plong"])
  end

  defp do_convert(number, noises) when length(noises) == 0 do
    number |> Integer.to_string
  end

  defp do_convert(_, noises) do
    noises |> Enum.uniq |> Enum.join
  end
end
