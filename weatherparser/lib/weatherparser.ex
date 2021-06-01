defmodule Weatherparser do
  @moduledoc """
  Documentation for `Weatherparser`.
  """
  @url "https://w1.weather.gov/xml/current_obs/KDTO.xml"

  def execute() do
    case HTTPoison.get(@url) do
      {:ok, response} -> response.body
      {_, response} -> response
    end
  end

  def parse_xml(xml) do
    String.split(xml, "\r\n")
  end
end
