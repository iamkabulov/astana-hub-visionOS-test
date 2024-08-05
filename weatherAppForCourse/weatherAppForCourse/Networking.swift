//
//  Networking.swift
//  weatherAppForCourse
//
//  Created by Nursultan Kabulov on 04.08.2024.
//

import Foundation

struct Networking {

	let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=0081e8268c9620829d17e20f7993a043&units=metric"

	func fetchWeather(lat: String = "51.169392", long: String = "71.449074", completionHandler: @escaping (WeatherModel) -> Void) {
		let urlString = "\(weatherURL)&lat=\(lat)&lon=\(long)"
		if let url = URL(string: urlString) {

			let session = URLSession(configuration: .default)
			let task = session.dataTask(with: url) { data, response, error in
				if error != nil {
					return
				}

				if let safeData = data {
					let str = String(data: safeData, encoding: .utf8)
					print(str ?? "")
					DispatchQueue.main.async {
						let decoder = JSONDecoder()
						do {
							let decodedData = try decoder.decode(WeatherData.self, from: safeData)
							let id = decodedData.weather[0].id
							let temp = decodedData.main.temp
							let city = decodedData.name

							let weatherModel = WeatherModel(id: id, cityName: city, temp: temp)
							completionHandler(weatherModel)
						} catch {
							return
						}
					}
				}

			}
			task.resume()
		}
	}

	func fetchWeatherFor7Days(lat: String = "51.169392", long: String = "71.449074", completionHandler: @escaping (Weather7s) -> Void) {
		let urlString = "https://api.openweathermap.org/data/2.5/forecast?appid=0081e8268c9620829d17e20f7993a043&lat=\(lat)&lon=\(long)"
		if let url = URL(string: urlString) {

			let session = URLSession(configuration: .default)
			let task = session.dataTask(with: url) { data, response, error in
				if error != nil {
					return
				}

				if let safeData = data {
					let str = String(data: safeData, encoding: .utf8)
					print(str ?? "")
					DispatchQueue.main.async {
						let decoder = JSONDecoder()
						do {
							let decodedData = try decoder.decode(Weather7s.self, from: safeData)
							completionHandler(decodedData)
						} catch {
							return
						}
					}
				}

			}
			task.resume()
		}
	}
}
