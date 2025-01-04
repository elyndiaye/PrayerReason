//
//  NotificationManager.swift
//  ChurchApp
//
//  Created by Ely Assumpcao Ndiaye on 29/12/24.
//

import Foundation
import UserNotifications

class NotificationManager {
    static let instance = NotificationManager() //Singleton
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (succes, error ) in
            if let error = error {
                print ("ERROR: \(error)")
            } else {
                print("SUCCESS")
            }
        }
    }
    
    func sheduleNotification(prayReason: String, dueDate: Date) {
        let content = UNMutableNotificationContent()
        content.title = "Motivo de Oração"
        content.subtitle = prayReason
        content.sound = .default
        content.badge = 1
        

        
        //calendar
        let calendar = Calendar.current
        guard let notificationDate = calendar.date(byAdding: .minute, value: 10, to: dueDate) else {
                    print("Erro ao adicionar minutos à data")
                    return
                }
        let dateComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: notificationDate)
    
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
    }
}
