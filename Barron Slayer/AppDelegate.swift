
//  AppDelegate.swift
//  Barron Slayer
//  Created by Clyde S. Henry on 2016/8/1.
//  Copyright © 2016 Specos Studios. All rights reserved.

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    internal func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
//        let controller: FindWordsScreenViewController = self.window?.rootViewController as! FindWordsScreenViewController
//        UIView.animate(withDuration: 0.3, animations:
//            {
//                controller.keyboardBackgroundView.backgroundColor = controller.blueLevel2
//                for index in 0...25 {
//                    controller.keyboardButtonArray[index].backgroundColor = controller.blueLevel2
//                }
//        })
//        UIView.animate(withDuration: 0.8, animations:
//            {
//                controller.backbackgroundRoundView.bounds.size.height += 200
//                controller.backbackgroundRoundView.bounds.size.width += 200
//                controller.backbackgroundRoundView.frame.origin.x -= 20
//                controller.backbackgroundRoundView.frame.origin.y -= 20
//        })
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
//        let controller: FindWordsScreenViewController = self.window?.rootViewController as! FindWordsScreenViewController
//        UIView.animate(withDuration: 0.8, animations:
//            {
//                controller.backbackgroundRoundView.bounds = controller.view.bounds
//                controller.backbackgroundRoundView.frame.origin.x = 0
//                controller.backbackgroundRoundView.frame.origin.y = 0
//        })
//        UIView.animate(withDuration: 0.3, delay: 0.5, options: [], animations:
//            {
//                for index in 0...25 {
//                    controller.keyboardButtonArray[index].backgroundColor = controller.blueLevel1
//                    controller.keyboardBackgroundView.backgroundColor = controller.blueLevel1
//                }
//        }, completion: nil)
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
//        let controller: FindWordsScreenViewController = self.window?.rootViewController as! FindWordsScreenViewController
//        UIView.animate(withDuration: 0.8, animations:
//            {
//                controller.backbackgroundRoundView.bounds = controller.view.bounds
//                controller.backbackgroundRoundView.frame.origin.x = 0
//                controller.backbackgroundRoundView.frame.origin.y = 0
//        })
//        UIView.animate(withDuration: 0.3, delay: 0.5, options: [], animations:
//            {
//                for index in 0...25 {
//                    controller.keyboardButtonArray[index].backgroundColor = controller.blueLevel1
//                    controller.keyboardBackgroundView.backgroundColor = controller.blueLevel1
//                }
//        }, completion: nil)
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }
    
    // MARK: - Core Data stack
    
    lazy var applicationDocumentsDirectory: URL = {
        // The directory the application uses to store the Core Data store file. This code uses a directory named "com.Specos.Barron_Slayer" in the application's documents Application Support directory.
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return urls[urls.count-1]
    }()
    
    lazy var managedObjectModel: NSManagedObjectModel = {
        // The managed object model for the application. This property is not optional. It is a fatal error for the application not to be able to find and load its model.
        let modelURL = Bundle.main.url(forResource: "Barron_Slayer", withExtension: "momd")!
        return NSManagedObjectModel(contentsOf: modelURL)!
    }()
    
    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it. This property is optional since there are legitimate error conditions that could cause the creation of the store to fail.
        // Create the coordinator and store
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let url = self.applicationDocumentsDirectory.appendingPathComponent("SingleViewCoreData.sqlite")
        var failureReason = "There was an error creating or loading the application's saved data."
        do {
            try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url, options: nil)
        } catch {
            // Report any error we got.
            var dict = [String: AnyObject]()
            dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data" as AnyObject?
            dict[NSLocalizedFailureReasonErrorKey] = failureReason as AnyObject?
            
            dict[NSUnderlyingErrorKey] = error as NSError
            let wrappedError = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
            // Replace this with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog("Unresolved error \(wrappedError), \(wrappedError.userInfo)")
            abort()
        }
        
        return coordinator
    }()
    
    lazy var managedObjectContext: NSManagedObjectContext = {
        // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.) This property is optional since there are legitimate error conditions that could cause the creation of the context to fail.
        let coordinator = self.persistentStoreCoordinator
        var managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
                abort()
            }
        }
    }
    
}
