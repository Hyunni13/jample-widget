//
//  AppDelegate.swift
//  JampleWidget
//
//  Created by James on 6/9/24.
//

import UIKit
import WidgetKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        return true
    }
    
}

extension AppDelegate {
    
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([any UIUserActivityRestoring]?) -> Void) -> Bool {
        guard let userInfo = userActivity.userInfo else { return false }
        
        if #available(iOS 14.0, *),
           let widget = userInfo[WidgetCenter.UserInfoKey.kind],
           let family = userInfo[WidgetCenter.UserInfoKey.family] {
            print("\(widget)(\(family))이 클릭되었습니다.")
        }
        
        return true
    }
    
}
