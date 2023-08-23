//
//  ViewController.swift
//  Russia Looses
//
//  Created by Serhii Molodets on 22.08.2023.
//

import UIKit

class LoosesListViewController: UIViewController {
    
    @Injected(\.loosesListViewModel) var viewModel
    var tableData: [String: Int] {
        viewModel.reduceTotalLoses()
    }
    
    lazy var loosesTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainGreen
        print(viewModel.reduceTotalLoses())
        setupUI()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupConstraints()
    }

    private func setupUI() {
        navigationController?.navigationBar.tintColor = .mainGreen
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 181
    }
    
    
}
