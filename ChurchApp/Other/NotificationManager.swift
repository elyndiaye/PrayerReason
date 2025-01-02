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
    
    func sheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Motivo de Oração"
        content.subtitle = "Teste teste"
        content.sound = .default
        content.badge = 1
        
        //using time
        //comentar
       // let triger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        //calendar
        var dateComponents = DateComponents()
        dateComponents.hour = 03
        dateComponents.minute = 22
        //remover o comentario
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        //location
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
        
    }
}
