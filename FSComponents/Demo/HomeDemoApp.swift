//
//  HomeDemoApp.swift
//  FSComponents
//
//  Created by Francisco Santana Cardoso on 12/01/23.
//

import Foundation
import SwiftUI

struct HomeDemoApp: View {
    @State private var searchText: String = ""
    let componentsList: ComponentsListItens = ComponentsListItens()
    
    var body: some View {

        NavigationView {
            List (ComponentsListItens().componentsItems) { group in
                Section {
                    ForEach(group.componentsNames) { component in
                        switch component.name {
                        case .simpleButtonRadius:
                            if searchText == "" || component.name.rawValue.contains(searchText){
                                newDemoCell(componentName: component.name.rawValue, view: SimpleButton(cornerRadiusDemo: true))
                            }
                        case .simpleButtonNoRadius:
                            if searchText == "" || component.name.rawValue.contains(searchText){
                                newDemoCell(componentName: component.name.rawValue, view: SimpleButton(cornerRadiusDemo: false))
                            }
                        }
                    }
                } header: {
                    Text(group.componentGroupName.rawValue)
                        .bold()
                        .font(.system(size: 22))
                }
            }
        }.navigationTitle("FSComponents")
        .searchable(text: $searchText){
            
        }
    }
}

extension HomeDemoApp {
    func newDemoCell(componentName: String, view: some View ) -> some View {
        var demoCell: some View {
            NavigationLink {
                view
            } label: {
                Text (componentName)
            }
        }
        return demoCell
    }
}

enum componentGroupNameEnum: String {
    case buttons = "Buttons"
}

enum ComponentsNamesEnum: String {
    case simpleButtonRadius = "Simple Button Radius"
    case simpleButtonNoRadius = "Simple Button Flat"
}

struct componentsNames: Identifiable {
    var id = UUID()
    let name: ComponentsNamesEnum
}

struct componentsGroup: Identifiable {
    var id = UUID()
    let componentGroupName: componentGroupNameEnum
    let componentsNames: [componentsNames]
}

struct ComponentsListItens {
    public let componentsItems: [componentsGroup] = [
        componentsGroup(componentGroupName: .buttons, componentsNames: [componentsNames(name: .simpleButtonRadius),                                                                  componentsNames(name: .simpleButtonNoRadius)]
                       )
    ]
}

struct HomeDemoApp_Preview: PreviewProvider {
    static var previews: some View {
        HomeDemoApp()
    }
}
