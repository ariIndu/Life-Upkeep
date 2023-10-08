//
//  SearchViewController.swift
//  HackUTAProject
//
//  Created by Ashwin Indurti on 10/7/23.
//

import UIKit

class SearchTableViewController: UITableViewController {

    
    @IBOutlet var searchBar: UISearchBar!
    var filteredData = [String]()
    var searched = false
    override func viewDidLoad() {
        super.viewDidLoad()
        formatTitle(curr: self)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "SearchCell")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if searched {
            return filteredData.count
        } else {
            return faqs.count
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath)

        // Configure the cell...
        if searched {
            for i in 0...(filteredData.count - 1) {
                if indexPath.row == i {
                    cell.textLabel?.text = filteredData[i]
                    cell.accessoryType = .disclosureIndicator
                }
            }
        } else {
            for i in 0...(faqs.count - 1) {
                if indexPath.row == i {
                    cell.textLabel?.text = faqs[i]
                    cell.accessoryType = .disclosureIndicator
                }
            }
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView,didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if searched {
            for i in 0...(filteredData.count - 1) {
                if indexPath[1] == i {
                    selectedFaq = filteredData[i]
                    print(selectedFaq)
                    let targetViewController = storyboard!.instantiateViewController(withIdentifier: "answer") as! UIViewController
                    self.navigationController?.showDetailViewController(targetViewController, sender: self)
                }
            }
        } else {
            for i in 0...(faqs.count - 1) {
                if indexPath[1] == i {
                    selectedFaq = faqs[i]
                    print(selectedFaq)
                    let targetViewController = storyboard!.instantiateViewController(withIdentifier: "answer") as! UIViewController
                    self.navigationController?.showDetailViewController(targetViewController, sender: self)
                }
            }
        }
//        self.dismiss(animated: true)
//        isSelected = true
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

extension SearchTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != "" {
            print(searchText)
            filteredData = []
//            filteredData = teacherNames.filter({$0.lowercased().uppercased().contains(searchText.uppercased().lowercased())})
            for faq in faqs {
                if faq.lowercased().contains(searchText.lowercased()) {
                    filteredData.append(faq)
                }
            }
            print(filteredData)
            searched = true
        } else {
            print("this field is empty")
            searched = false
        }
        
        tableView.reloadData()
    }
}
