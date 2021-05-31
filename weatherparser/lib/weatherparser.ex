defmodule Weatherparser do
  @moduledoc """
  Documentation for `Weatherparser`.
  """
  @url "https://w1.weather.gov/xml/current_obs/KDTO.xml"

  def execute() do
    case HTTPoison.get(@url) do
      {:ok, response} -> response
      {_, response} -> response
    end
  end
end
