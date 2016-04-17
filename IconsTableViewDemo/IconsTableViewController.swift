//
//  IconsTableViewController.swift
//  IconsTableViewDemo
//
//  Created by Tomer Buzaglo on 13/04/2016.
//  Copyright © 2016 Tomer Buzaglo. All rights reserved.
//

import UIKit

class IconsTableViewController: UITableViewController {
    var dataSource = IconsByAlphabetDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return dataSource.numberOfSections
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataSource[indexByLetter: section].count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("IconCellReuseIdentifier", forIndexPath: indexPath)
        
        // Configure the cell...
        let icon = dataSource[indexByLetter: indexPath.section][indexPath.row]
        cell.imageView?.image = icon.image
        cell.textLabel?.text = icon.title
        cell.detailTextLabel?.text = icon.subtitle
        
        return cell
    }
    
    
    override func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return UILocalizedIndexedCollation.currentCollation().sectionTitles
    }
    
    override func tableView(tableView: UITableView, sectionForSectionIndexTitle title: String, atIndex index: Int) -> Int {
        
        var idx = index
        for i in idx..<dataSource.iconSectionedByAlphabet.count{
            if dataSource.iconSectionedByAlphabet[i].count > 0{
                idx = i
                break
            }
        }
        
        if dataSource.iconSectionedByAlphabet[idx].count > 0{
            
            let path = NSIndexPath(forRow: 0, inSection: idx)
            UIView.animateWithDuration(0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 12, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                tableView.scrollToRowAtIndexPath(path, atScrollPosition: UITableViewScrollPosition.Middle, animated: false)
                }, completion: nil)
            
        }
        return idx
    }
    
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionTitles = UILocalizedIndexedCollation.currentCollation().sectionTitles
        
        return sectionTitles[section]
        
    }
    
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            dataSource.removeItemsAtIndexPath(indexPath)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
    
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        
        let icon:Icon = dataSource.getItemAtIndexPath(fromIndexPath)
        
        dataSource.removeItemsAtIndexPath(fromIndexPath)
        dataSource.insertItemsAtIndexPath(toIndexPath, icon: icon)
    }
    
    
    
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let action = UITableViewRowAction(style: UITableViewRowActionStyle.Destructive, title: "Kill") { (action, indexPath) in
            self.tableView(tableView, commitEditingStyle: UITableViewCellEditingStyle.Delete, forRowAtIndexPath: indexPath)
            tableView.editing = false
        }
        action.backgroundColor = UIColor.blackColor()
        return [action]
    }
    
    
    // MARK: - Navigation
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let icon = dataSource.getItemAtIndexPath(indexPath)
        performSegueWithIdentifier("MasterToDetail", sender: icon)
    }
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let dest = segue.destinationViewController as? DetailsViewController{
            dest.data = (sender as! Icon)
        }
    }
    
}
