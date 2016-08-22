defmodule MessagePackIoDataTest do
  use ExUnit.Case, async: true

  test "simple list io data serialization" do
    list = Enum.to_list(1..100)
    pack_normal = MessagePack.pack! list
    {pack_io, size} = MessagePack.pack_iodata! list
    assert pack_normal == :erlang.iolist_to_binary pack_io
    assert byte_size(pack_normal) == size
  end

  test "nested list io data serialization" do
    list = [1,2,[3,4]]
    pack_normal = MessagePack.pack! list
    {pack_io, size} = MessagePack.pack_iodata! list
    assert pack_normal == :erlang.iolist_to_binary pack_io
    assert byte_size(pack_normal) == size
  end

  test "map io data serialization" do
    map = %{"a"=>3, "b"=>4}
    pack_normal = MessagePack.pack! map
    {pack_io, size} = MessagePack.pack_iodata! map
    assert pack_normal == :erlang.iolist_to_binary pack_io
    assert byte_size(pack_normal) == size
  end

  test "nested map io data serialization" do
    map = %{"a"=>3, 5=>"f", :d=>%{"z"=>6}}
    pack_normal = MessagePack.pack! map
    {pack_io, size} = MessagePack.pack_iodata! map
    assert pack_normal == :erlang.iolist_to_binary pack_io
    assert byte_size(pack_normal) == size
  end

  test "nested map with list and map io data serialization" do
    map = %{"a"=>3, 5=>"f", :d=>%{"z"=>[8,9,"a",%{"fey"=>"noon"}]}}
    pack_normal = MessagePack.pack! map
    {pack_io, size} = MessagePack.pack_iodata! map
    assert pack_normal == :erlang.iolist_to_binary pack_io
    assert byte_size(pack_normal) == size
  end

  test "nested list with map and list io data serialization" do
    list = ["a", %{"b"=>2, "C"=>[98,32,54]}, 8]
    pack_normal = MessagePack.pack! list
    {pack_io, size} = MessagePack.pack_iodata! list
    assert pack_normal == :erlang.iolist_to_binary pack_io
    assert byte_size(pack_normal) == size
  end
end
