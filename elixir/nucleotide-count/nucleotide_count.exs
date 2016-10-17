defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a NucleotideCount strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) when nucleotide in 'ATCG' do
    if invalid_char?(strand), do: raise ArgumentError

    strand
    |> Enum.filter(fn(x) -> x == nucleotide end)
    |> Enum.count
  end
  def count(_, _), do: raise ArgumentError


  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """

  def invalid_char?(strand) do
    strand
    |> Enum.reject(fn(x) -> x in 'ACTG' end)
    |> Enum.empty?
    |> Kernel.not
  end

  @spec histogram([char]) :: map
  def histogram(strand) do
    if invalid_char?(strand), do: raise ArgumentError

    %{
      ?A => count(strand, ?A),
      ?T => count(strand, ?T),
      ?C => count(strand, ?C),
      ?G => count(strand, ?G)
    }
  end
end
