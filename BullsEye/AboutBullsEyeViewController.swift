//
//  AboutBullsEyeViewController.swift
//  BullsEye
//
//  Created by Sumith on 11/05/21.
//

import UIKit
import WebKit

class AboutBullsEyeViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()


        if let htmlPath = Bundle.main.path(forResource: "BullsEye", ofType: "html"){
            let url = URL(fileURLWithPath: htmlPath)
            let request = URLRequest(url: url)
            webView.load(request)
        }
        

        

    }
    
    @IBAction func onCloseTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
   

}
