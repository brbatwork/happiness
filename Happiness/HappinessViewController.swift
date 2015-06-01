//
//  HappinessViewController.swift
//
//  Created by Bill Barbour on 5/29/15.
//

import UIKit

class HappinessViewController: UIViewController, FaceViewDataSource {

    private struct Constants {
        static let HappinessGuestureScale: CGFloat = 4.0
    }

    @IBAction func changeHappiness(guester: UIPanGestureRecognizer) {
        switch (guester.state) {
        case .Changed, .Ended:
            let translation = guester.translationInView(faceView)
            let happinessChange = -Int(translation.y / Constants.HappinessGuestureScale)

            if happinessChange != 0 {
                happiness += happinessChange
                guester.setTranslation(CGPointZero, inView: faceView)
            }
        default: break
        }
    }
    
    @IBOutlet weak var faceView: FaceView! {
        didSet {
            faceView.datasource = self
            faceView.addGestureRecognizer(UIPinchGestureRecognizer(target: faceView, action: "scale:"))
        }
    }
    
    var happiness: Int = 100 { // 0 = ver sad 100 = ecstatic
        didSet {
            happiness = min(max(happiness, 0), 100)
            println("happiness = \(happiness)")
            updateUI()
        }
    }
    
    func updateUI() {
        faceView?.setNeedsDisplay()
        title = "\(happiness)"
    }
    
    func smilinessForFaceView(sender: FaceView) -> Double? {
        return Double(happiness - 50) / 50
    }

}
