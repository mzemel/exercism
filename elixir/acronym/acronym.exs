defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string 
    |> String.replace(~r/[,-]/, " ") # Punctuation becomes whitespace
    |> String.split(~r/\s+/)         # Split along whitespace
    |> Enum.map(&String.capitalize/1)# Upcase first letter
    |> Enum.join(" ")                # Re-form string
    |> String.replace(~r/[^A-Z]/, "")# Only keep upcased letters
  end
end
