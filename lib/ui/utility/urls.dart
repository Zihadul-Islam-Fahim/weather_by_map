class Urls{
  String url(lat,lon) =>
      "https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$lon&current=temperature_2m,is_day,weather_code,surface_pressure,wind_speed_10m&hourly=temperature_2m,weather_code&daily=weather_code,temperature_2m_max,temperature_2m_min,sunrise,sunset,daylight_duration&wind_speed_unit=ms&precipitation_unit=inch&timeformat=unixtime&timezone=auto&past_days=30&forecast_days";
}