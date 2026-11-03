//
//  QuizViewModel.swift
//  MultiplicationMaestro
//
//  Created by Steven Xia on 2026-11-03.
//


import Foundation
 
@Observable
class QuizViewModel {
 
    // MARK: - Stored properties
 
    // The question being asked
    var multiplicand: Int = Int.random(in: 1...12)
    var multiplier: Int = Int.random(in: 1...12)
 
    // What the user typed
    var inputGiven: String = ""
 
    // Whether the answer has been checked, and whether it was right
    var answerChecked: Bool = false
    var answerCorrect: Bool = false
 
    // The list: every question answered so far, newest first
    var results: [Result] = []
 
    // MARK: - Computed properties
    var correctProduct: Int {
        return multiplicand * multiplier
    }
 
    // MARK: - Functions
 
    // Check the answer, then save the result in the list
    func checkAnswer() {
        answerChecked = true
 
        if let answerGiven = Int(inputGiven) {
            if answerGiven == correctProduct {
                answerCorrect = true
            } else {
                answerCorrect = false
            }
        } else {
            // The input was not a whole number
            answerCorrect = false
        }
 
        let newResult = Result(
            multiplicand: multiplicand,
            multiplier: multiplier,
            inputGiven: inputGiven,
            answerCorrect: answerCorrect
        )
        results.insert(newResult, at: 0)
    }
 
    // The procedure: keep only the results the user asked to see
    func keepResults(matching choice: String) -> [Result] {
        var matchingResults: [Result] = []
     
        for result in results {
            if choice == "All" {
                matchingResults.append(result)
            } else if choice == "Correct" && result.answerCorrect == true {
                matchingResults.append(result)
            } else if choice == "Incorrect" && result.answerCorrect == false {
                matchingResults.append(result)
            }
        }
     
        return matchingResults
    }
    
    // Ask a new question
    func newQuestion() {
        multiplicand = Int.random(in: 1...12)
        multiplier = Int.random(in: 1...12)
        inputGiven = ""
        answerChecked = false
        answerCorrect = false
    }
}
