//
//  Icon.swift
//  IconsTableViewDemo
//
//  Created by Tomer Buzaglo on 13/04/2016.
//  Copyright © 2016 Tomer Buzaglo. All rights reserved.
//

import UIKit

class Icon: NSObject, Comparable {
    
    var title: String
    var subtitle: String
    var image: UIImage?
    var rating = RatingType.Unrated
    
    init(withTitle title: String, subtitle: String, imageName: String?) {
        self.title = title
        self.subtitle = subtitle
        if let imageName = imageName {
            if let iconImage = UIImage(named: imageName) {
                image = iconImage
            }
        }
    }
}

func < (lhs: Icon, rhs: Icon) -> Bool {
    return lhs.title < rhs.title
}

func == (lhs: Icon, rhs: Icon) -> Bool {
    return lhs.title == rhs.title && lhs.subtitle == rhs.subtitle
}

//Icon Rating
enum RatingType : Int {
    case Unrated, Nice, Great, Awsome
}