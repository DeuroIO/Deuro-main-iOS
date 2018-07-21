//
//  Copyright © 2014 Yalantis
//  Licensed under the MIT license: http://opensource.org/licenses/MIT
//  Latest version can be found at http://github.com/yalantis/Side-Menu.iOS
//

import UIKit
import Fabric
import Crashlytics

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        Fabric.with([Crashlytics.self])
        
        let telegramButton = UIButton(type: .custom)
        guard let windowRect = window?.frame else {
            return
        }
        let windowWidth = windowRect.size.width
        let windowHeight = windowRect.size.height
        telegramButton.frame = CGRect(x: windowWidth - 120, y: windowHeight - 160, width: 100, height: 100)
        telegramButton.setImage(UIImage(named: "telegram"), for: .normal)
        telegramButton.addTarget(self, action: #selector(AppDelegate.telegramButtonTouched), for: UIControlEvents.touchUpInside)
        window?.addSubview(telegramButton)
    }
    
    func telegramButtonTouched() {
        UIApplication.shared.open(URL(string: "https://t.me/deuroio_english")!, options: [:], completionHandler: nil)
    }
}

