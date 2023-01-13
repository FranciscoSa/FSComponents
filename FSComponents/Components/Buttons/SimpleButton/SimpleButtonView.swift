//
//  SimpleButtonView.swift
//  FSComponents
//
//  Created by Francisco Santana Cardoso on 12/01/23.
//

import Foundation
import SwiftUI

struct SimpleButton: View {
    public var cornerRadiusDemo: Bool = false
    
    var body: some View {
        VStack{
            makeButton(label: "Button", width: 150, cornerRadius: cornerRadiusDemo, identifier: "btn1", color: Color.blue) { print("ex: click")
            }
            
            makeButton(label: "Button", width: 125, cornerRadius: cornerRadiusDemo, identifier: "btn2", color: Color.red) {
                print ("ex: click")
            }
            makeButton(label: "Button", width: 75, cornerRadius: cornerRadiusDemo, identifier: "btn3", color: Color.green) {
                print ("ex: click")
            }
        }
    }
    
}

extension SimpleButton {
    func makeButton(label: String, width: CGFloat?, cornerRadius: Bool, identifier: String, color: Color, completion: @escaping () -> Void) -> some View {
        var button: some View {
            Button {
                completion()
            } label: {
                Text(label)
                    .bold()
                    .foregroundColor(Color.white)
                    .padding(.horizontal, width)
                    .frame(height: 50)
            }
            .background(color)
            .buttonStyle(.borderless)
            .cornerRadius(cornerRadius ? 27 : 0)
            .accessibility(identifier: identifier)
        }
        
        return button
    }
}

struct SimpleButton_Preview: PreviewProvider {
    static var previews: some View {
        SimpleButton().previewLayout(.fixed(width: 450, height: 70))
    }
}
