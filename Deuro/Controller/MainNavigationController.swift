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
        // Do any additional setup after loading the view.
    }

}

extension MainNavigationController {
    func loadWebpageWith(url: String) {
        webVC = AXWebViewController(address: "http://ai.deuro.io")
        guard let webVC = webVC else {
            return
        }
        webVC.showsToolBar = true
        webVC.delegate = self
        webVC.navigationType = .toolItem
        webVC.navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tintColor = UIColor(red: 0.100, green: 0.100, blue: 0.100, alpha: 0.800)
        navigationController?.navigationBar.barTintColor = UIColor(red: 0.996, green: 0.867, blue: 0.522, alpha: 1.00)
        navigationController?.pushViewController(webVC, animated: true)
        self.setViewControllers([webVC], animated: true)
        
        indicator.removeFromSuperview()
        indicator.stopAnimating()
        indicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
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
