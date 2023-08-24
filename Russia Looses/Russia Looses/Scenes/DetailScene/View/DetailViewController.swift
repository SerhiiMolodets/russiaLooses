//
//  DetailViewController.swift
//  Russia Looses
//
//  Created by Serhii Molodets on 24.08.2023.
//

import UIKit

class DetailViewController: UIViewController {
    
// MARK: - Properties
    var viewModel: DetailViewModelProtocol!
    var historyList: [DetailModel] {
        viewModel.getHistoryList()
    }
    
    // MARK: - Views
    private let containerView: UIView = {
        let container = UIView()
        container.clipsToBounds = true
        container.translatesAutoresizingMaskIntoConstraints = false
        container.contentMode = .scaleAspectFill
        container.backgroundColor = .white
        container.layer.cornerRadius = 20
        return container
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 26)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    private let countLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 48, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    private let detailTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    // MARK: - Lifecycle funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainGreen
        guard let currentLooses = viewModel.currentLooses else { return }
        configure(title: currentLooses.0, count: currentLooses.1)
        print(historyList)
        setupUI()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupConstraints()
    }
    
    // MARK: - Flow funcs
    func configure(title: String, count: String) {
        self.titleLabel.text = title
        self.countLabel.text = count
    }
    
    private func setupUI() {
        view.backgroundColor = .mainGreen
        detailTableView.delegate = self
        detailTableView.dataSource = self
        detailTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
    
    private func setupConstraints() {
        view.addSubview(containerView)
        view.addSubview(detailTableView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(countLabel)
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -15),
            containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            containerView.heightAnchor.constraint(equalToConstant: 181),
            
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 22),
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 30),
            
            countLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            countLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 28),
            countLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -31),
            
            detailTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            detailTableView.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 4),
            detailTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - Extensions
extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        historyList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        var content = UIListContentConfiguration.valueCell()
        content.text = historyList[indexPath.row].date
        content.secondaryText = historyList[indexPath.row].count
        cell.backgroundColor = .mainGreen
        cell.contentConfiguration = content
        return cell
    }
}
