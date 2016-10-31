//
//  DogViewModel.swift
//  MVVMProject
//
//  Created by Felipe P Braz on 2016-10-18.
//  Copyright © 2016 iOSQuickstart. All rights reserved.
//

import UIKit

class DogViewModel {
    let name: NSAttributedString
    let breed: String
    let color: String
    let age: String
    
    private var dog: Dog
    
    init(dog: Dog) {
        self.dog = dog
        self.name = DogViewModel.getNameAttributedString(with: dog)
        self.age = DogViewModel.getAgeString(with: dog)
        self.breed = dog.breed
        self.color = dog.color
    }
    
    private static func getNameAttributedString(with dog: Dog) -> NSAttributedString {
        let color = dog.hasPedigree ? UIColor.blue : UIColor.black
        let name = dog.hasPedigree ? dog.name + "*" : dog.name
        
        return NSAttributedString(string: name, attributes: [NSForegroundColorAttributeName: color])
    }
    
    private static func getAgeString(with dog: Dog) -> String {
        let ageComponents = Calendar.current.dateComponents([.year, .month], from: dog.birthdate, to: Date())
        
        var result = ""
        
        if let years = ageComponents.year {
            result = "\(years) year"
            
            if years > 1 {
                result = "\(result)s"
            }
            result = "\(result) and "
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
