//
//  HomeViewController.swift
//  memodef
//
//  Created by 小野拓人 on 2023/05/07.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UINib(nibName: String(describing: HomeTableViewCell.self), bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        cell.homeImageView.image = UIImage(named: "sampleImage")
        cell.titleLabel.text = "これはタイトル"
        cell.detailLabel.text = "この写真はサンプルです"
        cell.whenLabel.text = "2023/5/7"
        cell.whereLabel.text = "箱根"
        cell.whoLabel.text = "1人"
        
        return cell
    }
}
