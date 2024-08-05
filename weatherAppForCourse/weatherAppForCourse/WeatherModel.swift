//
//  WeatherModel.swift
//  weatherAppForCourse
//
//  Created by Nursultan Kabulov on 05.08.2024.
//

import Foundation

// MARK: - Welcome
struct Weathers: Decodable {
	let city: City
	let cod: String
	let message: Double
	let cnt: Int
	let list: [ListRes]
}

struct WeatherData: Decodable {
	let name: String
	let main: Main
	let weather: [Weather]
}

struct Main: Decodable {
	let temp: Double
}

struct Weather: Codable {
	let id: Int
	let description: String
}

struct WeatherModel {
	let id: Int
	let cityName: String
	let temp: Double

	var tempString: String {
		return String(format: "%.f", temp)
	}

	var conditionName: String {
		switch id {
			case 200...232:
				return "cloud.bolt"
			case 300...321:
				return "cloud.drizzle"
			case 500...531:
				return "cloud.rain"
			case 600...622:
				return "cloud.snow"
			case 701...781:
				return "cloud.fog"
			case 800:
				return "sun.max"
			case 801...804:
				return "icloud"
			default:
				return "cloud.rainbow.half"
		}
	}
}


// MARK: - City
struct City: Codable {
	let id: Int
	let name: String
	let coord: Coord
	let country: String
	let population, timezone: Int
}

// MARK: - Coord
struct Coord: Codable {
	let lon, lat: Double
}

// MARK: - List
struct ListRes: Decodable {
	let dt, sunrise, sunset: Int
	let temp: Temp
	let feelsLike: FeelsLike
	let pressure, humidity: Int
	let weather: [Weather]
	let speed: Double
	let deg: Int
	let gust: Double
	let clouds: Int
	let pop: Double
	let rain: Double?

	enum CodingKeys: String, CodingKey {
		case dt, sunrise, sunset, temp
		case feelsLike = "feels_like"
		case pressure, humidity, weather, speed, deg, gust, clouds, pop, rain
	}
}

// MARK: - FeelsLike
struct FeelsLike: Codable {
	let day, night, eve, morn: Double
}

// MARK: - Temp
struct Temp: Codable {
	let day, min, max, night: Double
	let eve, morn: Double
}


import Foundation

// MARK: - Welcome
struct Weather7s: Codable {
	let cod: String
	let message, cnt: Int
	let list: [List7]
	let city: City7
}

// MARK: - City
struct City7: Codable {
	let id: Int
	let name: String
	let coord: Coord
	let country: String
	let population, timezone, sunrise, sunset: Int
}

// MARK: - Coord
struct Coord7: Codable {
	let lat, lon: Double
}

// MARK: - List
struct List7: Codable {
	let dt: Int
	let main: Main7
	let weather: [Weather7]
	let clouds: Clouds7
	let wind: Wind7
	let visibility: Int
	let pop: Double
	let rain: Rain7?
	let sys: Sys7
	let dtTxt: String

	enum CodingKeys: String, CodingKey {
		case dt, main, weather, clouds, wind, visibility, pop, rain, sys
		case dtTxt = "dt_txt"
	}
}

// MARK: - Clouds
struct Clouds7: Codable {
	let all: Int
}

// MARK: - Main
struct Main7: Codable {
	let temp, feelsLike, tempMin, tempMax: Double
	let pressure, seaLevel, grndLevel, humidity: Int
	let tempKf: Double

	enum CodingKeys: String, CodingKey {
		case temp
		case feelsLike = "feels_like"
		case tempMin = "temp_min"
		case tempMax = "temp_max"
		case pressure
		case seaLevel = "sea_level"
		case grndLevel = "grnd_level"
		case humidity
		case tempKf = "temp_kf"
	}
}

// MARK: - Rain
struct Rain7: Codable {
	let the3H: Double

	enum CodingKeys: String, CodingKey {
		case the3H = "3h"
	}
}

// MARK: - Sys
struct Sys7: Codable {
	let pod: String
}

// MARK: - Weather
struct Weather7: Codable {
	let id: Int
	let main, description, icon: String
}

// MARK: - Wind
struct Wind7: Codable {
	let speed: Double
	let deg: Int
	let gust: Double
}
