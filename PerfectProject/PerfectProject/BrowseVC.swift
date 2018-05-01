//
//  BrowseVC.swift
//  PerfectProject
//
//  Created by Gerry G on 4/30/18.
//  Copyright © 2018 Gerry G. All rights reserved.
//

import UIKit

class BrowseVC: UIViewController {
    
    
    var userControllers: [UIViewController] = []
    var producerControllers: [UIViewController] = []
    
    @IBOutlet weak var modeSwitch: UISwitch!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        if tabBarController!.viewControllers!.count > 3 {
            self.userControllers = (tabBarController?.viewControllers)!
        
            self.producerControllers = self.userControllers
            
            self.userControllers.remove(at: 3)
            self.userControllers.remove(at: 3)
        
            self.producerControllers.remove(at: 1)
            self.producerControllers.remove(at: 1)
        
            tabBarController?.viewControllers = self.userControllers
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        modeSwitch.addTarget(self, action: #selector(switchChanged), for: UIControlEvents.valueChanged)
    }
    
    @objc func switchChanged(mySwitch: UISwitch) {
        let value = mySwitch.isOn
        if (value) {
            tabBarController?.viewControllers = self.producerControllers
        } else {
            tabBarController?.viewControllers = self.userControllers
        }
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
