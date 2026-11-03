//
//  QuizView.swift
//  MultiplicationMaestro
//
//  Created by Steven Xia on 2026-11-03.
//


import SwiftUI
 
struct QuizView: View {
 
    // MARK: - Stored properties
    @State var viewModel = QuizViewModel()
    // Which results to show: All, Correct, or Incorrect
    @State var choice: String = "All"
 
    // MARK: - Computed properties
    var body: some View {
        VStack(spacing: 20) {
 
            // The question
            Text("\(viewModel.multiplicand) × \(viewModel.multiplier)")
                .font(.system(size: 64))
 
            // The answer, and whether it was right
            HStack {
                TextField("Your answer", text: $viewModel.inputGiven)
                    .textFieldStyle(.roundedBorder)
                    .font(.largeTitle)
 
                if viewModel.answerChecked == true {
                    if viewModel.answerCorrect == true {
                        Image(systemName: "checkmark.circle")
                            .foregroundStyle(.green)
                    } else {
                        Image(systemName: "x.square")
                            .foregroundStyle(.red)
                    }
                }
            }
            .font(.largeTitle)
 
            // Check the answer, or move on
            if viewModel.answerChecked == false {
                Button("Check Answer") {
                    viewModel.checkAnswer()
                }
                .buttonStyle(.borderedProminent)
            } else {
                Button("New Question") {
                    viewModel.newQuestion()
                }
                .buttonStyle(.bordered)
            }
 
            // Which results to show
            Picker("Show", selection: $choice) {
                Text("All").tag("All")
                Text("Correct").tag("Correct")
                Text("Incorrect").tag("Incorrect")
            }
            .pickerStyle(.segmented)
             
            // Prior results, from the procedure
            List(viewModel.keepResults(matching: choice)) { result in
                ResultRowView(result: result)
            }
        }
        .padding()
    }
}
 
#Preview {
    QuizView()
}
