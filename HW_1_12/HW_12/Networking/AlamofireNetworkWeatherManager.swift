// ТЕКУЩАЯ ПОГОДА
// менеджер сетевых запросов 

import Foundation
import Alamofire

class AlamofireNetworkWeatherManager {
    
    var onCompletion: ((CurrentWeather) -> Void)?
    func fetchCurrentWeather(forCity city: String) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&apikey=\(apiKey)&units=metric"
        
        AF.request(urlString).responseJSON { response in
            if let data = response.data {
        
                if let currentWeather = self.parseJSON(withData: data) {
                    self.onCompletion?(currentWeather)
                }
            }
        }
    }
    
    func parseJSON(withData data: Data) -> CurrentWeather? {
        let decoder = JSONDecoder()
        do {
            let currentWeatherData = try decoder.decode(CurrentWeatherData.self, from: data)
            guard let currentWeather = CurrentWeather(currentWeatherData: currentWeatherData) else {
                return nil
            }
            return currentWeather 
        } catch let error as NSError { //
            print(error.localizedDescription)
        }
        return nil
    }
}
