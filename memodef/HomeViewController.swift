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
        cell.ImageView.image = UIImage(named: "sampleImage")
        cell.TitleLabel.text = "これはタイトル"
        cell.DetailLabel.text = "この写真はサンプルです"
        cell.WhenLabel.text = "2023/5/7"
        cell.WhereLabel.text = "箱根"
        cell.WhoLabel.text = "1人"
        
        return cell
    }
}
