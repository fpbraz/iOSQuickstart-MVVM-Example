//
//  MVCViewController.swift
//  MVVMProject
//
//  Created by Felipe P Braz on 2016-10-18.
//  Copyright © 2016 iOSQuickstart. All rights reserved.
//

import UIKit

class MVCViewController: UIViewController {
    
    private var dog = Dog()

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var breed: UILabel!
    @IBOutlet weak var color: UILabel!
    @IBOutlet weak var age: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateScreen()
    }
    
    func updateScreen() {
        name.attributedText = getNameAttributedString()
        breed.text = dog.breed
        color.text = dog.color
        age.text = getAgeString()
    }
    
    func getNameAttributedString() -> NSAttributedString {
        
        let color = dog.hasPedigree ? UIColor.blue : UIColor.black
        let name = dog.hasPedigree ? dog.name + "*" : dog.name
        
        return NSAttributedString(string: name, attributes: [NSForegroundColorAttributeName: color])
    }
    
    func getAgeString() -> String {
        
        let ageComponents = Calendar.current.dateComponents([.year, .month], from: dog.birthdate, to: Date())
        
        var result = ""
        
        if let years = ageComponents.year {
            result = "\(years) year"
            
            if years > 1 {
                result = "\(result)s"
            }
            result = "\(result) and"
        }
        
        if let months = ageComponents.month {
            result = "\(result) \(String(months)) month"
            
            if months > 1 {
                result = "\(result)s"
            }
        }
        
        return "\(result) old"
    }
}

