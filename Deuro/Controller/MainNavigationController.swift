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
    var webVC: AXWebViewController? = nil
    
    func setupFirstPage() {
        self.setToolbarHidden(true, animated: true)
        let content = storyboard!.instantiateViewController(withIdentifier: "FirstPageViewController") as! FirstPageViewController
        self.setViewControllers([content], animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFirstPage()
        let textAttributes = [NSForegroundColorAttributeName:UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = textAttributes
        UINavigationBar.appearance().barTintColor = UIColor.black
        UINavigationBar.appearance().tintColor = UIColor.white
        // Do any additional setup after loading the view.
    }

}

extension MainNavigationController {
    func loadWebpageWith(url: String) {
        webVC = AXWebViewController(address: url)
        guard let webVC = webVC else {
            return
        }
        webVC.showsToolBar = true
        webVC.delegate = self
        webVC.navigationType = .toolItem
        self.setViewControllers([webVC], animated: true)
        
        indicator.removeFromSuperview()
        indicator.stopAnimating()
        indicator.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        indicator.center = view.center
        self.view.addSubview(indicator)
        self.view.bringSubview(toFront: indicator)
        indicator.startAnimating()
    }
}

extension MainNavigationController: AXWebViewControllerDelegate {
    func webViewControllerDidFinishLoad(_ webViewController: AXWebViewController) {
        indicator.stopAnimating()
    }
}
