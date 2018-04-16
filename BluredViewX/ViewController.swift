//
//  ViewController.swift
//  BluredViewX
//
//  Created by Mohammed Altoobi on 4/15/18.
//  Copyright © 2018 Mohammed Altoobi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var cardView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        cardView.layer.cornerRadius = 5
    }

    @IBAction func showPopUp(_ sender: Any) {
        //Anmite card view
        DispatchQueue.main.async {
            self.animateIn()
        }
        
    }
    
    @IBAction func dismissPopUp(_ sender: AnyObject) {
        //dissmis card view
        DispatchQueue.main.async {
            self.animateOut()
        }
        
       
    }
    
    @objc func animateIn() {
        //clalling bluerViewX and view animaned
        blurViewX()
        
        self.view.addSubview(cardView)
        cardView.center = self.view.center
        
        cardView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        cardView.alpha = 0
        
        UIView.animate(withDuration: 0.4) {
            self.cardView.alpha = 1
            self.cardView.transform = CGAffineTransform.identity
        }
        
    }
    
    
    @objc func animateOut() {
        
        //dismiss the bluer and view animaned
        unblurViewX()
        
        UIView.animate(withDuration: 0.3, animations: {
            self.cardView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.cardView.alpha = 0
            
        }) { (success:Bool) in
            self.cardView.removeFromSuperview()
        }
    }
}

