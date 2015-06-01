//
//  DiagnosedHappinessViewController.swift
//  Happiness
//
//  Created by Bill Barbour on 5/31/15.
//  Copyright (c) 2015 SograSoftware LLC. All rights reserved.
//

import UIKit

class DiagnosedHappinessViewController : HappinessViewController {
    var diagnosticHistory = [Int]()
    
    private struct History {
        static let SegueIdentifer = "Show Diagnostic History"
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            switch identifer {
            case History.SegueIdentifer:
                if let tvc = segue.destinationViewController as? HistoryViewController {
                    tvc.text = "\(diagnosticHistory)"
                }
            }
        }
        
    }
}
