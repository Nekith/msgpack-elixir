defmodule MessagePack.Ext do

  @type type :: non_neg_integer

  @callback pack(term) :: { :ok, { type, binary } } | { :error, term }
  @callback unpack(type, binary) :: { :ok, term } | { :error, term }

  defmodule Behaviour do
    defmacro __using__(_) do
      quote do
        @behaviour MessagePack.Ext
      end
    end
  end
end
