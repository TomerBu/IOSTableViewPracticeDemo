//
//  IconsByAlphabetDataSource.swift
//  IconsTableViewDemo
//
//  Created by Tomer Buzaglo on 13/04/2016.
//  Copyright © 2016 Tomer Buzaglo. All rights reserved.
//

import UIKit

class IconsByAlphabetDataSource {
    var iconSectionedByAlphabet:[[Icon]]!
    
    
    //enable subscript by Int
    subscript(indexByLetter index: Int) -> [Icon] {
        get {
            return iconSectionedByAlphabet[index]
        }
    }
    
    init(){

        initIconSectioned()
    }
    
    var numberOfSections:Int{
        return iconSectionedByAlphabet.count
    }
    
    private func initIconSectioned(){
        var allIcons = [Icon]()
        allIcons += winterSet()
        allIcons += summerSet()
        
        //in english = 26 + 1(Letters in english + #)
        let sectionCount = UILocalizedIndexedCollation.currentCollation().sectionTitles.count
        
        //var s:[String] = [String](count: Int, repeatedValue: <#T##String#>)
        
        //27 Icon Arrays
        iconSectionedByAlphabet = [[Icon]](count: sectionCount, repeatedValue: [Icon]())
        
        //an array of icons
        
        let collation = UILocalizedIndexedCollation.currentCollation()
        allIcons.forEach { (icon) in
            let sectionNumber = collation.sectionForObject(icon, collationStringSelector: Selector("title"))
            iconSectionedByAlphabet[sectionNumber].append(icon)
        }
        //sort all the inner arrays by name :)
        for i in 0..<iconSectionedByAlphabet.count{
            iconSectionedByAlphabet[i].sortInPlace(<)
        }

        //print(iconSectionedByAlphabet)
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