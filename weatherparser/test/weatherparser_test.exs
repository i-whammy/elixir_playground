defmodule WeatherparserTest do
  use ExUnit.Case
  doctest Weatherparser
  @xml """
<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?> \r\n
<?xml-stylesheet href=\"latest_ob.xsl\" type=\"text/xsl\"?>\r\n
<current_observation version=\"1.0\"\r\n
\t xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\"\r\n
\t xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\r\n
\t xsi:noNamespaceSchemaLocation=\"http://www.weather.gov/view/current_observation.xsd\">\r\n
\t<credit>NOAA's National Weather Service</credit>\r\n
\t<credit_URL>http://weather.gov/</credit_URL>\r\n
\t<image>\r\n
\t\t<url>http://weather.gov/images/xml_logo.gif</url>\r\n
\t\t<title>NOAA's National Weather Service</title>\r\n
\t\t<link>http://weather.gov</link>\r\n
\t</image>\r\n
\t<suggested_pickup>15 minutes after the hour</suggested_pickup>\r\n
\t<suggested_pickup_period>60</suggested_pickup_period>\n\t<location>Denton Enterprise Airport, TX</location>\n\t<station_id>KDTO</station_id>\n\t<latitude>33.20505</latitude>\n\t<longitude>-97.20061</longitude>\n\t<observation_time>Last Updated on May 31 2021, 5:53 pm CDT</observation_time>\r\n
<observation_time_rfc822>Mon, 31 May 2021 17:53:00 -0500</observation_time_rfc822>\n\t<weather>Thunderstorm in Vicinity Rain</weather>\n\t<temperature_string>66.0 F (19.0 C)</temperature_string>\r\n
\t<temp_f>66.0</temp_f>\r\n
\t<temp_c>19.0</temp_c>\n\t<wind_string>Southeast at 5.8 MPH (5 KT)</wind_string>\n\t<wind_dir>Southeast</wind_dir>\n\t<wind_degrees>140</wind_degrees>\n\t<wind_mph>5.8</wind_mph>\n\t<wind_kt>5</wind_kt>\n\t<pressure_string>1017.7 mb</pressure_string>\n\t<pressure_mb>1017.7</pressure_mb>\n\t<pressure_in>30.07</pressure_in>\n\t<visibility_mi>2.00</visibility_mi>\n\t<two_day_history_url>http://www.weather.gov/data/obhistory/KDTO.html</two_day_history_url>\n\t<ob_url>http://www.weather.gov/data/METAR/KDTO.1.txt</ob_url>\n\t<disclaimer_url>http://weather.gov/disclaimer.html</disclaimer_url>\r\n
\t<copyright_url>http://weather.gov/disclaimer.html</copyright_url>\r\n
\t<privacy_policy_url>http://weather.gov/notice.html</privacy_policy_url>\r\n
</current_observation>\n
"""

  test "parse_xml" do
    assert Weatherparser.parse_xml(@xml) == @xml
  end
end
