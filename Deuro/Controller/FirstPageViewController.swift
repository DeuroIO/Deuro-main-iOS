//
//  FirstPageViewController.swift
//  Deuro
//
//  Created by Gelei Chen on 7/18/18.
//  Copyright © 2018 Yalantis. All rights reserved.
//

import UIKit

class FirstPageViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let cellID = "galleryCellID"
    let defaultMinRatio: CGFloat = 6.0
    let defaultMaxRatio: CGFloat = 1
    
    fileprivate var items: [Dictionary<String, String>] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let jsonPath = Bundle.main.path(forResource: "gallery", ofType: "json")
        let jsonData: Data? = FileManager.default.contents(atPath: jsonPath ?? "")
        if let aData = jsonData {
            items = try! JSONSerialization.jsonObject(with: aData, options: []) as! [Dictionary<String, String>]
        }
        collectionView.register(UINib(nibName: "galleryCell", bundle: Bundle.main), forCellWithReuseIdentifier: cellID)
        let layout = AWCollectionViewSlidingDoorLayout(maxRatio: defaultMaxRatio, andMinRatio: defaultMinRatio)
        layout?.cellHeight = 10
        collectionView.collectionViewLayout = layout!
        collectionView.collectionViewLayout.invalidateLayout()
        
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

extension FirstPageViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ cv: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let itemDict = items[indexPath.item]
        let cell = cv.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! GalleryCell
        cell.titleLabel.text = itemDict["title"]?.uppercased()
        cell.subtitleLabel.text = itemDict["subtitle"]
        cell.imageView.image = UIImage(named: itemDict["image"] ?? "")
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

}
