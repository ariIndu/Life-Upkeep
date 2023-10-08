//
//  ProfileTableViewController.swift
//  HackUTAProject
//
//  Created by Ashwin Indurti on 10/7/23.
//

import UIKit

class ProfileTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        formatTitle(curr: self)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ProfileCell")

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell", for: indexPath)

        let image = cell.viewWithTag(102) as! UIImageView
        let name = cell.viewWithTag(100) as! UILabel
        let subtitle = cell.viewWithTag(101) as! UILabel
        
        switch (indexPath.row)
        {
        case 0:
            name.font = UIFont.systemFont(ofSize: 28, weight: .bold)
            name.text = rohita.fullName
            image.image = rohita.profilePic
            subtitle.text = "Account Settings"
            cell.accessoryType = .disclosureIndicator
            
            break
        case 1:
            name.font = UIFont.systemFont(ofSize: 16)
            name.text = "Help"
            subtitle.text = ""
            cell.accessoryType = .disclosureIndicator
            break
        case 2:
            name.font = UIFont.systemFont(ofSize: 16)
            name.text = "Family"
            subtitle.text = ""
            cell.accessoryType = .disclosureIndicator
            break
        case 3:
            name.font = UIFont.systemFont(ofSize: 16)
            name.text = "Insurance"
            subtitle.text = ""
            cell.accessoryType = .disclosureIndicator
            break
        case 4:
            name.font = UIFont.systemFont(ofSize: 16)
            name.text = "Log Out"
            subtitle.text = ""
            cell.accessoryType = .disclosureIndicator
            
            break
        default:
            break
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView,didSelectRowAt indexPath: IndexPath) {
        

        tableView.deselectRow(at: indexPath, animated: true)
        
        switch (indexPath[1]) {
            
        case 0:
            let targetViewController = storyboard!.instantiateViewController(withIdentifier: "acctSettings") as! AccountViewController
            self.navigationController?.showDetailViewController(targetViewController, sender: self)
            break
        case 1:
            
            break
        default:
            break
            
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

