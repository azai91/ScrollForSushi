//
//  File.swift
//  Delivery
//
//  Created by Alexander Zai on 11/22/14.
//  Copyright (c) 2014 Alexander Zai. All rights reserved.
//

import WatchKit
import Foundation

class Confirm: WKInterfaceController {
    
    let defaults = NSUserDefaults(suiteName: "ScrollforSushi")
    
    @IBOutlet var price: WKInterfaceLabel!
    var count1 = "";
    var count2 = "";
    var count3 = "";
    var count4 = "";
    var total = "";
    
    @IBOutlet var confirm: WKInterfaceButton!
    
    @IBAction func confirm_pressed() {
        
        var order = [count1,count2,count3,count4,total];
        defaults?.setObject(order, forKey: "order")
        defaults?.synchronize()
        
        println(defaults?.objectForKey("order"))
        
        confirm.setTitle("Order Placed")
        confirm.setEnabled(false)
        
        
        defaults?.setBool(true, forKey: "reset")
        defaults?.synchronize()
        
    }
    
    override init(context: AnyObject?) {
        // Initialize variables here.
        super.init(context: context)
                // Configure interface objects here.
        
//        price.font = UIFont(name: price.font.fontName, size: 40)
        NSLog("%@ init", self)
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        NSLog("%@ will activate", self)
        
        var shouldReset = defaults?.boolForKey("reset")
        
        if (shouldReset != false) {
            
            
            confirm.setEnabled(true)
            defaults?.setBool(false, forKey: "reset")
            defaults?.synchronize()
            
        }
        
        var total = defaults?.floatForKey("total")
        var count1 = defaults?.integerForKey("count1")
        var count2 = defaults?.integerForKey("count2")
        var count3 = defaults?.integerForKey("count3")
        var count4 = defaults?.integerForKey("count4")
        
        var formattedPrice = NSString(format: "%.02f", total!)
        price.setText("$\(formattedPrice)")
        
        if (total == 0) {
            
            confirm.setEnabled(false)
            
        } else {
            
            confirm.setEnabled(true)
            
        }
        

    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        NSLog("%@ did deactivate", self)
        super.didDeactivate()
    }
    
}
