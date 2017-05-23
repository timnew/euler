require Integer

fabonacci  = Stream.unfold({1, 1}, fn {x, y} -> {x, {y, x + y}} end)

fabonacci
|> Stream.filter(fn x -> x < 4_000_000 end)
|> Stream.map(fn x -> IO.puts(x); x end)
|> Stream.filter(&Integer.is_even(&1))
|> Stream.scan(0, &(&1 + &2))
|> Enum.each(&IO.puts/1)
