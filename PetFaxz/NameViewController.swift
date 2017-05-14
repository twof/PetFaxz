//
//  NameViewController.swift
//  PetFaxz
//
//  Created by fnord on 5/14/17.
//  Copyright © 2017 twof. All rights reserved.
//

import UIKit

class NameViewController: UIViewController {
    var dog: Dog?

    @IBOutlet weak var nameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func coolButtonPressed(_ sender: Any) {
        guard let name = nameTextField.text else {return}
        
        self.dog = Dog()
        self.dog?.name = name
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! AgeViewController
        vc.dog = self.dog
    }
}
