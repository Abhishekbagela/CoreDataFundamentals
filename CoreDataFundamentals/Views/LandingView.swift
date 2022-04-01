//
//  LandingView.swift
//  CoreDataFundamentals
//
//  Created by Abhishek Bagela on 02/04/22.
//

import SwiftUI

struct LandingView: View {
    //    private var options: Array<Constant> = Array<Constant>()
    
    @State private var selectedModule: ModuleName = .FRUITS
    @State private var navigate: Bool = false
    
    var body: some View {
        NavigationView {
            NavigationLink(isActive: $navigate) {
                if (selectedModule == .FRUITS) {
                    FruitsHomeView()
                } else if (selectedModule == .ELECTRONICS) {
                    ElectronicsHomeView()
                }
            } label: {
                VStack {
                    HStack {
                        Text("Fruits")
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                    .contentShape(Rectangle())
                    .padding(.horizontal)
                    .onTapGesture {
                        self.selectedModule = .FRUITS
                        self.navigate = true
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("Electronics")
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                    .contentShape(Rectangle())
                    .padding(.horizontal)
                    .onTapGesture {
                        self.selectedModule = .ELECTRONICS
                        self.navigate = true
                    }
                    
                    Divider()
                    
                    Spacer()
                }
                .navigationTitle(Text("Choose Module"))
            }
        }
    }
    
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}

enum ModuleName {
    case FRUITS, ELECTRONICS
}
