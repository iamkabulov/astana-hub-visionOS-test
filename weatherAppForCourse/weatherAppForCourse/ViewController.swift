//
//  ViewController.swift
//  weatherAppForCourse
//
//  Created by Nursultan Kabulov on 02.08.2024.
//

import UIKit

class WeatherViewController: UIViewController {

	lazy var tableView: UITableView = {
		let view = UITableView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.separatorStyle = .none
		view.register(DayWeatherView.self, forCellReuseIdentifier: DayWeatherView.identifier)
		view.delegate = self
		view.rowHeight = DayWeatherView.rowHeight
		view.dataSource = self
		return view
	}()
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .systemBackground
		title = "Astana"
		navigationController?.navigationBar.prefersLargeTitles = true
		setUp()
		// Do any additional setup after loading the view.
	}

	func setUp() {
		view.addSubview(tableView)
		NSLayoutConstraint.activate([
			tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
			tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
		])
	}
}

extension WeatherViewController: UITableViewDelegate, UITableViewDataSource {
	func numberOfSections(in tableView: UITableView) -> Int {
		return 2 // Example number of sections
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if section == 0 {
			return 1
		} else {
			return 6
		}
	}

	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		if section == 0 {
			return nil
		} else {
			let headerView = UIView()
			headerView.backgroundColor = .systemBackground
			
			let headerLabel = UILabel(frame: CGRect(x: 16, y: 5, width: tableView.bounds.size.width - 32, height: 25))
			headerLabel.text = "Forecast for 7 days"
			headerLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)

			headerView.addSubview(headerLabel)
			
			return headerView
		}
	}

	// Implement the method to specify the height of the header
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		if section == 0 {
			return 0
		} else {
			return 35
		}
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: DayWeatherView.identifier, for: indexPath) as? DayWeatherView else { return UITableViewCell() }

		return cell
	}
	

}

