
import Foundation

// здесь работаем с сетью (вынесла из ViewController)

class ForecastNetworkWeatherManager {
    
    func request(urlString: String, completion: @escaping (Result <ForecastWeatherData, Error>) -> Void) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async { 
                if let error = error {
                    print("Some error")
                    completion(.failure(error))
                    return
                }
                guard let data = data else { return }
                do {
                    let forecastWeathers = try JSONDecoder().decode(ForecastWeatherData.self, from: data)
                    completion(.success(forecastWeathers))
                } catch let jsonError { 
                    print("Failed to decode JSON", jsonError)
                    completion(.failure(jsonError))
                }
            }
        }.resume()
    }
}
