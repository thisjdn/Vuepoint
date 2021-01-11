//
//  ViewController.swift
//  Vuepoint
//
//  Created by Jaden Hong  on 2021-01-10.
//
import Foundation
import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var screenView: UIView!
    
    @IBOutlet weak var leading: NSLayoutConstraint!
    @IBOutlet weak var trailing: NSLayoutConstraint!
    
    var menuOut = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = Constants.title
        
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


