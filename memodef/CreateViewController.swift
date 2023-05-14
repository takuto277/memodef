//
//  CreateViewController.swift
//  memodef
//
//  Created by 小野拓人 on 2023/05/11.
//

import UIKit

class CreateViewController: UIViewController {
    
    @IBOutlet weak var memoryImage: UIImageView!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var placeTextField: UITextField!
    @IBOutlet weak var withPersonTextField: UITextField!
    @IBOutlet weak var titelTextField: UITextField!
    @IBOutlet weak var detailTextView: UITextView!
    
    
    @IBAction func pushCreateMemoryButton(_ sender: Any) {
        // TODO: ボタンを押された時、dbのinsertを呼び出す
        // TODO: UI部品から全て削除
        // TODO: 記載されていない場合はアラートを呼び出すような仕組み
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
}
