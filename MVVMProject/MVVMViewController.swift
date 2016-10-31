//
//  MVVMViewController.swift
//  MVVMProject
//
//  Created by Felipe P Braz on 2016-10-18.
//  Copyright © 2016 iOSQuickstart. All rights reserved.
//

import UIKit

class MVVMViewController: UIViewController {

    private var dogViewModel = DogViewModel(dog: Dog())
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var breed: UILabel!
    @IBOutlet weak var color: UILabel!
    @IBOutlet weak var age: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateScreen()
    }
    
    func updateScreen() {
        name.attributedText = dogViewModel.name
        breed.text = dogViewModel.breed
        color.text = dogViewModel.color
        age.text = dogViewModel.age
    }
}

