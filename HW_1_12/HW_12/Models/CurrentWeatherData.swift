// ТЕКУЩАЯ ПОГОДА
// модель, чтобы распарсить данные
// https://app.quicktype.io

import Foundation

struct CurrentWeatherData: Codable {
    let name: String // город
    let main: Main // температура
    let weather: [Weather]
}

struct Main: Codable { // температура
    let temp: Double // температура
    let feelsLike: Double // ощущается
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
    }
}

struct Weather: Codable { 
    let id: Int
}
