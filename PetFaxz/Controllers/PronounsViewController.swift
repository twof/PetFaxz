//
//  PronounsViewController.swift
//  PetFaxz
//
//  Created by fnord on 5/14/17.
//  Copyright © 2017 twof. All rights reserved.
//

import UIKit

class PronounsViewController: UIViewController {
    var dog: Dog?
    
    // IBOutlet
    
    @IBOutlet weak var sheButton: UIButton!
    @IBOutlet weak var heButton: UIButton!
    @IBOutlet weak var theyButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sheButton.layer.cornerRadius = 10
        heButton.layer.cornerRadius = 10
        theyButton.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func sheHerButton(_ sender: Any) {
        self.dog?.pronouns = "she"
        self.performSegue(withIdentifier: "ToBreed", sender: self)
    }
    
    @IBAction func heHimButton(_ sender: Any) {
        self.dog?.pronouns = "he"
        self.performSegue(withIdentifier: "ToBreed", sender: self)
    }

    @IBAction func theyThemButton(_ sender: Any) {
        self.dog?.pronouns = "they"
        self.performSegue(withIdentifier: "ToBreed", sender: self)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! BreedViewController
        
        vc.dog = self.dog
    }
}
