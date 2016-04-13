//
//  NewViewController.swift
//  Photos
//
//  Created by Lee Kangsik Kevin on 4/11/16.
//  Copyright © 2016 iOS DeCal. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {
    
    @IBOutlet weak var buttonHeart: UIButton!
    
    @IBOutlet weak var labelUsername: UILabel!
    @IBOutlet weak var labelLike: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    var image = UIImage()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.imageView.image = self.image
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
