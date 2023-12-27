//
//  ContentView.swift
//  TestApp20231226
//
//  Created by George Tompkins on 12/27/23.
//

import SwiftUI

struct ContentView: View {
    @State private var name = ""
    @State private var startTemp = 0.0
    let temperatureTypes = ["Celsius", "Fahrenheit", "Kelvin"]
    @State private var fromType = "Celsius"
    @State private var toType = "Kelvin"
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Convert From") {
                    TextField("input", value: $startTemp, format: .number)
                        .font(.largeTitle)
                    Picker("From", selection: $fromType) {
                        ForEach(temperatureTypes, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Convert To") {
                    Picker("To", selection: $toType) {
                        ForEach(temperatureTypes, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    Text("\(convertTemp(startTemp: startTemp, convertFrom: fromType, convertTo: toType), specifier: "%.2f")°")
                        .font(.largeTitle)
                }
            }
            .navigationTitle("Temperature Conversion")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

func convertTemp(startTemp: Double, convertFrom: String, convertTo: String) -> Double {
    var result: Double = 0
    if convertFrom == "Celsius" {
        switch convertTo {
        case "Celsius":
            result = startTemp
        case "Fahrenheit":
            result = (startTemp * 9/5) + 32
        case "Kelvin":
            result = startTemp + 273.15
        default:
            result = 0
        }
    } else if convertFrom == "Fahrenheit" {
        switch convertTo {
        case "Celsius":
            result = (startTemp - 32) * 5/9
        case "Fahrenheit":
            result = startTemp
        case "Kelvin":
            result = (startTemp - 32) * 5/9 + 273.15
        default:
            result = 0
        }
    } else if convertFrom == "Kelvin" {
        switch convertTo {
        case "Celsius":
            result = startTemp - 273.15
        case "Fahrenheit":
            result = (startTemp - 273.15) * 9/5 + 32
        case "Kelvin":
            result = startTemp
        default:
            result = 0
        }
    } else {
        result = 0
    }
    return result
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
