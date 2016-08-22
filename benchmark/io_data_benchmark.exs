#run from the command line with:
#mix run benchmark/io_data_benchmark.exs
list = Enum.to_list(1..1_000_000)

Benchee.run(%{time: 5, parallel: 2}, %{
  "normal"    => fn -> MessagePack.pack!(list, enable_string: true) end,
  "io data"    => fn -> MessagePack.pack_iodata!(list, io_data: true) end
})
