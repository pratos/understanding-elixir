defmodule ShoppingApp do
  @moduledoc """
  Documentation for `ShoppingApp`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ShoppingApp.hello()
      :world

  """
  use GenServer

  # Client
  def start_link do
    GenServer.start_link(__MODULE__, [])
  end

  def add(pid, item) do
    GenServer.cast(pid, item)
  end

  def view(pid) do
    GenServer.call(pid, :view)
  end

  def remove(pid, item) do
    GenServer.cast(pid, {:remove, item})
  end

  def stop(pid) do
    GenServer.stop(pid)
  end

  # Server
  def init(list) do
    {:ok, list}
  end

  def terminate(_reason, list) do
    IO.puts("Shutting down the server")
    IO.inspect(list)
    :ok
  end

  def handle_cast({:remove, item}, list) do
    {:noreply, Enum.reject(list, fn it -> it == item end)}
  end

  def handle_cast(item, list) do
    {:noreply, [item | list]}
  end


  # _from ==> Caller's pid
  def handle_call(:view, _from, list) do
    {:reply, list, list}
  end

end
