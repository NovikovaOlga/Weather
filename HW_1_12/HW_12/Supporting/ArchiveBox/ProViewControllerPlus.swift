

// Контроллер, который нигде не используется. Я начала делать второй вариант поиска города - через строку поиска, с таймером полсекунды после каждого символа.
// Пусть пока побудет здесь.
//
//import UIKit
//
//class ProViewControllerPluc: UIViewController {
//    
//    var networkWeatherManager = NetworkWeatherManager()
//    let forecastNetworkWeatherManager = ForecastNetworkWeatherManager()
//    
//    var forecastWeatherData: ForecastWeatherData? = nil // модель данных для таблицы (поиск 2)
//    
//    //   let searchController = UISearchController(searchResultsController: nil)
//    
// //   private var timer: Timer? // таймер нужен для задержки обновления парсинга данных (например, при наборе слова "Голопогосские" - парсинг не происходил бы после каждой буквы, а только когда пользователь прекратит вводить данные
//    
//    @IBOutlet weak var weatherIconImageViewPro: UIImageView!
//    @IBOutlet weak var cityLabelPro: UILabel!
//    @IBOutlet weak var temperatureLabelPro: UILabel!
//    @IBOutlet weak var feelsLikeTemperatureLabelPro: UILabel!
//    
//    @IBAction func searchButton(_ sender: Any) {  // поиск кнопкой
//        searchButton(withTitle: "Enter city name", message: nil, style: .alert) { [unowned self] city in  // [unowned self]  - гарантируем, что self существует на момент завершения работы нашего клоужера
//            self.networkWeatherManager.fetchCurrentWeather(forCity: city)
//        }
//    }
//    
//    @IBOutlet weak var table: UITableView!
//    
//    @IBOutlet weak var dateTitlePro: UILabel! // чтобы скрыть и отобразить после загрузки данных (для красоты)
//    @IBOutlet weak var tempTitlePro: UILabel!
//    @IBOutlet weak var feelsTitlePro: UILabel!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        setupTableView()
//       // setupSearchBar()
//        
//        networkWeatherManager.onCompletion = { [weak self] currentWeather in // текущая погода
//            guard let self = self else { return }  // [weak self] - точно знаем, что нет цикла сильных сылок - если проложение разрастется и будет много экранов
//            self.updateInterfaceWith(weather: currentWeather) // обновим интерфейс
//        }
//      //  networkWeatherManager.fetchCurrentWeather(forCity: "Moscow")  // вызовем функция сетеового запроса из менеджера для указанного города (current weather)
//    }
//    
//    func updateInterfaceWith(weather: CurrentWeather) { // поиск 1 (обновим интерфейс для продолжения работы)
//        DispatchQueue.main.async {
//            self.cityLabelPro.text = weather.cityName
//            self.temperatureLabelPro.text = ("\(weather.temperatureString) °C")
//            self.feelsLikeTemperatureLabelPro.text = ("feels like \(weather.feelsLikeTemperatureString) °C")
//            self.weatherIconImageViewPro.image = UIImage(systemName: weather.systemIconNameString)  // к иконкам
//        }
//    }
//    
//    private func setupTableView() {
//        table.isHidden = true // сделаем таблицу невидимой до загрузки данных (некрасиво моргает белым цветом)
//      //  table.delegate = self // нужен для язагрузки хидера
//        table.dataSource = self
//    }
//    //
//    //    private func setupView() { // скроем блок с текущими данными погоды до загрузки данных, потом отобразим (иконки моргают некрасиво)
//    //        weatherIconImageViewPro.isHidden = true
//    //        cityLabelPro.isHidden = true
//    //        temperatureLabelPro.isHidden = true
//    //        feelsLikeTemperatureLabelPro.isHidden = true
//    //        dateTitlePro.isHidden = true
//    //        tempTitlePro.isHidden = true
//    //        feelsTitlePro.isHidden = true
//    //    }
//
////    private func setupSearchBar() {
////        navigationItem.searchController = searchController
////        searchController.searchBar.delegate = self // здесь будем реализовывать extension ViewController: UISearchBarDelegate
////
////          navigationController?.navigationBar.prefersLargeTitles = true // обновление таблицы при вводе данных
////          searchController.obscuresBackgroundDuringPresentation = false // затемняет фон во время презентации
////    }
//}
//
//
////extension ProViewController: UISearchBarDelegate { // поиск 2
////    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
////        // код далее, используемый во viewDidLoad, передает данные в таблицу
////        // а используемый здесь - срабатывает при поиске
////
////        let urlString = "https://api.openweathermap.org/data/2.5/forecast?q=\(city)&appid=\(apiKey)&units=metric" // строка с адресом (тип - String). ВАЖНО: &units=metric - с сайта openWeather, чтобы градусы были в цельсиях, а не в кельвинах
////
////        timer?.invalidate() // перед вызовом таймера
////        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in // таймер полсекунды после каждого символа
////
////            self.forecastNetworkWeatherManager.request(urlString: urlString) { [weak self] (result) in // так как вынесли логику работы с сетью в отдельный файл, то обращаемся через константу networkService. [weak self] - предотвратим утечку памяти
////                switch result{
////                // блок получения данных
////                case .success(let forecastWeatherData): // возвращаем в случае успеха
////
////                    self?.forecastWeatherData = forecastWeatherData // передали данные
////                    self?.table.reloadData() // обновим таблицу
////                case .failure(let error):
////                    print("error:", error)
////                }
////            }
////        })
////    }
////}
//
//extension ProViewController { //поиск 1 - кнопкой
//    func searchButton(withTitle title: String?, message: String?, style: UIAlertController.Style, completionHandler: @escaping (String) -> Void) { // клоужер для передачи города completionHandler, где String - название города
//        let ac = UIAlertController(title: title, message: message, preferredStyle: style)
//        ac.addTextField { _ in // tf in
//          //  let cities = "Moscow" //["Himki", "Moscow", "Male", "Ivanovo", "Berlin"]
//           // tf.placeholder = cities.randomElement()
//        }
//        let search = UIAlertAction(title: "Search", style: .default) { action in
//            let textField = ac.textFields?.first
//            guard let cityName = textField?.text else { return }
//            if cityName != "" {
//                                self.networkWeatherManager.fetchCurrentWeather(forCity: cityName)
//              //  let city = cityName.split(separator: " ").joined(separator: "%20") // если город это несколько элементов через пробел, то соеденим его (Нью Йорк)
//              //  completionHandler(city) // передаем город из клоужера
//            }
//            let urlString = "https://api.openweathermap.org/data/2.5/forecast?q=\(cityName)&appid=\(apiKey)&units=metric" // строка с адресом (тип - String). ВАЖНО: &units=metric - с сайта openWeather, чтобы градусы были в цельсиях, а не в кельвинах
//            
//            self.forecastNetworkWeatherManager.request(urlString: urlString) { [weak self] (list) in
//                switch list {
//                case .success(let forecastWeatherData):
//                    self?.forecastWeatherData = forecastWeatherData // передали данные
//                    self?.table.reloadData()
//                case .failure(let error):
//                    print("error:", error)
//                }
//            }
//        }
//        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//        
//        ac.addAction(search)
//        ac.addAction(cancel)
//        present(ac, animated: true, completion: nil)
//    }
//}
//
//
//extension ProViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return forecastWeatherData?.list.count ?? 0
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = table.dequeueReusableCell(withIdentifier: "cellTablePro", for: indexPath) as! ProForecastTableViewCell
//        let weather = forecastWeatherData?.list[indexPath.row]// получим показатель по indexPath
//
//        // температура и ощущается как в формате Double - округлим и преобразуем в String
//        let temp = weather?.main.temp
//        var tempString: String {
//            return String(format: "%.0f", temp!) //  не уверена в правильности принудительного извлечения
//        }
//
//        let feelsLike = weather?.main.feelsLike
//        var feelsLikeString: String {
//            return String(format: "%.0f", feelsLike!)
//        }
//
//        cell.dateTimeLabelPro.text = weather?.dtTxt
//        cell.tempLabelPro.text = tempString
//        cell.feelsLikeLabelPro.text = ("\(feelsLikeString) °C")
//
//        table.isHidden = false // сделаем таблицу видимой (если вернуть видимость в updateInterfaceWith - она моргает белым )
//    
//        return cell
//    }
//}
