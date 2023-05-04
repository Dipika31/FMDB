//
//  ViewController.swift
//  FMDB
//
//  Created by Choudhary Dipika on 04/04/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        fmdbHelper.createFile()
    }

    @IBAction func saveDataButton(_ sender: UIButton) {
        if let x = idTextField.text , let y = Int(x)
        {
            fmdbHelper.addData(id: y, name: nameTextField.text!)
        }
    }
    
    @IBAction func deleteButton(_ sender: UIButton) {
        if let x = idTextField.text , let y = Int(x)
        {
            fmdbHelper.deleteData(id: y, name: nameTextField.text!)
        }
    }
    
    @IBAction func getDataButton(_ sender: UIButton) {
        var navigate = storyboard?.instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
        navigationController?.pushViewController(navigate, animated: true)
    }
}

