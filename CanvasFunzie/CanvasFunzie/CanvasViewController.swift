//
//  CanvasViewController.swift
//  CanvasFunzie
//
//  Created by Melissa Phuong Nguyen on 4/6/18.
//  Copyright © 2018 Melissa Phuong Nguyen. All rights reserved.
//

import UIKit

class CanvasViewController: UIViewController {

    @IBOutlet weak var trayView: UIView!
    
    var trayOriginalCenter: CGPoint!
    var trayUp: CGPoint!
    var trayDown: CGPoint!
    var newlyCreatedFace: UIImageView!
    var newlyCreatedFaceOriginalCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let trayDownOffset: CGFloat!
        trayDownOffset = 160
        trayUp = trayView.center // initial position
        trayDown = CGPoint(x: trayView.center.x, y: trayView.center.y + trayDownOffset)
        
        // Do any additional setup after loading the view.
    }
    
    func addGestureRecognizer(_ gestureRecognizer: UIGestureRecognizer){
        
    }
    
    @IBAction func didPanTray(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        var velocity = sender.velocity(in: view)
        
        if (sender.state == .began){
            trayOriginalCenter = trayView.center
        } else if sender.state == .changed{
            trayView.center = CGPoint(x: trayOriginalCenter.x, y: trayOriginalCenter.y + translation.y)
        } else if sender.state == .ended {
            if (velocity.y > 0 ){
                trayView.center = trayDown
            } else {
                UIView.animate(withDuration: 0.6, animations: {
                    self.trayView.center = self.trayUp!
                })
            }
        }
        
    }
    
    @IBAction func didPanFace(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        
        if (sender.state == .began){
            let imageView = sender.view as! UIImageView
            newlyCreatedFace = UIImageView(image: imageView.image)
            newlyCreatedFace.isUserInteractionEnabled = true
            view.addSubview(newlyCreatedFace)
            
            newlyCreatedFace.center = imageView.center
            newlyCreatedFace.center.y += trayView.frame.origin.y
            newlyCreatedFaceOriginalCenter = newlyCreatedFace.center
            createPanGestureRecognizer(targetView: newlyCreatedFace)
            
        } else if (sender.state == .changed){
            newlyCreatedFace.center = CGPoint(x: newlyCreatedFaceOriginalCenter.x + translation.x, y: newlyCreatedFaceOriginalCenter.y + translation.y)
        } else if (sender.state == .ended){
            
        }
    }
    
    // The Pan Gesture
    func createPanGestureRecognizer(targetView: UIImageView) {
        var panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        targetView.addGestureRecognizer(panGesture)
    }
    
    @objc func handlePanGesture(_ gesture: UIPanGestureRecognizer) {
        // get translation
        var translation = gesture.translation(in: view)
        gesture.setTranslation(newlyCreatedFaceOriginalCenter, in: view)
        if gesture.state == .began {
            // add something you want to happen when the Label Panning has started
            newlyCreatedFace = gesture.view as! UIImageView
            newlyCreatedFaceOriginalCenter = newlyCreatedFace.center
            
        }else if gesture.state == .changed {
            // add something you want to happen when the Label Panning has changed
            newlyCreatedFace.center = CGPoint(x: newlyCreatedFaceOriginalCenter.x + translation.x, y: newlyCreatedFaceOriginalCenter.y + translation.y)
            
        }else if gesture.state == .ended {
            // add something you want to happen when the Label Panning has been ended
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
