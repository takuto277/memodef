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
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var detailTextView: UITextView!
    
    
    @IBAction func pushCreateMemoryButton(_ sender: Any) {
        let memoryInfoModel = MemoryInfoModel(image: memoryImage.image?.description ?? "",
                                              title: titleTextField.text ?? "",
                                              detail: detailTextView.text,
                                              date: dateTextField.text ?? "",
                                              place: placeTextField.text ?? "",
                                              withPerson: withPersonTextField.text ?? "")
        saveData(check: validationCheck(model: memoryInfoModel), model: memoryInfoModel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func clearUIData() {
        memoryImage.image = nil
        titleTextField.text = ""
        detailTextView.text = ""
        dateTextField.text = ""
        placeTextField.text = ""
        withPersonTextField.text = ""
    }
    
    // TODO: 他ファイルに移動予定
    /// バリデーションチェック
    /// - Parameter model:MemoryInfoModel
    /// - Returns: true: 全て空でない false: 空である
    private func validationCheck(model: MemoryInfoModel) -> Bool {
        return !model.image.description.isEmpty
        && !model.title.isEmpty
        && !model.date.isEmpty
        && !model.place.isEmpty
        && !model.withPerson.isEmpty
    }
    
    private func saveData(check: Bool, model: MemoryInfoModel) {
        if check {
            Database().insert(memoryInfoModel: model)
            self.clearUIData()
        } else {
            // TODO: 記載されていない場合はアラートを呼び出すような仕組み
        }
    }
}
