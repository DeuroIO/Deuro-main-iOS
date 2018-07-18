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

    override func viewDidLoad() {
        super.viewDidLoad()
        let webVC = AXWebViewController(address: "http://ai.deuro.io")
        webVC.showsToolBar = true
        webVC.navigationType = .toolItem
        webVC.navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tintColor = UIColor(red: 0.100, green: 0.100, blue: 0.100, alpha: 0.800)
        navigationController?.navigationBar.barTintColor = UIColor(red: 0.996, green: 0.867, blue: 0.522, alpha: 1.00)
        navigationController?.pushViewController(webVC, animated: true)
        self.setViewControllers([webVC], animated: true)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
