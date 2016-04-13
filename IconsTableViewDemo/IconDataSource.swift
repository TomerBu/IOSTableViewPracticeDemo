//
//  IconDataSource.swift
//  IconsTableViewDemo
//
//  Created by Tomer Buzaglo on 13/04/2016.
//  Copyright © 2016 Tomer Buzaglo. All rights reserved.
//

import Foundation

class IconDataSource {
    
    //enable subscript by Int
    subscript(index: Int) -> [Icon] {
        get {
            if index == 0 {
                return iconsBySeason["Winter"]!
            }
            return iconsBySeason["Summer"]!
        }
    }
    
    
    var iconsBySeason = [String:[Icon]]()
    var allIcons:[Icon]
    
    init(){
        allIcons = []
        iconsBySeason["Winter"] = winterSet()
        iconsBySeason["Summer"] = summerSet()
        allIcons += iconsBySeason["Winter"]!
        allIcons += iconsBySeason["Summer"]!
    }
    
    var numberOfSections:Int{
        return iconsBySeason.count
    }
    
    private func winterSet() -> [Icon] {
        var icons = [Icon]()
        icons.append(Icon(withTitle: "Ornament", subtitle: "Hang on your tree", imageName: "icons_winter_01.png"))
        icons.append(Icon(withTitle: "Candy Cane", subtitle: "Mmm, tasty", imageName: "icons_winter_02.png"))
        icons.append(Icon(withTitle: "Snowman", subtitle: "A very happy soul", imageName: "icons_winter_03.png"))
        icons.append(Icon(withTitle: "Penguin", subtitle: "Mario's friend", imageName: "icons_winter_04.png"))
        icons.append(Icon(withTitle: "Santa Hat", subtitle: "Found it in the chimney", imageName: "icons_winter_05.png"))
        icons.append(Icon(withTitle: "Gift", subtitle: "Under the tree", imageName: "icons_winter_06.png"))
        icons.append(Icon(withTitle: "Gingerbread Man", subtitle: "Lives in a yummy house", imageName: "icons_winter_07.png"))
        icons.append(Icon(withTitle: "Christmas Tree", subtitle: "Smells good", imageName: "icons_winter_08.png"))
        icons.append(Icon(withTitle: "Snowflake", subtitle: "Unique and beautiful", imageName: "icons_winter_09.png"))
        icons.append(Icon(withTitle: "Reindeer", subtitle: "A very shiny nose", imageName: "icons_winter_10.png"))
        return icons
    }
    
    private func summerSet() -> [Icon] {
        var icons = [Icon]()
        icons.append(Icon(withTitle: "Sun", subtitle: "A beautiful day", imageName: "summericons_100px_01.png"))
        icons.append(Icon(withTitle: "Beach Ball", subtitle: "Fun in the sand", imageName: "summericons_100px_02.png"))
        icons.append(Icon(withTitle: "Swim Trunks", subtitle: "Time to go swimming", imageName: "summericons_100px_03.png"))
        icons.append(Icon(withTitle: "Bikini", subtitle: "Staying cool", imageName: "summericons_100px_04.png"))
        icons.append(Icon(withTitle: "Sand Bucket and Shovel", subtitle: "A castle in the sand", imageName: "summericons_100px_05.png"))
        icons.append(Icon(withTitle: "Surfboard", subtitle: "Catch a wave", imageName: "summericons_100px_06.png"))
        icons.append(Icon(withTitle: "Strawberry Dacquari", subtitle: "Great way to relax", imageName: "summericons_100px_07.png"))
        icons.append(Icon(withTitle: "Sunglasses", subtitle: "I wear them at night", imageName: "summericons_100px_08.png"))
        icons.append(Icon(withTitle: "Flip Flops", subtitle: "Sand between your toes", imageName: "summericons_100px_09.png"))
        icons.append(Icon(withTitle: "Ice Cream", subtitle: "A summer treat", imageName: "summericons_100px_10.png"))
        return icons
    }
}