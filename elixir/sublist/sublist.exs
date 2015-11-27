defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    [aa, bb] = Enum.map([a,b], &Enum.count(&1))
    cond do
      aa < bb ->
        if sublist?(a, b), do: :sublist, else: :unequal
      aa > bb ->
        if superlist?(a, b), do: :superlist, else: :unequal
      aa == bb ->
        if equal?(a, b), do: :equal, else: :unequal
    end
  end

  def sublist?([], b), do: true
  def sublist?(a, b) do
    b
    |> Enum.chunk(Enum.count(a), 1)
    |> Enum.any? &equal?(&1,a)
  end

  def superlist?(a, b), do: sublist?(b,a)

  def equal?(a, b) do
    a === b
  end
end
