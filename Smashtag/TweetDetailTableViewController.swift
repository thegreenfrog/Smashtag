//
//  TweetDetailTableViewController.swift
//  Smashtag
//
//  Created by Chris Lu on 9/29/15.
//  Copyright © 2015 Stanford University. All rights reserved.
//

import UIKit

class TweetDetailTableViewController: UITableViewController {
    
    private var details = [tweetDetail]() {
    didSet {
            //update the UI
        }
    }
    
    //enum to hold vairous different types of section material
    private enum tweetDetail
    {
        case Image([MediaItem])
        case Url([Tweet.IndexedKeyword])
        case Hastag([Tweet.IndexedKeyword])
        case Users([Tweet.IndexedKeyword])
        
        var quantity: Int {
            get {
                switch self {
                case .Image(let media):
                    return media.count
                case .Url(let link):
                    return link.count
                case .Hastag(let hastag):
                    return hastag.count
                case .Users(let users):
                    return users.count
                }
            }
        }
        
    }
    
    func setTweetDetails(tweet: Tweet) {
        if tweet.media.count > 0 {
            details.append(tweetDetail.Image(tweet.media))
        }
        if tweet.hashtags.count > 0 {
            details.append(tweetDetail.Hastag(tweet.hashtags))
        }
        if tweet.urls.count > 0 {
            details.append(tweetDetail.Url(tweet.urls))
        }
        if tweet.userMentions.count > 0 {
            details.append(tweetDetail.Users(tweet.userMentions))
        }
        
    }
    
    private func updateUI() {
        //set the sections 
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return details.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // identify how many are in each array
        return details[section].quantity
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let title: UILabel = UILabel()
        title.backgroundColor = UIColor.lightGrayColor()
        let information = details[section]
        switch information {
        case .Image(_):
            title.text = "Images"
        case .Hastag(_):
            title.text = "Hashtags"
        case .Url(_):
            title.text = "Links"
        case .Users(_):
            title.text = "User Mentions"
        }
        return title
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //create different cell for Image and everything else
        let type = details[indexPath.section]
        switch type {
        case .Image(let media):
            let cell = tableView.dequeueReusableCellWithIdentifier("DetailImageCell", forIndexPath: indexPath) as! TweetDetailImageTableViewCell
            cell.ImageUrl = media[indexPath.row].url
            return cell
        case .Hastag(let list):
            let cell = tableView.dequeueReusableCellWithIdentifier("DetailCell", forIndexPath: indexPath)
            cell.textLabel?.text = list[indexPath.row].keyword
            return cell
        case .Url(let list):
            let cell = tableView.dequeueReusableCellWithIdentifier("DetailCell", forIndexPath: indexPath)
            cell.textLabel?.text = list[indexPath.row].keyword
            return cell
        case .Users(let list):
            let cell = tableView.dequeueReusableCellWithIdentifier("DetailCell", forIndexPath: indexPath)
            cell.textLabel?.text = list[indexPath.row].keyword
            return cell
        }
    }
    
//    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        if indexPath.section == 0 {
//            return 
//        }
//        else {
//            return UITableViewAutomaticDimension
//        }
//    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
