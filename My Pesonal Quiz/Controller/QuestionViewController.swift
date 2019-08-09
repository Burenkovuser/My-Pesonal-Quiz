//
//  QuestionViewController.swift
//  My Pesonal Quiz
//
//  Created by Vasilii on 08/08/2019.
//  Copyright © 2019 Vasilii Burenkov. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    // MARK: - IBQutlets
    
    @IBOutlet weak var questionLabel: UILabel!

    @IBOutlet var singlButtons: [UIButton]!
    @IBOutlet weak var singlStackView: UIStackView!
    
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var multipleSwitches: [UISwitch]!
    
    
    @IBOutlet weak var rangedStackview: UIStackView!
    @IBOutlet var rangedLabels: [UILabel]!
    @IBOutlet weak var rangedSlider: UISlider!
    
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    // MARK: - ABActions
    @IBAction func singleButtonAnswerPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers //определяем текущий массив
        guard let currentIngex = singlButtons.firstIndex(of: sender) else { return }
        let currentAnswer = currentAnswers[currentIngex]
        answerChoosen.append(currentAnswer)
        
        nextQuestion()
    }
    
    @IBAction func multepleAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        
        for (multipleSwitch, answer) in zip(multipleSwitches, currentAnswers) {
            if multipleSwitch.isOn {
                answerChoosen.append(answer)
            }
        }
        nextQuestion()
    }
    
    @IBAction func rengeAnswersButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        answerChoosen.append(currentAnswers[index])
        
        nextQuestion()
    }
    
    
    // MARK: - Privat Properties
    
    //getOuistion() статический метод, можно вызывать без создания экземпляра
    private let questions = Quistion.getOuistion()
    private var questionIndex = 0
    private var answerChoosen: [Answer] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
     // MARK: - Privet methods
    private func updateUI() {
        // Hide everything
        for stackView in [singlStackView, multipleStackView, rangedStackview] {
            stackView?.isHidden = true
        }
        // Get current question
        let currentQuestion = questions[questionIndex]
        
        // Set current text for currentLabel
        questionLabel.text = currentQuestion.text
        
        // Calculate progress
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        // Set progress for question progress view
        questionProgressView.setProgress(totalProgress, animated: true)
        
        //Set navigation title
        title = "Вопрос №\(questionIndex + 1) из \(questions.count)"
        
        let currentAnswers = currentQuestion.answers
        
        // Show stack view corespondent to question type
        switch currentQuestion.type {
        case .single:
            updateSingleStackView(using: currentAnswers)
        case .muleplay:
            updateMultupleStackView(using: currentAnswers)
        case .ranged:
            updateRangedStackView(using: currentAnswers)
        }
    }

    /// Setup single stack view
    ///
    /// - Parameter answer: - array with answers
    ///
    /// Description of method
    private func updateSingleStackView(using answers: [Answer]) {
        //Show single stack view
        singlStackView.isHidden = false
        
        //два массива, которым присвается два параметра
        for (button, answer) in zip(singlButtons, answers) {
            button.setTitle(answer.text, for: .normal)
        }
    }
    
    /// Setup multeple stack view
    ///
    /// - Parameter answer: - array with answers
    private func updateMultupleStackView(using answers: [Answer]) {
        //Show multiple stack view
        multipleStackView.isHidden = false
        
        for (label, answer) in zip(multipleLabels, answers) {
            label.text = answer.text
        }
    }
    
    /// Setup ranged stack view
    ///
    /// - Parameter answer: - array with answers
    private func updateRangedStackView(using answers: [Answer]) {
        //Show multiple stack view
        rangedStackview.isHidden = false
        
        rangedLabels.first?.text = answers.first?.text
        rangedLabels.last?.text = answers.last?.text
    }
    
    
    // MARK: - Navigation
    
    // Show next question or go to next screen
    private func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "resultSegue", sender: nil)
        }
        
    }
    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "resultSegue" else { return }// если можно перейти по этому сигвею
        let resultVC = segue.destination as! ResultsViewController // создаем вью контроллер типа ResultsViewController
        resultVC.responses = answerChoosen
    }
}
