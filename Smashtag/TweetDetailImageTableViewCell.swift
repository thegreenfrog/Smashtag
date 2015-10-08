//
//  TweetDetailImageTableViewCell.swift
//  Smashtag
//
//  Created by Chris Lu on 10/2/15.
//  Copyright © 2015 Stanford University. All rights reserved.
//

import UIKit

class TweetDetailImageTableViewCell: UITableViewCell {

    @IBOutlet weak var detailImage: UIImageView! {
        didSet {
            print("image set")
        }
    }
    
    var ImageUrl: NSURL! {
        didSet {
            updateImage()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func updateImage() {
        detailImage?.image = nil
        dispatch_async(dispatch_get_global_queue(Int(QOS_CLASS_UTILITY.rawValue), 0)) {
            if let imageData = NSData(contentsOfURL: self.ImageUrl) {
                dispatch_async(dispatch_get_main_queue()) {
                    self.detailImage?.image = UIImage(data: imageData)
                    
                }
                
            }
        }

    }

}
