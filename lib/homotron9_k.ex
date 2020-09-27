defmodule Homotron9K.Application do
  use Application

  def start(_type, _args) do
    children = [Homotron9K.Consumer]

    Supervisor.start_link(children, [strategy: :rest_for_one, name: Homotron9K.Supervisor])
  end
end


defmodule Homotron9K.Consumer do
  use Nostrum.Consumer

  alias Nostrum.Api

  def start_link do
    Consumer.start_link(__MODULE__)
  end

  def handle_event({:MESSAGE_CREATE, msg, _ws_state}) do
    case msg.content do
      "!ping" ->
        Api.create_message(msg.channel_id, "pyongyang!")

      _ ->
        :ignore
    end
  end

  # Default event handler, if you don't include this, your consumer WILL crash if
  # you don't have a method definition for each event type.
  def handle_event(_event) do
    :noop
  end
end

