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

  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce(l, acc, f) do

  end

  @spec append(list, list) :: list
  def append(a, b) do

  end

  @spec concat([[any]]) :: [any]
  def concat(ll) do

  end
end
