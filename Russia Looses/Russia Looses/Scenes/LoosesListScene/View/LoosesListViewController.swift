//
//  ViewController.swift
//  Russia Looses
//
//  Created by Serhii Molodets on 22.08.2023.
//

import UIKit

class LoosesListViewController: UIViewController {
    
    @Injected(\.loosesListViewModel) var viewModel
    
    lazy var loosesTableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        print(viewModel.reduceTotalLoses())
    }


}

