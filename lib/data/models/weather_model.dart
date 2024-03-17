
class WeatherModel {
  WeatherModel({
      num? latitude, 
      num? longitude, 
      num? generationtimeMs, 
      num? utcOffsetSeconds, 
      String? timezone, 
      String? timezoneAbbreviation, 
      num? elevation, 
      CurrentUnits? currentUnits, 
      Current? current, 
      HourlyUnits? hourlyUnits, 
      Hourly? hourly, 
      DailyUnits? dailyUnits, 
      Daily? daily,}){
    _latitude = latitude;
    _longitude = longitude;
    _generationtimeMs = generationtimeMs;
    _utcOffsetSeconds = utcOffsetSeconds;
    _timezone = timezone;
    _timezoneAbbreviation = timezoneAbbreviation;
    _elevation = elevation;
    _currentUnits = currentUnits;
    _current = current;
    _hourlyUnits = hourlyUnits;
    _hourly = hourly;
    _dailyUnits = dailyUnits;
    _daily = daily;
}

  WeatherModel.fromJson(dynamic json) {
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _generationtimeMs = json['generationtime_ms'];
    _utcOffsetSeconds = json['utc_offset_seconds'];
    _timezone = json['timezone'];
    _timezoneAbbreviation = json['timezone_abbreviation'];
    _elevation = json['elevation'];
    _currentUnits = json['current_units'] != null ? CurrentUnits.fromJson(json['current_units']) : null;
    _current = json['current'] != null ? Current.fromJson(json['current']) : null;
    _hourlyUnits = json['hourly_units'] != null ? HourlyUnits.fromJson(json['hourly_units']) : null;
    _hourly = json['hourly'] != null ? Hourly.fromJson(json['hourly']) : null;
    _dailyUnits = json['daily_units'] != null ? DailyUnits.fromJson(json['daily_units']) : null;
    _daily = json['daily'] != null ? Daily.fromJson(json['daily']) : null;
  }
  num? _latitude;
  num? _longitude;
  num? _generationtimeMs;
  num? _utcOffsetSeconds;
  String? _timezone;
  String? _timezoneAbbreviation;
  num? _elevation;
  CurrentUnits? _currentUnits;
  Current? _current;
  HourlyUnits? _hourlyUnits;
  Hourly? _hourly;
  DailyUnits? _dailyUnits;
  Daily? _daily;
WeatherModel copyWith({  num? latitude,
  num? longitude,
  num? generationtimeMs,
  num? utcOffsetSeconds,
  String? timezone,
  String? timezoneAbbreviation,
  num? elevation,
  CurrentUnits? currentUnits,
  Current? current,
  HourlyUnits? hourlyUnits,
  Hourly? hourly,
  DailyUnits? dailyUnits,
  Daily? daily,
}) => WeatherModel(  latitude: latitude ?? _latitude,
  longitude: longitude ?? _longitude,
  generationtimeMs: generationtimeMs ?? _generationtimeMs,
  utcOffsetSeconds: utcOffsetSeconds ?? _utcOffsetSeconds,
  timezone: timezone ?? _timezone,
  timezoneAbbreviation: timezoneAbbreviation ?? _timezoneAbbreviation,
  elevation: elevation ?? _elevation,
  currentUnits: currentUnits ?? _currentUnits,
  current: current ?? _current,
  hourlyUnits: hourlyUnits ?? _hourlyUnits,
  hourly: hourly ?? _hourly,
  dailyUnits: dailyUnits ?? _dailyUnits,
  daily: daily ?? _daily,
);
  num? get latitude => _latitude;
  num? get longitude => _longitude;
  num? get generationtimeMs => _generationtimeMs;
  num? get utcOffsetSeconds => _utcOffsetSeconds;
  String? get timezone => _timezone;
  String? get timezoneAbbreviation => _timezoneAbbreviation;
  num? get elevation => _elevation;
  CurrentUnits? get currentUnits => _currentUnits;
  Current? get current => _current;
  HourlyUnits? get hourlyUnits => _hourlyUnits;
  Hourly? get hourly => _hourly;
  DailyUnits? get dailyUnits => _dailyUnits;
  Daily? get daily => _daily;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['generationtime_ms'] = _generationtimeMs;
    map['utc_offset_seconds'] = _utcOffsetSeconds;
    map['timezone'] = _timezone;
    map['timezone_abbreviation'] = _timezoneAbbreviation;
    map['elevation'] = _elevation;
    if (_currentUnits != null) {
      map['current_units'] = _currentUnits?.toJson();
    }
    if (_current != null) {
      map['current'] = _current?.toJson();
    }
    if (_hourlyUnits != null) {
      map['hourly_units'] = _hourlyUnits?.toJson();
    }
    if (_hourly != null) {
      map['hourly'] = _hourly?.toJson();
    }
    if (_dailyUnits != null) {
      map['daily_units'] = _dailyUnits?.toJson();
    }
    if (_daily != null) {
      map['daily'] = _daily?.toJson();
    }
    return map;
  }

}


class Daily {
  Daily({
      List<num>? time, 
      List<num>? weatherCode, 
      List<num>? temperature2mMax, 
      List<num>? temperature2mMin, 
      List<num>? sunrise, 
      List<num>? sunset, 
      List<num>? daylightDuration,}){
    _time = time;
    _weatherCode = weatherCode;
    _temperature2mMax = temperature2mMax;
    _temperature2mMin = temperature2mMin;
    _sunrise = sunrise;
    _sunset = sunset;
    _daylightDuration = daylightDuration;
}

  Daily.fromJson(dynamic json) {
    _time = json['time'] != null ? json['time'].cast<num>() : [];
    _weatherCode = json['weather_code'] != null ? json['weather_code'].cast<num>() : [];
    _temperature2mMax = json['temperature_2m_max'] != null ? json['temperature_2m_max'].cast<num>() : [];
    _temperature2mMin = json['temperature_2m_min'] != null ? json['temperature_2m_min'].cast<num>() : [];
    _sunrise = json['sunrise'] != null ? json['sunrise'].cast<num>() : [];
    _sunset = json['sunset'] != null ? json['sunset'].cast<num>() : [];
    _daylightDuration = json['daylight_duration'] != null ? json['daylight_duration'].cast<num>() : [];
  }
  List<num>? _time;
  List<num>? _weatherCode;
  List<num>? _temperature2mMax;
  List<num>? _temperature2mMin;
  List<num>? _sunrise;
  List<num>? _sunset;
  List<num>? _daylightDuration;
Daily copyWith({  List<num>? time,
  List<num>? weatherCode,
  List<num>? temperature2mMax,
  List<num>? temperature2mMin,
  List<num>? sunrise,
  List<num>? sunset,
  List<num>? daylightDuration,
}) => Daily(  time: time ?? _time,
  weatherCode: weatherCode ?? _weatherCode,
  temperature2mMax: temperature2mMax ?? _temperature2mMax,
  temperature2mMin: temperature2mMin ?? _temperature2mMin,
  sunrise: sunrise ?? _sunrise,
  sunset: sunset ?? _sunset,
  daylightDuration: daylightDuration ?? _daylightDuration,
);
  List<num>? get time => _time;
  List<num>? get weatherCode => _weatherCode;
  List<num>? get temperature2mMax => _temperature2mMax;
  List<num>? get temperature2mMin => _temperature2mMin;
  List<num>? get sunrise => _sunrise;
  List<num>? get sunset => _sunset;
  List<num>? get daylightDuration => _daylightDuration;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['time'] = _time;
    map['weather_code'] = _weatherCode;
    map['temperature_2m_max'] = _temperature2mMax;
    map['temperature_2m_min'] = _temperature2mMin;
    map['sunrise'] = _sunrise;
    map['sunset'] = _sunset;
    map['daylight_duration'] = _daylightDuration;
    return map;
  }

}



class DailyUnits {
  DailyUnits({
      String? time, 
      String? weatherCode, 
      String? temperature2mMax, 
      String? temperature2mMin, 
      String? sunrise, 
      String? sunset, 
      String? daylightDuration,}){
    _time = time;
    _weatherCode = weatherCode;
    _temperature2mMax = temperature2mMax;
    _temperature2mMin = temperature2mMin;
    _sunrise = sunrise;
    _sunset = sunset;
    _daylightDuration = daylightDuration;
}

  DailyUnits.fromJson(dynamic json) {
    _time = json['time'];
    _weatherCode = json['weather_code'];
    _temperature2mMax = json['temperature_2m_max'];
    _temperature2mMin = json['temperature_2m_min'];
    _sunrise = json['sunrise'];
    _sunset = json['sunset'];
    _daylightDuration = json['daylight_duration'];
  }
  String? _time;
  String? _weatherCode;
  String? _temperature2mMax;
  String? _temperature2mMin;
  String? _sunrise;
  String? _sunset;
  String? _daylightDuration;
DailyUnits copyWith({  String? time,
  String? weatherCode,
  String? temperature2mMax,
  String? temperature2mMin,
  String? sunrise,
  String? sunset,
  String? daylightDuration,
}) => DailyUnits(  time: time ?? _time,
  weatherCode: weatherCode ?? _weatherCode,
  temperature2mMax: temperature2mMax ?? _temperature2mMax,
  temperature2mMin: temperature2mMin ?? _temperature2mMin,
  sunrise: sunrise ?? _sunrise,
  sunset: sunset ?? _sunset,
  daylightDuration: daylightDuration ?? _daylightDuration,
);
  String? get time => _time;
  String? get weatherCode => _weatherCode;
  String? get temperature2mMax => _temperature2mMax;
  String? get temperature2mMin => _temperature2mMin;
  String? get sunrise => _sunrise;
  String? get sunset => _sunset;
  String? get daylightDuration => _daylightDuration;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['time'] = _time;
    map['weather_code'] = _weatherCode;
    map['temperature_2m_max'] = _temperature2mMax;
    map['temperature_2m_min'] = _temperature2mMin;
    map['sunrise'] = _sunrise;
    map['sunset'] = _sunset;
    map['daylight_duration'] = _daylightDuration;
    return map;
  }

}


class Hourly {
  Hourly({
      List<num>? time, 
      List<num>? temperature2m, 
      List<num>? weatherCode,}){
    _time = time;
    _temperature2m = temperature2m;
    _weatherCode = weatherCode;
}

  Hourly.fromJson(dynamic json) {
    _time = json['time'] != null ? json['time'].cast<num>() : [];
    _temperature2m = json['temperature_2m'] != null ? json['temperature_2m'].cast<num>() : [];
    _weatherCode = json['weather_code'] != null ? json['weather_code'].cast<num>() : [];
  }
  List<num>? _time;
  List<num>? _temperature2m;
  List<num>? _weatherCode;
Hourly copyWith({  List<num>? time,
  List<num>? temperature2m,
  List<num>? weatherCode,
}) => Hourly(  time: time ?? _time,
  temperature2m: temperature2m ?? _temperature2m,
  weatherCode: weatherCode ?? _weatherCode,
);
  List<num>? get time => _time;
  List<num>? get temperature2m => _temperature2m;
  List<num>? get weatherCode => _weatherCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['time'] = _time;
    map['temperature_2m'] = _temperature2m;
    map['weather_code'] = _weatherCode;
    return map;
  }

}


class HourlyUnits {
  HourlyUnits({
      String? time, 
      String? temperature2m, 
      String? weatherCode,}){
    _time = time;
    _temperature2m = temperature2m;
    _weatherCode = weatherCode;
}

  HourlyUnits.fromJson(dynamic json) {
    _time = json['time'];
    _temperature2m = json['temperature_2m'];
    _weatherCode = json['weather_code'];
  }
  String? _time;
  String? _temperature2m;
  String? _weatherCode;
HourlyUnits copyWith({  String? time,
  String? temperature2m,
  String? weatherCode,
}) => HourlyUnits(  time: time ?? _time,
  temperature2m: temperature2m ?? _temperature2m,
  weatherCode: weatherCode ?? _weatherCode,
);
  String? get time => _time;
  String? get temperature2m => _temperature2m;
  String? get weatherCode => _weatherCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['time'] = _time;
    map['temperature_2m'] = _temperature2m;
    map['weather_code'] = _weatherCode;
    return map;
  }

}


class Current {
  Current({
      num? time, 
      num? interval, 
      num? temperature2m, 
      num? isDay, 
      num? weatherCode, 
      num? surfacePressure, 
      num? windSpeed10m,}){
    _time = time;
    _interval = interval;
    _temperature2m = temperature2m;
    _isDay = isDay;
    _weatherCode = weatherCode;
    _surfacePressure = surfacePressure;
    _windSpeed10m = windSpeed10m;
}

  Current.fromJson(dynamic json) {
    _time = json['time'];
    _interval = json['interval'];
    _temperature2m = json['temperature_2m'];
    _isDay = json['is_day'];
    _weatherCode = json['weather_code'];
    _surfacePressure = json['surface_pressure'];
    _windSpeed10m = json['wind_speed_10m'];
  }
  num? _time;
  num? _interval;
  num? _temperature2m;
  num? _isDay;
  num? _weatherCode;
  num? _surfacePressure;
  num? _windSpeed10m;
Current copyWith({  num? time,
  num? interval,
  num? temperature2m,
  num? isDay,
  num? weatherCode,
  num? surfacePressure,
  num? windSpeed10m,
}) => Current(  time: time ?? _time,
  interval: interval ?? _interval,
  temperature2m: temperature2m ?? _temperature2m,
  isDay: isDay ?? _isDay,
  weatherCode: weatherCode ?? _weatherCode,
  surfacePressure: surfacePressure ?? _surfacePressure,
  windSpeed10m: windSpeed10m ?? _windSpeed10m,
);
  num? get time => _time;
  num? get interval => _interval;
  num? get temperature2m => _temperature2m;
  num? get isDay => _isDay;
  num? get weatherCode => _weatherCode;
  num? get surfacePressure => _surfacePressure;
  num? get windSpeed10m => _windSpeed10m;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['time'] = _time;
    map['interval'] = _interval;
    map['temperature_2m'] = _temperature2m;
    map['is_day'] = _isDay;
    map['weather_code'] = _weatherCode;
    map['surface_pressure'] = _surfacePressure;
    map['wind_speed_10m'] = _windSpeed10m;
    return map;
  }

}



class CurrentUnits {
  CurrentUnits({
      String? time, 
      String? interval, 
      String? temperature2m, 
      String? isDay, 
      String? weatherCode, 
      String? surfacePressure, 
      String? windSpeed10m,}){
    _time = time;
    _interval = interval;
    _temperature2m = temperature2m;
    _isDay = isDay;
    _weatherCode = weatherCode;
    _surfacePressure = surfacePressure;
    _windSpeed10m = windSpeed10m;
}

  CurrentUnits.fromJson(dynamic json) {
    _time = json['time'];
    _interval = json['interval'];
    _temperature2m = json['temperature_2m'];
    _isDay = json['is_day'];
    _weatherCode = json['weather_code'];
    _surfacePressure = json['surface_pressure'];
    _windSpeed10m = json['wind_speed_10m'];
  }
  String? _time;
  String? _interval;
  String? _temperature2m;
  String? _isDay;
  String? _weatherCode;
  String? _surfacePressure;
  String? _windSpeed10m;
CurrentUnits copyWith({  String? time,
  String? interval,
  String? temperature2m,
  String? isDay,
  String? weatherCode,
  String? surfacePressure,
  String? windSpeed10m,
}) => CurrentUnits(  time: time ?? _time,
  interval: interval ?? _interval,
  temperature2m: temperature2m ?? _temperature2m,
  isDay: isDay ?? _isDay,
  weatherCode: weatherCode ?? _weatherCode,
  surfacePressure: surfacePressure ?? _surfacePressure,
  windSpeed10m: windSpeed10m ?? _windSpeed10m,
);
  String? get time => _time;
  String? get interval => _interval;
  String? get temperature2m => _temperature2m;
  String? get isDay => _isDay;
  String? get weatherCode => _weatherCode;
  String? get surfacePressure => _surfacePressure;
  String? get windSpeed10m => _windSpeed10m;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['time'] = _time;
    map['interval'] = _interval;
    map['temperature_2m'] = _temperature2m;
    map['is_day'] = _isDay;
    map['weather_code'] = _weatherCode;
    map['surface_pressure'] = _surfacePressure;
    map['wind_speed_10m'] = _windSpeed10m;
    return map;
  }

}