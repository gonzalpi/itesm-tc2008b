//
//  Question.swift
//  TuHuellaAlimentariaBAMX
//
//  Created by rody on 30/10/22.
//

import SwiftUI

let answerBlueColor = Color(#colorLiteral(red: 111/256, green: 202/256, blue: 215/256, alpha: 1))
let answerYellowColor = Color(#colorLiteral(red: 238/256, green: 206/256, blue: 123/256, alpha: 1))
let answerGreenColor = Color(#colorLiteral(red: 138/256, green: 192/256, blue: 119/256, alpha: 1))
let answerRedColor = Color(#colorLiteral(red: 207/256, green: 104/256, blue: 104/256, alpha: 1))

struct Question: View {
    
    @StateObject var viewRouter: ViewRouter
    
    let questionSt: QuestionType
    let bg: Color,
        fg: Color
    
    init(viewRouter: ViewRouter, questionSt: QuestionType, bg: Color, fg: Color) {
        _viewRouter =  StateObject(wrappedValue: viewRouter)
        self.questionSt = questionSt
        self.bg = bg
        self.fg = fg
    }
    
    var body: some View {
        ZStack {
            VStack {
                Circle()
                    .fill(fg)
                    .padding(.top, -600)
                    .frame(width: 625, height: 625)
                Spacer()
            }
            VStack {
                Text(questionSt.ques)
                    .frame(width: UIScreen.main.bounds.width - 50)
                    .foregroundColor(.white)
                    .font(.system(size: 40, weight: .semibold, design: .default))
                    .multilineTextAlignment(.center)
                    .padding(.top, 100)
                Spacer()
                ZStack {
                    Rectangle()
                        .fill(.white)
                        .frame(width: UIScreen.main.bounds.width, height: 420)
                        .cornerRadius(30)
                    VStack {
                        HStack {
                            AnswerButton(viewRouter: viewRouter,bg: answerBlueColor, ans: questionSt.answer[0])
                            AnswerButton(viewRouter: viewRouter,bg: answerYellowColor,ans:  questionSt.answer[1])
                        }
                        HStack {
                            AnswerButton(viewRouter: viewRouter,bg: answerGreenColor, ans:  questionSt.answer[2])
                            AnswerButton(viewRouter: viewRouter, bg: answerRedColor, ans:  questionSt.answer[3])
                        }
                        .padding(.bottom, 50)
                    }
                }
                .padding(.bottom, -60)
            }
        }
        .background(bg)
    }}

struct AnswerButton: View {
    @StateObject var viewRouter: ViewRouter
    let bg: Color
    let ans: AnswerType
    let currentPageOnArray : Int
    
    let questions: [Page] = [.question1,.question2,.question3,.question4,.question5,.question6,.question7,.question8,.question9,.question10,.footprint]
    
    init(viewRouter: ViewRouter, bg: Color, ans: AnswerType) {
        _viewRouter =  StateObject(wrappedValue: viewRouter)
        self.bg = bg
        self.ans = ans
        self.currentPageOnArray = questions.firstIndex(where: { $0 == viewRouter.currentPage })!
    }
    var body: some View {
        Button(action: {
            viewRouter.points = viewRouter.points + ans.pnt;
            viewRouter.currentPage = questions[currentPageOnArray + 1]
        },label: {
            ZStack {
                HStack {
                    Rectangle()
                        .fill(bg)
                        .frame(width: 170, height: 150)
                        .cornerRadius(20)
                }
                .frame(width: 180, height: 160)
                Text(ans.ans)
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .semibold, design: .default))
                    .multilineTextAlignment(.center)
            }
        })
    }
}

struct Question_Previews: PreviewProvider {
    static var previews: some View {
        let defaultQuestion = QuestionType(
            ques: "Pregunta Default",
            answer: [
                AnswerType(ans:"Respuesta1",pnt:10),
                AnswerType(ans:"Respuesta2",pnt:20),
                AnswerType(ans:"Respuesta3",pnt:30),
                AnswerType(ans:"Respuesta4",pnt:40),
            ]
        )
        Question(
            viewRouter: ViewRouter(),
            questionSt: defaultQuestion,
            bg: Color(#colorLiteral(red: 242/256, green: 230/256, blue: 211/256, alpha: 1)),
            fg: Color(#colorLiteral(red: 219/256, green: 62/256, blue: 76/256, alpha: 1))
        )
    }
}
