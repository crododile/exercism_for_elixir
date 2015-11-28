defmodule Phone do
  @doc """
  Remove formatting from a phone number.

  Returns "0000000000" if phone number is not valid
  (10 digits or "1" followed by 10 digits)

  ## Examples

  iex> Phone.number("123-456-7890")
  "1234567890"

  iex> Phone.number("+1 (303) 555-1212")
  "3035551212"

  iex> Phone.number("867.5309")
  "0000000000"
  """
  @spec number(String.t) :: String.t
  def number(raw) do
    case String.match?(raw, ~r/[A-Za-z]/) do
      true -> "0000000000"
      _ -> do_it(raw)
    end
  end

  def do_it(raw) do
    raw
    |> only_digits
    |> numero
  end

  def numero(raw) when byte_size(raw) < 10, do: "0000000000"
  def numero(raw) when byte_size(raw) > 11, do: "0000000000"
  def numero(raw) when byte_size(raw) == 11 do
    case String.split_at(raw, 1) do
      {"1", others} -> numero(others)
      _ -> "0000000000"
    end
  end

  def only_digits(raw) do
    String.replace raw, ~r/\D/, ""
  end

  def numero(raw) do
    raw
  end

  @doc """
  Extract the area code from a phone number

  Returns the first three digits from a phone number,
  ignoring long distance indicator

  ## Examples

  iex> Phone.area_code("123-456-7890")
  "123"

  iex> Phone.area_code("+1 (303) 555-1212")
  "303"

  iex> Phone.area_code("867.5309")
  "000"
  """
  @spec area_code(String.t) :: String.t
  def area_code(raw) do
    {code, _} = code_and_rest(raw)
    code
  end
  
  def code_and_rest(raw) do
    {code, the_rest} = raw 
    |> number
    |> String.split_at 3
  end

  @doc """
  Pretty print a phone number

  Wraps the area code in parentheses and separates
  exchange and subscriber number with a dash.

  ## Examples

  iex> Phone.pretty("123-456-7890")
  "(123) 456-7890"

  iex> Phone.pretty("+1 (303) 555-1212")
  "(303) 555-1212"

  iex> Phone.pretty("867.5309")
  "(000) 000-0000"
  """
  @spec pretty(String.t) :: String.t
  def pretty(raw) do
    {code, the_rest} = code_and_rest(raw)
    {first_of_rest, last_of_rest} = the_rest
    |> String.split_at(3)
    "(#{code}) #{first_of_rest}-#{last_of_rest}"
  end
end
