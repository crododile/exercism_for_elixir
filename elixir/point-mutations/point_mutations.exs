defmodule DNA do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> DNA.hamming_distance('AAGTCATA', 'TAGCGATC')
  4
  """
  @spec hamming_distance([char], [char]) :: non_neg_integer
  def hamming_distance(strand1, strand2) do
    hamming_distance(strand1, strand2, 0)
  end
  def hamming_distance([h1|strand1], [h2|strand2], acc) do
    case h1 === h2 do
      true -> hamming_distance( strand1, strand2, acc )
      false -> hamming_distance( strand1, strand2, acc + 1)
    end
  end

  def hamming_distance([],[],acc), do: acc
  def hamming_distance([],something, _acc), do: nil
  def hamming_distance(something, [], _acc), do: nil

end
