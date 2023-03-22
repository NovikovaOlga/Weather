// ТЕКУЩАЯ ПОГОДА

import UIKit

// передаем данные во View Controller
struct CurrentWeather {
    let cityName: String
    
    let temperature: Double
    var temperatureString: String {
        return String(format: "%.0f", temperature) // округлим значение целиком %.0f, если %.1f - то один знак после запятой
    }

    struct Icon {
        let icon: UIImage?
    }
    
    let feelsLikeTemperature: Double
    var feelsLikeTemperatureString: String {
        return String(format: "%.1f", feelsLikeTemperature)
    }
    
    let conditionCode: Int
 
    var systemIconNameString: String {
        switch conditionCode { // коды для иконок с сайта https://openweathermap.org/weather-conditions
        
        case 200...232: return "cloud.bolt.rain.fill" // подберем картинку в стоиборде во вью Image (гроза)
        case 300...321: return "cloud.drizzle.fill" // мелкий дождь
        case 500...531: return "cloud.rain.fill" // дождь
        case 600...622: return "cloud.snow.fill" // снег
        case 701...781: return "smoke.fill" // туман
        case 800: return "sun.min.fill" //солнце
        case 801...804: return "cloud.fill" // облачность
        default: return "nosing" // иконка для дефолтного значения

        }
    }
    
    init?(currentWeatherData: CurrentWeatherData) {
        cityName = currentWeatherData.name
        temperature = currentWeatherData.main.temp
        feelsLikeTemperature = currentWeatherData.main.feelsLike
        conditionCode = currentWeatherData.weather.first!.id 
    }
}
