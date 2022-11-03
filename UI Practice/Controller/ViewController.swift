//
//  ViewController.swift
//  UI Practice
//
//  Created by 陳韋綸 on 2022/11/3.
//

import UIKit

class ViewController: UIViewController {

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        return tableView
    }()
    
    private var data: ApiData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupData()
    }

    private func setupLayout() {
        view.addSubview(tableView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    private func setupData() {
        APIModels.shared.api { [weak self] data in
            self?.data = data
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                self?.navigationItem.title = "totalCount: " + "\(data.data.totalCount)"
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.data.items.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        guard let model = data?.data.items[indexPath.row] else {
            return UITableViewCell()
        }
        cell.configure(model: model)
        return cell
    }
}
