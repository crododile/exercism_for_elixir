defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count(l) do
    count l, 0
  end

  def count([h|l], acc) do
    count(l, acc + 1)
  end

  def count([], acc) do
    acc
  end

  @spec reverse(list) :: list
  def reverse(l) do
    reverse l, []
  end

  def reverse([h|l], acc) do
    reverse l, [h|acc]
  end
  
  def reverse([], acc) do
    acc
  end

  @spec map(list, (any -> any)) :: list
  def map(l, f) do
    map l, f, []
  end

  def map([h | l], f, acc) do
    map(l, f, [f.(h) | acc])
  end

  def map([], _f, acc) do
    reverse acc
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do
    filter(l, f, [])
  end

  def filter([h|l], f, acc) do
     case f.(h) do
      true -> filter l, f, [h | acc]
      _false -> filter l, f, acc
    end
  end

  def filter([], _f, acc) do
    reverse acc
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce([h|l], acc, f) do
    reduce(l, f.(h, acc), f)
  end
  
  def reduce([], acc, _f) do
    acc
  end

  @spec append(list, list) :: list
  def append(a, b) do
    append reverse(a), reverse(b), []
  end

  def append(a, [h|b], acc) do
    append a, b, [h|acc]
  end

  def append([h|a], [], acc) do
    append a, [], [h|acc]
  end

  def append([],[],acc) do
    acc
  end

  @spec concat([[any]]) :: [any]
  def concat(ll) do
    concat ll, []
  end

  def concat([[h|t1]|ll], acc) do
    concat [t1|ll], [h|acc]
  end

  def concat([[]|ll], acc) do
    concat ll, acc
  end
  def concat([], acc) do
    reverse acc
  end
end
