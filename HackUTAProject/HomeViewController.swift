//
//  ViewController.swift
//  HackUTAProject
//
//  Created by Ashwin Indurti on 10/7/23.
//

import UIKit

let notificationCenter = UNUserNotificationCenter.current()

class HomeViewController: UIViewController {
    
    @IBOutlet var HomeViewController: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        formatTitle(curr: self)
        self.navigationItem.title = "Hello, \(rohita.firstName)"
    }


}

