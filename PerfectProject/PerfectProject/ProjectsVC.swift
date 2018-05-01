//
//  ProjectsVC.swift
//  PerfectProject
//
//  Created by Gerry G on 5/1/18.
//  Copyright © 2018 Gerry G. All rights reserved.
//

import UIKit

class ProjectsVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "projectcell", for: indexPath) as! ProjectCVC
        cell.titleTf.text = "Your project #\( indexPath.row + 1 )"
        
        cell.startDateTf.adjustsFontSizeToFitWidth = true
        cell.endDateTf.adjustsFontSizeToFitWidth = true
        cell.startDateTf.text =  "Start: 10/10/1997"
        cell.endDateTf.text =  "End: 10/10/2024"
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        tabBarController?.selectedIndex = 2
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

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
