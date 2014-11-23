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
    
    
    @IBOutlet var price: WKInterfaceLabel!
    
    
    @IBOutlet var confirm: WKInterfaceButton!
    
    @IBAction func confirm_pressed() {
        
//        NSUserDefaults.standardUserDefaults().setObject(order, forKey: "order")
//        NSUserDefaults.standardUserDefaults().synchronize()
        
        confirm.setTitle("Order Place")
    }
    
    override init(context: AnyObject?) {
        // Initialize variables here.
        super.init(context: context)
                // Configure interface objects here.
        NSLog("%@ init", self)
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        NSLog("%@ will activate", self)
        
        var total:Int? = NSUserDefaults.standardUserDefaults().objectForKey("total") as? Int
        var count1:Int? = NSUserDefaults.standardUserDefaults().objectForKey("count1") as? Int
        var count2:Int? = NSUserDefaults.standardUserDefaults().objectForKey("count1") as? Int
        var count3:Int? = NSUserDefaults.standardUserDefaults().objectForKey("count1") as? Int
        var count4:Int? = NSUserDefaults.standardUserDefaults().objectForKey("count1") as? Int
        println(total)
        price.setText(String(total))
        

    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        NSLog("%@ did deactivate", self)
        super.didDeactivate()
    }
    
}
