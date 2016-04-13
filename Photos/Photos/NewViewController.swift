//
//  NewViewController.swift
//  Photos
//
//  Created by Lee Kangsik Kevin on 4/11/16.
//  Copyright © 2016 iOS DeCal. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelUsername: UILabel!
    
    @IBOutlet weak var labelLikes: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var buttonHeart: UIButton!
    var image = UIImage()
    var username:String = ""
    var date:String = ""
    var likes:Int = -1
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.imageView.image = self.image
        self.labelDate.text = "Date: \(self.date)"
        self.labelUsername.text = "Username: \(self.username)"
        self.labelLikes.text = "Likes: \(String(self.likes))"
        if let image = UIImage(named: "heart1.png") {
            buttonHeart.setImage(image, forState: .Normal)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func buttonClicked(sender: UIButton){
        if let image = UIImage(named: "heart2.png") {
            buttonHeart.setImage(image, forState: .Normal)
        }
    
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
