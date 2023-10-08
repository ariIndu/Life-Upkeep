//
//  AccountViewController.swift
//  HackUTAProject
//
//  Created by Ashwin Indurti on 10/8/23.
//

import UIKit

class AccountViewController: UIViewController {

    
    @IBOutlet var pfp: UIImageView!
    @IBOutlet var nameLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pfp.image = rohita.profilePic
        nameLbl.text = rohita.fullName
        nameLbl.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
}
