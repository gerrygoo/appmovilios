//
//  ProfileVC.swift
//  PerfectProject
//
//  Created by Gerry G on 4/30/18.
//  Copyright © 2018 Gerry G. All rights reserved.
//

import UIKit


class ProfileVC: UIViewController {
    
    var cardView:UIView!
    var panGestureRecognizer:UIPanGestureRecognizer!
    var originalPoint: CGPoint!

    
    @IBOutlet weak var card: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(ProfileVC.panGestureRecognized(gestureRecognizer:)))
        self.view.addGestureRecognizer(panGestureRecognizer)
        
        self.cardView = self.card
        
        self.cardView.layer.borderWidth = 1
        self.cardView.layer.cornerRadius = 8;
        
        self.view.addSubview(cardView)
    }
    
    override func viewWillLayoutSubviews() {
        cardView.center = self.view.center
    }
    
    func updateCardViewWithDistances(xDistance:CGFloat, _ yDistance:CGFloat) {
        let newX = self.originalPoint.x + xDistance
        let newY = self.originalPoint.y + yDistance
        
        self.cardView.center = CGPoint(x: newX, y: newY)
    }
    
    func resetViewPositionAndTransformations() {
        UIView.animate(withDuration: 0.2, animations: {
            self.cardView.center = self.originalPoint;
            self.cardView.transform = CGAffineTransform(rotationAngle: 0);
        })
    }
    
    
    @objc func panGestureRecognized(gestureRecognizer: UIPanGestureRecognizer) {
        let xDistance = gestureRecognizer.translation(in: self.view).x
        let yDistance = gestureRecognizer.translation(in: self.view).y
        
        switch gestureRecognizer.state {
            case .began:
                self.originalPoint = self.view.center
                break
            
            case .changed:
                updateCardViewWithDistances(xDistance: xDistance, yDistance)
                break
            
            case .ended:
                resetViewPositionAndTransformations()
                break
            
            default:
                break
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
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
