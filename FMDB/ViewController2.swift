//
//  ViewController2.swift
//  FMDB
//
//  Created by Choudhary Dipika on 05/04/23.
//

import UIKit

class ViewController2: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    var arr2 = fmdbHelper.getData()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arr2.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MyTableViewCell
        cell.idLabel.text = arr2[indexPath.row].id.description
        cell.nameLabel.text = arr2[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}
