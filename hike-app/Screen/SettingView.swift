//
//  SettingView.swift
//  hike-app
//
//  Created by k21047kk on 2024/12/31.
//

import SwiftUI

struct ListItem {
    var label: String
    var icon: String
    var content: String? = nil
    var color: Color
    var linkLabel: String? = nil
    var linkDestination: String? = nil
}

let ListItemData: [ListItem] = [
    ListItem(label: "Application", icon: "apps.iphone", content: "HIKE", color: .blue),
    ListItem(label: "Compatibility", icon: "info.circle", content: "iOS, iPadOS", color: .red),
    ListItem(label: "Technology", icon: "swift", content: "Swift", color: .orange),
    ListItem(label: "Version", icon: "gear", content: "1.0", color: .purple),
    ListItem(label: "Developer", icon: "ellipsis.curlybraces", content: "John Doe", color: .mint),
    ListItem(label: "Designer", icon: "paintpalette", content: "Robert Petras", color: .pink),
    ListItem(label: "Website", icon: "globe", content: nil, color: .indigo, linkLabel: "kurahashi.me", linkDestination: "https://kurahashi.me")
]

struct SettingView: View {
    var body: some View {
        List {
            
        // MARK: - SECTION: HEADER
            Section {
                HStack {
                    Spacer()
                    
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80,weight: .black))
                    
                    VStack(spacing: -10) {
                        Text("Hike")
                            .font(.system(size: 66,weight: .black))
                        Text("Editors' Choice")
                    }
                    
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80,weight: .black))
                    
                    Spacer()
                }
                .foregroundStyle(
                    LinearGradient(colors: [
                        .customGreenLight,
                        .customGreenMedium,
                        .customGreenDark
                    ], startPoint: .top, endPoint: .bottom)
                )
                .padding(.top,8)
                
                VStack(spacing: 8) {
                    Text("Where can you find \nperfect tracks?")
                        .font(.title2)
                        .fontWeight(.heavy)
                    
                    Text("The hike which looks gorgeous in photos but is even better once you are actually there. The hike that you hope to do again someday. \nFind the best day hikes in the app.")
                        .font(.footnote)
                        .italic()
                    
                    Text("Dust off the boots! It's time for a walk")
                        .fontWeight(.heavy)
                        .foregroundColor(.customGreenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom,16)
                .frame(maxWidth: .infinity)
            }
            .listRowSeparator(.hidden)
                
            
        // MARK: - SECTION: ICONS
            
        //  MARK: - SECTION: ABOUT
            Section(
                header: Text("ABOUT THE APP"),
                footer: HStack{
                    Spacer()
                    Text("Copyright © All Rights Reserved")
                    Spacer()
                }
                    .padding(.vertical,8)
            ) {
                
                ForEach(ListItemData, id: \.label) { item in
                    CustomListRowView(
                        rowLabel: item.label,
                        rowIcon: item.icon,
                        rowContent: item.content,
                        rowColor: item.color,
                        rowLinkLabel: item.linkLabel,
                        rowLinkDestination: item.linkDestination
                    )
                }

            }
            
            
        } //: LIST
    }
}

#Preview {
    SettingView()
}
