//
//  ViewController.swift
//  Russia Looses
//
//  Created by Serhii Molodets on 22.08.2023.
//

import UIKit

class LoosesListViewController: UIViewController {
    
    // MARK: - Properties
    var viewModel: LoosesListViewModelProtocol!
    var tableData: [String: Int] {
        viewModel.reduceTotalLoses()
    }
    
    // MARK: - Views
    private let loosesTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        return tableView
    }()

    // MARK: - Lifecycle funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupConstraints()
    }

    // MARK: - Flow funcs
    private func setupUI() {
        view.backgroundColor = .mainGreen
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Russia Looses"
        loosesTableView.delegate = self
        loosesTableView.dataSource = self
        loosesTableView.register(LoosesTableViewCell.self, forCellReuseIdentifier: LoosesTableViewCell.identifier)
    }
    private func setupConstraints() {
        view.addSubview(loosesTableView)
        NSLayoutConstraint.activate([
            loosesTableView.topAnchor.constraint(equalTo: view.topAnchor),
            loosesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loosesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loosesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
               ])
    }
}

// MARK: - Extensions
extension LoosesListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = LoosesTableViewCell()
        let currentKey = Array(tableData.keys.sorted())[indexPath.row]
        cell.configure(title: currentKey, count: tableData[currentKey] ?? 0)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentKey = Array(tableData.keys.sorted())[indexPath.row]
        let currentValue = String(tableData[currentKey] ?? 0)
        viewModel.openDetailController((currentKey, currentValue))
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 181
    }
}
