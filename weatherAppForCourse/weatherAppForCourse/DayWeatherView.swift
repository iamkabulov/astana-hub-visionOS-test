//
//  DayWeatherView.swift
//  weatherAppForCourse
//
//  Created by Nursultan Kabulov on 04.08.2024.
//

import UIKit

final class DayWeatherView: UITableViewCell {

	//MARK: - Properties
	static var identifier: String {
		return String(describing: self)
	}

	static let rowHeight: CGFloat = 144
	private enum Spacing {
		enum Size {
			static let height: CGFloat = 50
			static let width: CGFloat = 50
			static let thickness: CGFloat = 0.5
		}
		static let small: CGFloat = 4
		static let medium: CGFloat = 8
		static let large: CGFloat = 16
	}
	//MARK: - StackViews
	private lazy var vStackView: UIStackView = {
		let stack = UIStackView()
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.axis = .vertical
		stack.backgroundColor = UIColor(red: 97.0/255.0, green: 81.0/255.0, blue: 195.0/255.0, alpha: 1.0)

		stack.layer.cornerRadius = 30
		stack.spacing = .zero
		return stack
	}()

	private lazy var dayLabel: UILabel = {
		let label = UILabel()
		label.text = "Today"
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = .systemBackground
		label.font = UIFont.systemFont(ofSize: 28, weight: .regular)
		return label
	}()

	private lazy var weatherLabel: UILabel = {
		let label = UILabel()
		label.text = "Sunny"
		label.textColor = .systemBackground
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.systemFont(ofSize: 18, weight: .light)
		return label
	}()

	private lazy var tempratureLabel: UILabel = {
		let label = UILabel()
		label.text = "20℃"
		label.textColor = .systemBackground
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.systemFont(ofSize: 18, weight: .light)
		return label
	}()

	lazy var weatherImage: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.clipsToBounds = true
		imageView.contentMode = .scaleAspectFill
		imageView.image = UIImage(named: "Sunny")
		imageView.tintColor = .yellow
		imageView.image = imageView.image?.withRenderingMode(.alwaysTemplate)
		return imageView
	}()

	//MARK: - ViewLifeCycle
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setupLayout()
	}

	override func prepareForReuse() {
		super.prepareForReuse()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

//MARK: - SectionCell
private extension DayWeatherView {
	func setupLayout() {
		vStackView.addSubview(dayLabel)
		vStackView.addSubview(weatherLabel)
		vStackView.addSubview(tempratureLabel)
		vStackView.addSubview(weatherImage)

		contentView.addSubview(vStackView)

		NSLayoutConstraint.activate([
			vStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Spacing.medium),
			vStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Spacing.medium),
			vStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Spacing.medium),
			vStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Spacing.medium),

			dayLabel.centerYAnchor.constraint(equalTo: vStackView.centerYAnchor),
			dayLabel.leadingAnchor.constraint(equalTo: vStackView.leadingAnchor, constant: 25),

			weatherLabel.topAnchor.constraint(equalTo: dayLabel.bottomAnchor, constant: Spacing.medium),
			weatherLabel.leadingAnchor.constraint(equalTo: vStackView.leadingAnchor, constant: 20),

			weatherImage.topAnchor.constraint(equalTo: vStackView.topAnchor, constant: 25),
			weatherImage.trailingAnchor.constraint(equalTo: vStackView.trailingAnchor, constant: -Spacing.large),

			weatherImage.heightAnchor.constraint(equalToConstant: 60),
			weatherImage.widthAnchor.constraint(equalToConstant: 60),

			tempratureLabel.centerYAnchor.constraint(equalTo: weatherLabel.centerYAnchor),
			tempratureLabel.trailingAnchor.constraint(equalTo: vStackView.trailingAnchor, constant: -Spacing.large),
		])
	}
}
