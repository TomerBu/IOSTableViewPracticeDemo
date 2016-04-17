//
//  ViewController.swift
//  IconsTableViewDemo
//
//  Created by Tomer Buzaglo on 13/04/2016.
//  Copyright © 2016 Tomer Buzaglo. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var labelTopConstraint: NSLayoutConstraint!
    
    @IBAction func tapped(sender: UITapGestureRecognizer) {
        self.labelTopConstraint.constant += 20
        UIView.animateWithDuration(0.2, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: UIViewAnimationOptions.BeginFromCurrentState, animations: {
            self.view.layoutIfNeeded()
        }) { (_) in
            self.labelTopConstraint.constant -= 20
            self.view.layoutIfNeeded()
            UIView.animateWithDuration(0.4, animations: {
                self.view.layoutIfNeeded()
            })
        }
        
    }
    var data:Icon?{
        didSet{
            initLayout()
        }
    }
    
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initLayout()
    }
    
    func initLayout(){
        subtitleLabel?.text = data?.title
        titleLabel?.text = data?.title
        imageView?.image = data?.image
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
