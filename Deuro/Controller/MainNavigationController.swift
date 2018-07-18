//
//  MainNavigationController.swift
//  Deuro
//
//  Created by Gelei Chen on 7/18/18.
//  Copyright © 2018 Yalantis. All rights reserved.
//

import UIKit
import AXWebViewController

class MainNavigationController: UINavigationController {
    let indicator: UIActivityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let webVC = AXWebViewController(address: "http://ai.deuro.io")
        webVC.showsToolBar = true
        webVC.delegate = self
        webVC.navigationType = .toolItem
        webVC.navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tintColor = UIColor(red: 0.100, green: 0.100, blue: 0.100, alpha: 0.800)
        navigationController?.navigationBar.barTintColor = UIColor(red: 0.996, green: 0.867, blue: 0.522, alpha: 1.00)
        navigationController?.pushViewController(webVC, animated: true)
        self.setViewControllers([webVC], animated: true)
        
        
        indicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        indicator.center = view.center
        self.view.addSubview(indicator)
        self.view.bringSubview(toFront: indicator)
        indicator.startAnimating()
        // Do any additional setup after loading the view.
    }

}
extension MainNavigationController: AXWebViewControllerDelegate {
    func webViewControllerDidFinishLoad(_ webViewController: AXWebViewController) {
        indicator.stopAnimating()
    }
}
