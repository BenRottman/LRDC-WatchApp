//
//  ContentView.swift
//  watchBase Watch App
//
//  Created by user229466 on 10/24/23.
//

import SwiftUI

struct stimView : View {
    var body: some View {
        VStack() {
            Image(systemName: "syringe.fill")
                .transition(.scale)
                .imageScale(.large)
            Text("You just took a shot!")
                    NavigationLink(destination: stimChoice()){
                        Image(systemName:"arrow.right")
                    } .clipShape(Circle())
        }
    }
}
    
    struct stimChoice : View {
        
        @State var buttonCount = 0
        
        var body: some View {
            VStack{
                Text("Which medication did you just take?")
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal:false, vertical:true)
                VStack{
                    Button(action:{buttonCount = 1}) {
                        HStack {
                            Image(systemName: "syringe.fill")
                            Text("Shot")
                        }
                    }
                    .background(buttonCount == 1 ? Color.green : Color.black)
                    .foregroundColor(buttonCount == 1 ? Color.black : Color.white)
                    
                    Button(action:{buttonCount = 2}) {
                        HStack {
                            Image(systemName: "pill.fill")
                            Text("Pills")
                        }
                    }
                    .background(buttonCount == 2 ? Color.green : Color.black)
                    .foregroundColor(buttonCount == 2 ? Color.black : Color.white)

                    
                    Button(action:{buttonCount = 3}) {
                        HStack {
                            Image(systemName: "cross.vial.fill")
                            Text("Liquid")
                        }
                    }
                    .background(buttonCount == 3 ? Color.green : Color.black)
                    .foregroundColor(buttonCount == 3 ? Color.black : Color.white)
                }
                .padding(.top, 0.0)
                .padding(.bottom, -20.0)
                
                
            }
            .padding(1.0)
        }
        
        func text(){
            print("text")
        }
    }

struct focusCheck : View {
    
    @State var numChoice = 0
    
    var body: some View {
        VStack(spacing: 0.0) {
            Text("Choose the smallest of the numbers:")
                .multilineTextAlignment(.center)
                .padding(.bottom)
            HStack(){
                Button(action:{numChoice = 1}) {
                    Text("1")
                }
                .background(numChoice == 1 ? Color.green : Color.black)
                .foregroundColor(numChoice == 1 ? Color.black : Color.white)
                
                Button(action:{numChoice = 2}) {
                    Text("2")
                }
                
                .background(numChoice == 2 ? Color.green : Color.black)
                .foregroundColor(numChoice == 2 ? Color.black : Color.white)
                
                Button(action:{numChoice = 3}) {
                    Text("3")
                }
                .background(numChoice == 3 ? Color.green : Color.black)
                .foregroundColor(numChoice == 3 ? Color.black : Color.white)
            }
            .padding(.bottom)
            NavigationLink(destination: sympCheck()){
                Image(systemName: "checkmark")
            } .clipShape(Circle())
        }
    }
}

struct sympCheck : View {
    
    @State var sympScore1 = 10

    var body: some View {
        VStack(){
            Text("How likely is the following symptom?")
                .multilineTextAlignment(.center)
                .padding(.bottom, 10.0)
            VStack(){
                HStack(){
                    Text("Cough")
                    Image(systemName: "lungs.fill")
                }
                HStack(){
                    Button(action:{sympScore1 > 0 ? sympScore1 = 15 : sympScore1 = sympScore1}){
                        Text("-")
                    }
                    Text(sympScore1 + "%")
                    Button(action:{sympScore1 < 100 ? sympScore1 = 50 : sympScore1 = sympScore1}){
                        Text("+")
                    }
                }
                NavigationLink(destination: sympView()){
                    Image(systemName: "checkmark")
                } .clipShape(Circle())
            }
        }
    }
}
    
struct sympView : View {
    var body: some View {
        VStack() {
            Text("You experienced the following Symptoms!")
                .padding(.bottom, 10)
            HStack() {
                VStack(){
                    Text("Cough")
                        .padding(.bottom,2)
                    Image(systemName: "lungs.fill")
                }
                .padding(.trailing,10)
                VStack(){
                    Text("Fatigue")
                        .padding(.bottom,2)
                    Image(systemName: "lungs.fill")
                }
                .padding(.leading,10)
            }
            .padding(.bottom,10)
                    NavigationLink(destination: stimChoice()){
                        Image(systemName:"arrow.right")
                    } .clipShape(Circle())
        }
    }
}
    
    struct ContentView: View {
        var body: some View {
            NavigationView {
                VStack {
                    
                    NavigationLink(destination: stimView()){
                        Text("Stimulus View")
                    }
                    .buttonStyle(.bordered)
                    
                    NavigationLink(destination: stimChoice()){
                        Text("Stimulus Choice")
                    }
                    .buttonStyle(.bordered)
                    
                    NavigationLink(destination: sympCheck()){
                        Text("Symptom Check")
                    }
                    .buttonStyle(.bordered)
                    NavigationLink(destination: sympView()){
                        Text("SympView")
                    }
                    .buttonStyle(.bordered)
                    NavigationLink(destination: focusCheck()){
                        Text("Focus Check")
                    }
                    
                    
                }
            }
        }
    }
    
