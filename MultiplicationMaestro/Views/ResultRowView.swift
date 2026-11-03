//
//  ResultRowView.swift
//  MultiplicationMaestro
//
//  Created by Steven Xia on 2026-11-03.
//


import SwiftUI
 
// Shows one prior result in the list
struct ResultRowView: View {
 
    // MARK: - Stored properties
    let result: Result
 
    // MARK: - Computed properties
    var body: some View {
        HStack {
            Text("\(result.multiplicand) × \(result.multiplier) = \(result.inputGiven)")
 
            if result.answerCorrect == false {
                Text("(\(result.correctProduct))")
                    .foregroundStyle(.secondary)
            }
 
            Spacer()
 
            if result.answerCorrect == true {
                Image(systemName: "checkmark.circle")
                    .foregroundStyle(.green)
            } else {
                Image(systemName: "x.square")
                    .foregroundStyle(.red)
            }
        }
        .font(.title2)
    }
}
 
#Preview {
    ResultRowView(result: Result(multiplicand: 12, multiplier: 5, inputGiven: "50", answerCorrect: false))
}