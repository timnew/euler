(1..999)
|> Stream.filter(fn i -> rem(i, 5) == 0 or rem(i, 3) == 0 end)
|> Enum.sum()
|> IO.puts()
