//
//  ConstantsAndFuncs.swift
//  HackUTAProject
//
//  Created by Ashwin Indurti on 10/7/23.
//

import Foundation
import UIKit

func formatTitle(curr: UIViewController) {
    
    curr.self.navigationController?.navigationBar.prefersLargeTitles = true
    curr.self.navigationItem.largeTitleDisplayMode = .always
    
}

func formatTitle(curr: UITableViewController) {
    
    curr.self.navigationController?.navigationBar.prefersLargeTitles = true
    curr.self.navigationItem.largeTitleDisplayMode = .always
    
}
class AppUser {
    var firstName: String
    var lastName: String
    var age: Int
    var profilePic: UIImage
    var fullName: String = ""
    
    init(firstName: String, lastName: String, age: Int, profilePic: UIImage) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.profilePic = profilePic
        self.fullName = "\(self.firstName) \(self.lastName)"
    }
    
}

var rohita = AppUser(firstName: "Rohita", lastName: "Konjeti", age: 17, profilePic: UIImage(named: "logo_tp")!)

var faqs = ["How often should I get an oil change?", "How long does my car battery last?", "How do i fix a broken car window?", "How do I do a routine inspection of my house?", "How do I pest-proof my house?"]
var answers = [""]
var selectedFaq: String = ""

var reminders = [Reminder]()

struct Reminder {
    var title: String
    var message: String
    var date: Date
}

func formattedDate(date: Date) -> String
    {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM y HH:mm"
        return formatter.string(from: date)
    }
