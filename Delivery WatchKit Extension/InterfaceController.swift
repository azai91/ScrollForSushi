//
//  InterfaceController.swift
//  Delivery WatchKit Extension
//
//  Created by Alexander Zai on 11/22/14.
//  Copyright (c) 2014 Alexander Zai. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    
    let defaults = NSUserDefaults(suiteName: "ScrollforSushi")

    var total:Float = 0
    
    var count1 = 0
    var count2 = 0
    var count3 = 0
    var count4 = 0
    
    var price1:Float = 0
    var price2:Float = 0
    var price3:Float = 0
    var price4:Float = 0
    
    @IBOutlet var price: WKInterfaceLabel!
    @IBOutlet var item_1: WKInterfaceButton!
    @IBOutlet var item_2: WKInterfaceButton!
    @IBOutlet var item_3: WKInterfaceButton!
    @IBOutlet var item_4: WKInterfaceButton!
    
    @IBAction func item_1_pressed() {
        
        count1++;
        total += price1;
        if count1 > 5 {
            count1 = 0
            total -= 6 * price1;
        }
        if count1 == 0 {
            item_1.setTitle("")
        } else {
            item_1.setTitle(String(count1))
        }
        
    }
    
    @IBAction func item_2_pressed() {
        
        count2++;
        total += price2;
        if count2 > 5 {
            count2 = 0
            total -= 6 * price2;
        }
        if count2 == 0 {
            item_2.setTitle("")
        } else {
            item_2.setTitle(String(count2))
        }
        
    }
    
    @IBAction func item_3_pressed() {
        
        count3++;
        total += price3;
        if count3 > 5 {
            count3 = 0
            total -= 6 * price3;
        }
        if count3 == 0 {
            item_3.setTitle("")
        } else {
            item_3.setTitle(String(count3))
        }
        
    }
    
    @IBAction func item_4_pressed() {
        
        count4++;
        total += price4;
        if count4 > 5 {
            count4 = 0
            total -= 6 * price4;
        }
        
        if count4 == 0 {
            item_4.setTitle("")
        } else {
            item_4.setTitle(String(count4))
        }
        
        
    }
    
    override init(context: AnyObject?) {
        // Initialize variables here.
        super.init(context: context)
        
        price1 = 5
        price2 = 7
        price3 = 9
        price4 = 1
        
        item_1.setBackgroundImage(UIImage(named: "Spicy-Tuna.png"))
        item_2.setBackgroundImage(UIImage(named: "SalmonRoll.png"))
        item_3.setBackgroundImage(UIImage(named: "California_Roll.png"))
        item_4.setBackgroundImage(UIImage(named: "RockNRoll.png"))
        
        defaults?.setBool(false, forKey: "reset")
        defaults?.synchronize()
        
        
        // Configure interface objects here.
        NSLog("%@ init", self)
        
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        NSLog("%@ will activate", self)
        
        var shouldReset = defaults?.boolForKey("reset")
        if (shouldReset != false) {

            count1 = 0
            count2 = 0
            count3 = 0
            count4 = 0
            total = 0
            item_1.setTitle("")
            item_2.setTitle("")
            item_3.setTitle("")
            item_4.setTitle("")

        }
    }
    
    
  
   

    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        NSLog("%@ did deactivate", self)
        
//        var order:[Int] = [count1, count2, count3, count4, total]
        defaults?.setFloat(total, forKey: "total")
        defaults?.setInteger(count1, forKey: "count1")
        defaults?.setInteger(count2, forKey: "count2")
        defaults?.setInteger(count3, forKey: "count3")
        defaults?.setInteger(count4, forKey: "count4")
        defaults?.synchronize()
        super.didDeactivate()
    }

}
