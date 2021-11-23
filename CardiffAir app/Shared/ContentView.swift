//
//  ContentView.swift
//  Shared
//
//  Created by Juan David Tovar vera on 18/9/21.
//

import SwiftUI
struct ContentView: View {
    @State private var statusBar = 0.0
    
    @State var minutesShow = "00"
    @State var hoursShow = "00"
    @State var minutesSend = "00"
    @State var hoursSend = "00"
    @State var powerButtonStatus = "OFF"
    @State var fanSpeedTitle = ""
    @State var runTimeTitle = ""
    
    @State var minutes = 0
    @State var hours = 0
    
    var body: some View {
                
        /*switch powerButtonStatus {
            case "ON":
                fanSpeedTitle = "FAN SPEED"
                runTimeTitle = "RUN TIME"
                
            case "OFF":
                fanSpeedTitle = "FAN"
                runTimeTitle = "OFF"
        }*/

        ZStack{
            Image("keypadblackdisplay-2")
            VStack{
                Spacer()
                // botones speed y power
                HStack{
                    Spacer()
                    
                    Button( action: {
                        print("less speed")
                        if (statusBar > 0){
                            statusBar -= 1
                            print(statusBar)
                       }
                    }) {
                        Text("")
                            .frame(minWidth: 80, maxWidth: 80, minHeight: 80, maxHeight: 80, alignment: .center)
                            .background(Color.orange)
                            .cornerRadius(7)
                    }
                    Spacer()
                    Button(action: {
                        print("More speed")
                        if (statusBar < 15){
                            statusBar += 1
                            print(statusBar)
                        }
                    }) {
                        Text("")
                            .frame(minWidth: 80, maxWidth: 80, minHeight: 80, maxHeight: 80, alignment: .center)
                            .background(Color.gray)
                            .cornerRadius(7)
                    }
                    Spacer()
                    Button(action: {
                        if(powerButtonStatus == "OFF"){
                            powerButtonStatus = "ON"
                        }else{
                            powerButtonStatus = "OFF"
                        }
                        print(powerButtonStatus)
                        
                        
                    }) {
                        Text("")
                            .frame(minWidth: 80, maxWidth: 80, minHeight: 80, maxHeight: 80, alignment: .center)
                            .background(Color.purple)
                            .cornerRadius(7)
                    }
                    Spacer()
                }
                
                Spacer()
                Text("FAN SPEED")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                ProgressView("", value: statusBar, total: 15)
                    .padding(.horizontal, 100.0)
                Text("RUN TIME")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                
                HStack{
                    Group{
                        Text(hoursShow)
                            .fontWeight(.bold)
                            .font(.title)
                            .foregroundColor(Color.white)
                        Text(":")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                        Text(minutesShow)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                        Text("/")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                        Text(hoursSend)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                        Text(":")
                            .font(.title)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                        Text(minutesSend)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                    }//END GROUP
                    
                }// END HSTACK
                Spacer()
                HStack{
                    Group{
                        Spacer()
                        Button(action: {
                            print("Down pressed")
                            
                            if((minutes != 0) || (hours != 0)) {
                                minutes -= 15
                                if (minutes < 0) {
                                    minutes = 45
                                    if (hours > 0){
                                        hours -= 1
                                    }
                                }

                                //setTime = (myTimeHours*3600 + myTimeMinutes*60).toString()

                                if(minutes == 0 || minutes == 60){
                                    minutesShow = "0" + String(minutes)
                                }else{
                                    minutesShow = String(minutes)
                                }

                                if (hours <= 9){
                                    hoursShow = "0" +  String(hours)
                                }else{
                                    hoursShow = String(hours)
                                }
                            }
                        }) {
                            Text("")
                                .frame(minWidth: 80, maxWidth: 80, minHeight: 80, maxHeight: 80, alignment: .center)
                                .background(Color.red)
                                .cornerRadius(7)
                        }
                        Spacer()
                        Button(action: {
                                
                            print("Up pressed")
                            
                            minutes = Int(minutesShow)!
                            hours = Int(hoursShow)!
                            
                            minutes += 15
                            
                            if(minutes < 60) {
                                minutesShow = String(minutes)
                                
                            }else{
                                minutes = 0
                                hours += 1
                                minutesShow = "00"
                            }
                            
                            if(hours >= 0 && hours <= 9 ){
                                hoursShow = "0" + String(hours)
                            }else{
                                hoursShow = String(hours)
                            }
                            
                            if(hours >= 24){
                                hours = 24
                                hoursShow = "24"
                                minutes = 0
                                minutesShow = "00"
                            }
                        }) {
                            Text("")
                                .frame(minWidth: 80, maxWidth: 80, minHeight: 80, maxHeight: 80, alignment: .center)
                                .background(Color.green)
                                .cornerRadius(7)
                        }
                        Spacer()
                        Button(action: {
                            print("Set pressed")
                            minutesSend = minutesShow
                            hoursSend = hoursShow
                            
                        }) {
                            Text("")
                                .frame(minWidth: 80, maxWidth: 80, minHeight: 80, maxHeight: 80, alignment: .center)
                                .background(Color.blue)
                                .cornerRadius(7)
                        }
                        Spacer()
                    }
                }
                Spacer()
            }//END VSTACK
            Spacer()
                
        }//zstack
    }//body
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
        }
    }
}
