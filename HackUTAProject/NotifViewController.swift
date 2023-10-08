//
//  NotifViewController.swift
//  HackUTAProject
//
//  Created by Ashwin Indurti on 10/7/23.
//

import UIKit
import UserNotifications

class NotifViewController: UIViewController {
    
    @IBOutlet var messageTF: UITextField!
    @IBOutlet var titleTF: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    
    let notificationCenter = UNUserNotificationCenter.current()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formatTitle(curr: self)
        notificationCenter.requestAuthorization(options: [.alert, .sound]) {
                    (permissionGranted, error) in
                    if(!permissionGranted)
                    {
                        print("Permission Denied")
                    }
                }
        // Do any additional setup after loading the view.
    }

    @IBAction func scheduleAction(_ sender: Any) {
        sendNotification(title: "Ashwin", message: "Wants you to KYS!!", date: datePicker.date)
        print("HSDHFSDKHJBGKASJBFHG -- \(type(of: notificationCenter)) -- JKASHDFAL")
    }
    
    func sendNotification(title: String, message: String, date: Date) {
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
                            let ac = UIAlertController(title: "Notification Scheduled", message: "At " + self.formattedDate(date: date), preferredStyle: .alert)
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
