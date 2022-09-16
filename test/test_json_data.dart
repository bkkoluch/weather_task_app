final Map<String, dynamic> tWeatherForecastJSON = {
  'location': {
    'name': '',
    'region': '',
    'country': '',
    'localtime': '',
  },
  'current': tWeatherJSON,
  'forecast': {
    'forecastday': [
      {
        'hour': [tWeatherJSON, tWeatherJSON]
      }
    ]
  }
};

final Map<String, dynamic> tWeatherJSON = {
  'time': '123',
  'temp_c': 12.2,
  'condition': {
    'text': 'cloudy',
    'icon': 'icon',
  },
  'wind_kph': 12.3,
  'cloud': 20
};
