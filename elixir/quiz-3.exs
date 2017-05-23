defmodule Quiz3 do
  import Integer
  import IO

  def prime_factor(1), do: 1
  def prime_factor(2), do: 2
  def prime_factor(3), do: 3
  def prime_factor(5), do: 5
  def prime_factor(7), do: 7
  def prime_factor(11), do: 11
  def prime_factor(13), do: 13
  def prime_factor(17), do: 17
  def prime_factor(19), do: 17

  def prime_factor(n) when is_even(n) do
    prime_factor(div(n, 2))
  end

  def prime_factor(n) when is_odd(n) do
    puts "prime_factor(#{n})"

    half = div(n, 2)

    ubound = if is_odd(half), do: half, else: half + 1

    factor = Stream.iterate(ubound, &(&1 - 2))
          |> Stream.take_while(&(&1 > 0))
          |> Enum.find(fn x -> rem(n, x) == 0 end)

    if factor == 1 do
      puts "Find Prime factor: #{n}"
      n
    else
      another_factor = div(n, factor)

      puts "Factors: #{factor}, #{another_factor}"

      max(prime_factor(factor), prime_factor(another_factor))
    end
  end
end

IO.puts Quiz3.prime_factor(600851475143)
