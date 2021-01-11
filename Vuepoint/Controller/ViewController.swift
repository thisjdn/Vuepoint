//
//  ViewController.swift
//  Vuepoint
//
//  Created by Jaden Hong  on 2021-01-10.
//
import Foundation
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var leading: NSLayoutConstraint!
    @IBOutlet weak var trailing: NSLayoutConstraint!
    
    var menuOut = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = Constants.title
        
        tableView.register(UINib(nibName: Constants.cell.cellNibName, bundle: nil), forCellReuseIdentifier: Constants.cell.cellIdentifier)
        
    }
    
    func animate() {
        UIView.animate(withDuration: 0.2, delay: 0.0) {
                self.view.layoutIfNeeded()
            }
        }
    
    func menuOpen() {
        leading.constant = 158
        trailing.constant = -158
        menuOut = true
        animate()
    }
    
    func menuClose() {
        leading.constant = 0
        trailing.constant = 0
        menuOut = false
        animate()
    }
    
    
    @IBAction func menuTapped(_ sender: UIBarButtonItem) {
        if menuOut {
            menuClose()
        } else {
            menuOpen()
        }
    }
    
    @IBAction func homeButton(_ sender: UIButton) {
        menuClose()
    }
    
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Constants.photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cell.cellIdentifier, for: indexPath) as! ImageCell
        
        let selectedImage = Constants.photos[indexPath.row]
        
        cell.imageView?.image = UIImage(named: selectedImage)
        
        
//        for photo in Constants.photos {
//            if let photoSelected : UIImage = UIImage(named: photo) {
//                cell.imageView?.image = photoSelected
//            }
//        }
        
//        cell.imageView?.image
        
        return cell
    }
    
    
    
}
