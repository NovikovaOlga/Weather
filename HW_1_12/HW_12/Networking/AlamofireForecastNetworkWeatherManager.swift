// ПОГОДА НА ПЕРИОД
// менеджер сетевых запросов

import Foundation
import Alamofire

class AlamofireForecastNetworkWeatherManager {
    
    func request(urlString: String, completion: @escaping (Result <ForecastWeatherData, Error>) -> Void) {
    
        AF.request(urlString).responseJSON { response in
            if let data = response.data {
                
                DispatchQueue.main.async {
                    do {
                        let forecastWeathers = try JSONDecoder().decode(ForecastWeatherData.self, from: data)
                        completion(.success(forecastWeathers))
                    } catch let jsonError { 
                        print("Failed to decode JSON", jsonError)
                        completion(.failure(jsonError))
                    }
                }
            }
        }
    }
}
