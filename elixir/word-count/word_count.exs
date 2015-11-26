defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    sentence 
    |> String.downcase
    |> remove_punctuation
    |> String.split(" ")
    |> reducing
  end

  def remove_punctuation(string) do
    string
    |> String.codepoints
    |> Enum.reject( &(String.match?(&1, ~r/[,.!:#&@$%^&]/)) )
    |> Enum.map( &(underscore_to_space(&1)) )
    |> to_string
  end

  def underscore_to_space("_") do
    " "
  end

  def underscore_to_space(not_underscore) do
    not_underscore
  end

  def reducing(a_list) do
    Enum.reduce( a_list, %{}, &(counting(&1, &2)) )
  end

  def counting("", the_dict) do
    #some empties make it into the list if splitting on multiple spaces ie String.split("   ") --> ["","",""]
    the_dict
  end

  def counting(word, the_dict) do
    Dict.update(the_dict, word, 1, fn(val) -> val + 1 end)
  end
end
