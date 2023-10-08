//
//  Car1ViewController.swift
//  HackUTAProject
//
//  Created by Ashwin Indurti on 10/8/23.
//

import UIKit

class HouseReminderAddViewController: UIViewController {

   // @IBOutlet var reminderTF: UITextView!
 //   @IBOutlet var datePicker: UIDatePicker!
  //  @IBOutlet var popUpButton: UIButton!
    
    @IBOutlet var reminderTF: UITextView!
    @IBOutlet var popUpButton: UIButton!
    @IBOutlet var datePicker: UIDatePicker!
    
    let notificationCenter = UNUserNotificationCenter.current()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

            //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
            //tap.cancelsTouchesInView = false

        view.addGestureRecognizer(tap)
        setupPopUpButton()
        // Do any additional setup after loading the view.
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    

    func setupPopUpButton() {
        let popUpButtonClosure = { (action: UIAction) in
            print("Pop-up action")
        }
                
        popUpButton.menu = UIMenu(children: [
            UIAction(title: "Don't Repeat", handler: popUpButtonClosure),
            UIAction(title: "Repeat Weekly", handler: popUpButtonClosure),
            UIAction(title: "Repeat Monthly", handler: popUpButtonClosure),
            UIAction(title: "Repeat Yearly", handler: popUpButtonClosure)
        ])
        popUpButton.showsMenuAsPrimaryAction = true
    }
    
    @IBAction func remindAction(_ sender: Any) {
        sendNotification(title: "Reminder for House 1", message: reminderTF.text, date: datePicker.date)
        
    }
    
    func sendNotification(title: String, message: String, date: Date) {
        let newReminder = Reminder(title: "House 1", message: message, date: date)
        reminders.append(newReminder)
        notificationCenter.getNotificationSettings { (settings) in
                    
                    DispatchQueue.main.async
                    {
                        
                        if(settings.authorizationStatus == .authorized)
                        {
                            let content = UNMutableNotificationContent()
                            content.title = title
                            content.body = message
                            
                            let dateComp = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: date)
                            
                            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComp, repeats: false)
                            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                            
                            self.notificationCenter.add(request) { (error) in
                                if(error != nil)
                                {
                                    print("Error " + error.debugDescription)
                                    return
                                }
                            }
                            let ac = UIAlertController(title: "Reminder Scheduled", message: "At " + self.formattedDate(date: date), preferredStyle: .alert)
                            ac.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in}))
                            self.present(ac, animated: true)
                        }
                        else
                        {
                            let ac = UIAlertController(title: "Enable Notifications?", message: "To use this feature you must enable notifications in settings", preferredStyle: .alert)
                            let goToSettings = UIAlertAction(title: "Settings", style: .default)
                            { (_) in
                                guard let setttingsURL = URL(string: UIApplication.openSettingsURLString)
                                else
                                {
                                    return
                                }
                                
                                if(UIApplication.shared.canOpenURL(setttingsURL))
                                {
                                    UIApplication.shared.open(setttingsURL) { (_) in}
                                }
                            }
                            ac.addAction(goToSettings)
                            ac.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (_) in}))
                            self.present(ac, animated: true)
                        }
                    }
                }
    }
    
    func formattedDate(date: Date) -> String
        {
            let formatter = DateFormatter()
            formatter.dateFormat = "d MMM y HH:mm"
            return formatter.string(from: date)
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
