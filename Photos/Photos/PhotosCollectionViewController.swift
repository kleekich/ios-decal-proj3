//
//  PhotosCollectionViewController.swift
//  Photos
//
//  Created by Gene Yoo on 11/3/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    var photos: [Photo]!
    var image: UIImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let api = InstagramAPI()
        
        // FILL ME IN
        photos = []
        api.loadPhotos(didLoadPhotos)
        
        
    }
    
    /*
     * IMPLEMENT ANY COLLECTION VIEW DELEGATE METHODS YOU FIND NECESSARY
     * Examples include cellForItemAtIndexPath, numberOfSections, etc.
     */
    
    /* Creates a session from a photo's url to download data to instantiate a UIImage.
     It then sets this as the imageView's image. */
    func loadImageForCell(photo: Photo, imageView: UIImageView) {
        
        let url = NSURL(string: photo.url)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!, completionHandler: {
            (data, response, error) -> Void in
            if error == nil {
                
                let img = UIImage(data: data!)
                imageView.image = img
                
            }
        })
        task.resume()
        
        
        
    }
    
    /* Completion handler for API call. DO NOT CHANGE */
    func didLoadPhotos(photos: [Photo]) {
        self.photos = photos
        self.collectionView!.reloadData()
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.photos.count
        
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CollectionViewCell
       
        loadImageForCell(photos[indexPath.row], imageView: cell.imageView)
     
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("item Selected: \(indexPath.row)")
        self.performSegueWithIdentifier("showImage", sender: self)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showImage"
        {
            
            let indexPaths = self.collectionView!.indexPathsForSelectedItems()!
            let indexPath = indexPaths[0] as NSIndexPath
            
            let vc = segue.destinationViewController as! NewViewController
            var selectedPhoto = photos[indexPath.row]
            
            let url = NSURL(string: selectedPhoto.url)
            let session = NSURLSession.sharedSession()
            let task = session.dataTaskWithURL(url!, completionHandler: {
                (data, response, error) -> Void in
                if error == nil {
                    let img = UIImage(data: data!)
                    vc.image = img!
                    
                }
            })
            task.resume()
            vc.username = selectedPhoto.username!
            vc.date = selectedPhoto.date!
            vc.likes = selectedPhoto.likes!
            
        }
    }
    
}

