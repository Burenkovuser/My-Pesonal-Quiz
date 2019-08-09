//
//  ResultsViewController.swift
//  My Pesonal Quiz
//
//  Created by Vasilii on 08/08/2019.
//  Copyright © 2019 Vasilii Burenkov. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    
    
    // MARK: - Public propirties
    var responses: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true //скрываем кнопку назад
        updateResults()
    }
    
    private func updateResults() {
        var frequencyOfAnimals: [AmimalType : Int] = [:]
        let animals = responses.map {$0.type} // функция map проходит по каждому элементу массива и что-то делает, как цикл for
        
        for animal in animals {
            frequencyOfAnimals[animal] = (frequencyOfAnimals[animal] ?? 0) + 1
        }
        let sortedFrequenceOfAnimals = frequencyOfAnimals.sorted{ $0.value > $1.value }
        
        guard let mostFrequenceAnimal = sortedFrequenceOfAnimals.first?.key else { return }
        
        updateUI(with: mostFrequenceAnimal)
    }
    
    private func updateUI(with animal: AmimalType) {
        resultAnswerLabel.text = "Вы - \(animal.rawValue)"
        resultDefinitionLabel.text = "\(animal.definition)"
    }
}
