defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    Enum.filter candidates, &filter_fun(base, &1)
  end

  defp filter_fun(base, candidate) do
    [bb, cc] = Enum.map([base,candidate], &String.downcase(&1))
    char_sort(bb) === char_sort(cc) && bb != cc
  end

  defp char_sort(string) do
    string
    |> String.codepoints
    |> Enum.sort
  end
end
