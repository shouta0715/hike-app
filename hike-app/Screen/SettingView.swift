//
//  SettingView.swift
//  hike-app
//
//  Created by k21047kk on 2024/12/31.
//

import SwiftUI

private struct ListItem {
    var label: String
    var icon: String
    var content: String? = nil
    var color: Color
    var linkLabel: String? = nil
    var linkDestination: String? = nil
}

private let ListItemData: [ListItem] = [
    ListItem(label: "Application", icon: "apps.iphone", content: "HIKE", color: .blue),
    ListItem(label: "Compatibility", icon: "info.circle", content: "iOS, iPadOS", color: .red),
    ListItem(label: "Technology", icon: "swift", content: "Swift", color: .orange),
    ListItem(label: "Version", icon: "gear", content: "1.0", color: .purple),
    ListItem(label: "Developer", icon: "ellipsis.curlybraces", content: "John Doe", color: .mint),
    ListItem(label: "Designer", icon: "paintpalette", content: "Robert Petras", color: .pink),
    ListItem(label: "Website", icon: "globe", content: nil, color: .indigo, linkLabel: "kurahashi.me", linkDestination: "https://kurahashi.me")
]

private struct AlternateAppIcon {
    var icon: String
    var preview: String
}
    

struct SettingView: View {
    
    // MARK: - PROPARTIES
    private let alternateAppIcons:[AlternateAppIcon] = [
        AlternateAppIcon(
            icon: "AppIcon-MagnifyingGlass",
            preview: "AppIcon-MagnifyingGlass-Preview"
        ),
        AlternateAppIcon(
            icon: "AppIcon-Map",
            preview: "AppIcon-Map-Preview"
        ),
        AlternateAppIcon(
            icon: "AppIcon-Mushroom",
            preview: "AppIcon-Mushroom-Preview"
        ),
        AlternateAppIcon(
            icon: "AppIcon-Camera",
            preview: "AppIcon-Camera-Preview"
        ),
        AlternateAppIcon(
            icon: "AppIcon-Backpack",
            preview: "AppIcon-Backpack-Preview"
            ),
        AlternateAppIcon(
            icon: "AppIcon-Campfire",
            preview: "AppIcon-Campfire-Preview"
            ),
    ]
    
    
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
                
            
        // MARK: - SECTION: ICON
            
            Section(header: Text("Alternate Icons")) {
                ScrollView(.horizontal,showsIndicators: false){
                    HStack(spacing: 12) {
                        ForEach(alternateAppIcons.indices, id: \.self) { index in
                            let item = alternateAppIcons[index]
                            Button {
                                print("Tapped: \(item.icon)")
                                
                                UIApplication.shared
                                    .setAlternateIconName(item.icon) {error in
                                    if error != nil {
                                        print(
                                            "Failed to change the app icon.\(String(describing: error?.localizedDescription))"
                                        )
                                    } else {
                                        print(
                                            "Succeeded in changing the app icon."
                                        )
                                    }
                                        
                                }
                                
                            } label: {
                                Image(item.preview)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80,height: 80)
                                    .cornerRadius(16)
                            }
                            .buttonStyle(.borderless)
                        }
                    }
                } //: SCROLLVIEW
                .padding(.top,12)
                Text("Choose your favorite app icon from the collection above.")
                    .frame(minWidth: 0,maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .font(.footnote)
                    .padding(.bottom,12)
                    
            }
            .listRowSeparator(.hidden)
            
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
