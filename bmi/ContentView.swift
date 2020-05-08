//
//  ContentView.swift
//  bmi
//
//  Created by Shaimaa on 5/7/20.
//  Copyright © 2020 Shaimaa. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var weight: String = ""
    @State var height: String = ""
    @State var bmi: String = "0.0"
    @State var bmiStatusT: String = "..."
    
    var body: some View {
        ZStack{
            Color(#colorLiteral(red: 0.889144659, green: 0.9417098165, blue: 1, alpha: 1))
            
            VStack{
                VStack{
                    Text("welcome to bmi calculator")
                        .font(.system(size: 30))
                        .multilineTextAlignment(.leading)
                        .offset(y: -40)
                    
                    TextField("height im (m)", text: $height)
                        .keyboardType(.decimalPad)
                        // .keyboardType(.numberPad)  have no "."
                        .offset(y: -30)
                        .font(.system(size: 30))
                    
                    TextField("weight im (kg)", text: $weight)
                        .keyboardType(.decimalPad)
                        .font(.system(size: 30))
                        .offset(y: -30)
                    Button(action: {
                        self.calculateBMIandUpdate()
                        print(self.height)
                        print(self.weight)
                    }) {
                        Text("calculate")
                            .foregroundColor(.black)
                             .font(.system(size: 25))
                            .padding()
                            .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                            .clipShape(Capsule())
                    }
                }.padding()
                
                VStack{
                    Text("BMI")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text(self.bmi)
                        .font(.system(size: 40))
                        .fontWeight(.heavy)
                    
                    Text("Status")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text(self.bmiStatusT)
                        .font(.system(size: 40))
                        .fontWeight(.heavy)
                }.offset(y: 60)
            }
        }
    }
    
    func calculateBMIandUpdate(){
        let wt = Double(self.weight) ?? 0
        let ht = Double(self.height) ?? 0
        let bmiN = self.calculateBMI(w: wt, h: ht)
        let bmiStatus1 = self.bmiStatusf(bmi: bmiN)
        self.bmi = String(format: "%.1f", bmiN)
        self.bmiStatusT = bmiStatus1
    }
    
    func calculateBMI(w: Double, h: Double) -> Double {
        return w / h * h
    }
    
    func bmiStatusf(bmi: Double) -> String {
        //        if bmi < 20 {
        //            return "Thin"
        //        }
        //        else if bmi >= 20 && bmi < 50 {
        //            return "Good"
        //        }
        //        else {
        //            return "over weight"
        //        }
        switch bmi {
        case 0..<20: return "Thin"
        case 20..<50: return "good"
        case 50...: return "over weight"
        default: return "error"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
