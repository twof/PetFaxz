//
//  BreedViewController.swift
//  PetFaxz
//
//  Created by fnord on 5/14/17.
//  Copyright © 2017 twof. All rights reserved.
//

import UIKit
import UserNotifications

class BreedViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    var dog: Dog?

    @IBOutlet weak var breedPickerView: UIPickerView!
    
    let breeds = ["Affenpinscher",
                  "Afghan Hound",
                  "African Boerboels",
                  "Airedale Terrier",
                  "Akbash",
                  "Akita",
                  "Alapaha Blue Blood Bulldogs",
                  "Alaskan Klee Kai",
                  "Alaskan Malamute",
                  "American Bulldog",
                  "American Eskimo Dog",
                  "American Foxhound",
                  "American Staffordshire Terrier",
                  "American Water Spaniel",
                  "Anatolian Shepherd Dog",
                  "Australian Cattle Dog",
                  "Australian Kelpie",
                  "Australian Shepherd",
                  "Australian Silky Terrier",
                  "Australian Terrier",
                  "Basenji",
                  "Basset Hound",
                  "Beagle",
                  "Bearded Collie",
                  "Beauceron",
                  "Bedlington Terrier",
                  "Belgian Malinois",
                  "Belgian Shepherd Dog",
                  "Belgian Tervuren",
                  "Bernese Mountain Dog",
                  "Bichon Frise",
                  "Black and Tan Coonhound",
                  "Black Russian Terrier",
                  "Bloodhound",
                  "Border Collie",
                  "Border Terrier",
                  "Borzoi",
                  "Boston Terrier",
                  "Bouvier des Flandres",
                  "Boxer",
                  "Briard",
                  "Brittany",
                  "Brussels Griffon",
                  "Bull Terrier",
                  "Bullmastiff",
                  "Cairn Terrier",
                  "Canaan Dog",
                  "Cane Corso",
                  "Cardigan Welsh Corgi",
                  "Carolina Dog",
                  "Catahoula Leopard Dogs",
                  "Cavalier King Charles Spaniel",
                  "Central Asian Ovtcharkas",
                  "Cesky Terrier",
                  "Chesapeake Bay Retriever",
                  "Chihuahua",
                  "Chinese Crested",
                  "Chinese Foo",
                  "Chinese Shar-Pei",
                  "Chipoo",
                  "Chow Chow",
                  "Clumber Spaniel",
                  "Cocker Spaniel",
                  "Cockapoo",
                  "Collie",
                  "Coton De Tulears",
                  "Curly-Coated Retriever",
                  "Dachshund",
                  "Dalmatian",
                  "Dandie Dinmont Terrier",
                  "Doberman Pinscher",
                  "Dogue de Bordeaux",
                  "English Bulldogs",
                  "English Cocker Spaniels",
                  "English Foxhound",
                  "English Setter",
                  "English Shepherd",
                  "English Springer Spaniel",
                  "English Toy Spaniel",
                  "Estrela Mountain Dogs",
                  "Field Spaniel",
                  "Fila Brasileiros",
                  "Finnish Spitz",
                  "Flat-Coated Retriever",
                  "Fox Terrier�(Smooth)",
                  "Fox Terrier�(Wire)",
                  "French Bulldog",
                  "German Pinscher",
                  "German Shepherd",
                  "German Shorthaired Pointer",
                  "German Wirehaired Pointer",
                  "Giant Schnauzer",
                  "Glen of Imaal Terrier",
                  "Golden Retriever",
                  "Goldendoodle",
                  "Gordon Setter",
                  "Great Dane",
                  "Great Pyrenees",
                  "Greater Swiss Mountain Dog",
                  "Greyhound",
                  "Harrier",
                  "Havanese",
                  "Hungarian Vizsla",
                  "Ibizan Hound",
                  "Irish Setter",
                  "Irish Terrier",
                  "Irish Water Spaniel",
                  "Irish Wolfhound",
                  "Italian Greyhound",
                  "Jack Russell Terrier",
                  "Japanese Chin",
                  "Keeshond",
                  "Kerry Blue Terrier",
                  "Komondor",
                  "Kooikerhondje",
                  "Kuvasz",
                  "Labradoodle",
                  "Labrador Retriever",
                  "Laekenois",
                  "Lakeland Terrier",
                  "Lancashire Heeler",
                  "Lhasa Apso",
                  "L�wchen",
                  "Maltese",
                  "Maltipoo",
                  "Manchester Terrier",
                  "Maremma Sheepdog",
                  "Mastiff",
                  "Miniature Bull Terrier",
                  "Miniature Pinscher",
                  "Miniature Poodle",
                  "Miniature Schnauzer",
                  "Neapolitan Mastiff",
                  "Newfoundland",
                  "Norfolk Terrier",
                  "Norwegian Buhunds",
                  "Norwegian Elkhound",
                  "Norwich Terrier",
                  "Nova Scotia Duck Tolling Retriever",
                  "Old English Sheepdog",
                  "Otterhound",
                  "Papillon",
                  "Parson Russell Terrier",
                  "Peekapoo",
                  "Pekingese",
                  "Pembroke Welsh Corgi",
                  "Petit Basset Griffon Vendeen",
                  "Pharaoh Hound",
                  "Pit Bull",
                  "Plott",
                  "Pointer",
                  "Polish Lowland Sheepdog",
                  "Pomapoo",
                  "Pomeranian",
                  "Poodle (Standard)",
                  "Portuguese Water Dog",
                  "Pug",
                  "Puli",
                  "Rat Terrier",
                  "Redbone Coonhound",
                  "Rhodesian Ridgeback",
                  "Rottweiler",
                  "Saint Bernard",
                  "Saluki",
                  "Samoyed",
                  "Schipperke",
                  "Schnoodle",
                  "Scottish Deerhound",
                  "Scottish Terrier",
                  "Sealyham Terrier",
                  "Shetland Sheepdog",
                  "Shiba Inu",
                  "Shih Tzu",
                  "Siberian Husky",
                  "Silky Terrier",
                  "Skye Terrier",
                  "Snorkie",
                  "Soft-coated Wheaten Terrier",
                  "Spinone Italiano",
                  "Staffordshire Bull Terrier",
                  "Standard Schnauzer",
                  "Sussex Spaniel",
                  "Swedish Vallhund",
                  "Thai Ridgeback",
                  "Tibetan Mastiff",
                  "Tibetan Spaniel",
                  "Tibetan Terrier",
                  "Toy Fox Terrier",
                  "Toy Manchester Terrier",
                  "Toy Poodle",
                  "Treeing Walker Coonhound",
                  "Vizsla",
                  "Weimaraner",
                  "Welsh Springer Spaniel",
                  "Welsh Terrier",
                  "West Highland White Terrier",
                  "Whippet",
                  "Wirehaired Pointing Griffon",
                  "Xoloitzcuintle",
                  "Yorkie-Poo",
                  "Yorkshire Terrier"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        breedPickerView.dataSource = self
        breedPickerView.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.breeds.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.breeds[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.dog?.breed = breeds[row]
    }
    
    @IBAction func coolButtonPressed(_ sender: Any) {
        PetFaxzService(endpoint: PetFaxz.GetMessage(breed: (self.dog?.breed)!, age: (self.dog?.age)!, name: (self.dog?.name)!, pronoun: (self.dog?.pronouns)!)).get { (result) in
            switch result {
            case .Success(let message):
                self.scheduleLocal(message: message)
            case .Failure(let error):
                print(error)
            }
        }
    }
    
    func scheduleLocal(message: String) {
        let center = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = "Your Dog"
        content.body = message
        content.categoryIdentifier = "alarm"
        content.userInfo = ["customData": "fizzbuzz"]
        content.sound = UNNotificationSound.default()
        
        var dateComponents = DateComponents()
        dateComponents.hour = 10
        dateComponents.minute = 30
       
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        center.add(request)
    }
}
