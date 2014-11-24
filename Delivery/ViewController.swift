//
//  ViewController.swift
//  ScrollForSushi
//
//  Created by Caroline Wong on 11/22/14.
//  Copyright (c) 2014 madebycaro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    var user = User()
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var nameField: UITextField!
    @IBOutlet var passwordLabel: UILabel!
    @IBOutlet var passwordField: UITextField!
    @IBAction func loginPressed(sender: AnyObject) {
        user.name = nameField.text
        user.password = passwordField.text
        var defaults: NSUserDefaults = NSUserDefaults(suiteName: "scrollforsushi")!
    
        defaults.setObject(user.name, forKey: "firstName")
        defaults.synchronize()
    }
}



//        var host = "http://api.delivery.com/"
//        var GUEST_TOKEN = "Guest-Token"
//        var AUTH_TOKEN = "Authorization"
//        var GUEST_TOKEN_URL = "customer/auth/guest"
//        var CUSTOMER_CART_URL = "customer/cart"
//        var CHECKOUT_URL = "customer/cart"
//        var CC_URL = "customer/cc"
//        var AUTH_URL = "customer/auth"
//        var LOCATION_URL = "customer/location"
//        var ORDER_URL = "customer/orders/recent"
//        var SEARCH_URL = "merchant/search/delivery"
//        var SEARCH_ADDRESS = "1330 1st Ave, 10021"
//        var ADDRESS_APT = "Apt 123"
//        var CLIENT_ID = "YjYyNTM1NDAxMmU2M2YzNzYyY2UwOWU2NGM2ZDdkNzZk"
//        var ORDER_TYPE = "delivery"
//
//        var redirectURI = "http://scrollforsushi"
//
//        var settings = [
//            "client_id": "YjYyNTM1NDAxMmU2M2YzNzYyY2UwOWU2NGM2ZDdkNzZk",
//            "client_secret": "kqBYCuDQMNXLGhaTi8j7exzmT0oW5wd2TZC0VEa1",
//            "authorize_uri": "http://api.delivery.com/customer/auth",
//            "token_uri": "http://api.delivery.com/api/third_party/access_token"
//        ]
//
//        let oauth = OAuth2CodeGrant(settings: settings)
//        oauth.onAuthorize = { parameters in
//            println("Did authorize with parameters: \(parameters)")
//        }
//        oauth.onFailure = { error in        // `error` is nil on cancel
//            if nil != error {
//                println("Authorization went wrong: \(error!.localizedDescription)")
//            }
//        }
//
//        let redir = "myapp://callback"        // don't forget to register this scheme
//        let scope = "profile email"
//
//        let vc = HomeViewController()
//        let web = oauth.authorizeEmbedded(redir, scope: scope, params: nil, from: vc)
//        oauth.afterAuthorizeOrFailure = { wasFailure in
//            web.dismissViewControllerAnimated(true, completion: nil)
//        }
//        func application(application: UIApplication!,
//            openURL url: NSURL!,
//            sourceApplication: String!,
//            annotation: AnyObject!) -> Bool {
//                // you should probably first check if this is your URL being opened
//                if openURl.url {
//                    oauth.handleRedirectURL(url)
//                }
//        }
//        let req = oauth.request(forURL: resource URL)
//        let session = NSURLSession.sharedSession()
//        let task = session.dataTaskWithRequest(req) { data, response, error in
//        if nil != error {
//            // something went wrong
//        }
//        else {
//            // check the response and the data
//            // you have just received data with an OAuth2-signed request!
//        }
//}
//task.resume()
//
//        var urlToAuthorizeInBrowser = "http://api.delivery.com/third_party/authorize?client_id=" + CLIENT_ID + "&redirect_uri=" + redirectURI
//            + "&response_type=code&scope=global&guest_token=" + guestToken;
//        System.out.println("Please go to " + urlToAuthorizeInBrowser + " in your browser, sign in or create an account, and you'll be redirected "
//            + "to a url that looks like http://localhost/?code=DH8uAFjSO5dq2Alzr37PZPyUZjsGEAgG6MhUcIS9&state=."
//            + " Please copy the code portion of in the URL (DH8uAFjSO5dq2Alzr37PZPyUZjsGEAgG6MhUcIS9 in this "
//            + "example) and paste it here. I'm waiting for that input :");

//        client_id=" + CLIENT_ID + "&redirect_uri=" + redirectURI
//        + "&response_type=code&scope=global&guest_token=" + guestToken;,


//        let clientId = "YjYyNTM1NDAxMmU2M2YzNzYyY2UwOWU2NGM2ZDdkNzZk"
//
//
//        var url2 = "https://delivery.com/oauth2/authenticate?client_id=\(clientId)&response_type=code&scope=global&state='testing'"
//        //&redirect_uri=YOUR_REGISTERED_REDIRECT_URI"
//
//        var url: NSURL = NSURL(string: url2)!
//        var request1: NSURLRequest = NSURLRequest(URL: url)
//        var response: AutoreleasingUnsafeMutablePointer <NSURLResponse?
//        >=nil
//
//        var error: AutoreleasingUnsafeMutablePointer <NSErrorPointer?>=nil
//
//        var dataVal: NSData =  NSURLConnection.sendSynchronousRequest(request1, returningResponse: response, error:nil)!
//
//        var err: NSError
//        var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(dataVal, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
//        println("Synchronous\(jsonResult)")
//

