defmodule DNA do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> DNA.to_rna('ACTG')
  'UGAC'
  """
  @mapping %{?G => ?C, ?C => ?G, ?T => ?A, ?A => ?U}

  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    Enum.map( dna, &Dict.get(@mapping, &1))
  end
end
