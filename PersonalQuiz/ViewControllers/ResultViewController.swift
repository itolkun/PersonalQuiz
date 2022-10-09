//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 06.10.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var animalTypeLabel: UILabel!
    @IBOutlet var definitionLabel: UILabel!
    
    var animal: Animal! = Animal.turtle

    
    var choosenAnswers: [Answer] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        countFrequentAnimal()
        animalTypeLabel.text = "Вы - \(animal.rawValue)"
        definitionLabel.text = animal.definition
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
    
    private func countFrequentAnimal() {
        var counts: [String: Int] = [:]

        for answer in choosenAnswers {
            counts[String(answer.animal.rawValue)] = (counts[String(answer.animal.rawValue)] ?? 0) + 1
        }
        let valueMaxElement = counts.max(by: { (a, b) -> Bool in
            return a.value < b.value
        })
        
        if let frequentAnimal = valueMaxElement {
    
            animal = Animal(rawValue: Character(frequentAnimal.key))
        }
        
    }

    
}
