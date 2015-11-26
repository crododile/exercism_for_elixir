defmodule Teenager do
  def hey(input) do
    cond do
        String.strip(input) |> String.length == 0 -> "Fine. Be that way!"
        String.ends_with?(input, "?") -> "Sure."
        # String.upcase(input) == input and !String.match?(input, ~r/\A[0-9,\s]*\Z/)-> "Whoa, chill out!"
        String.upcase(input) == input and String.downcase(input) != input -> "Whoa, chill out!" # thanks bolek
        true -> "Whatever."
    end
  end
end
