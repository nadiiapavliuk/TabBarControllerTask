//
//  ImageViewController.swift
//  TabBarControllerTask
//
//  Created by Nadiia Pavliuk on 6/12/18.
//  Copyright © 2018 Nadiia Pavliuk. All rights reserved.
//

import UIKit
import SwiftSpinner

class ImageViewController: UIViewController {
    
    @IBOutlet weak var imageUrlText: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func loadImageFromURL(_ sender: Any) {
        SwiftSpinner.useContainerView(imageView)
        SwiftSpinner.show("Loading...")
        getImage("", imageView)
    }
    
    func getImage(_ url: String, _ imageView: UIImageView) {
        
        guard let url = URL(string: String(imageUrlText.text!)) else { return }
        
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, responce, error) in
            if let error = error {
                print(error)
                return
            }
            
            if data != nil {
                let image = UIImage(data: data!)
                if image != nil {
                    DispatchQueue.main.async {
                        imageView.image = image
                        SwiftSpinner.hide()
                    }
                }
            }
        }
        task.resume()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
