//
//  SettingsView.swift
//  Fructus
//
//  Created by Eric Burrell on 10/3/22.
//

import SwiftUI

struct SettingsView: View {
    //MARK: - PROPERTIES
    
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isOnboarding") var isOnboarding: Bool = false
    //@State var restartChosen: Bool = false
    
    
    //MARK: - BODY
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // MARK: - SECTION 1
                    GroupBox(
                        content: {
                            Divider().padding(.vertical, 4)
                            HStack {
                                Image("logo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(9)
                                Text("Most fruits are naturally low in fat, sodium, and calories. None have cholesterol. Fruits are sources of many essential nutrients, including potassium, dietary fiber, vitamins, and much more.")
                                    .font(.footnote)
                            }
                        },
                        label: {
                            SettingsLabelView(labelText: "Fructus", labelImage: "info.circle")
                        }
                    )
                    
                    // MARK: - SECTION 2
                    GroupBox(
                        content: {
                            Text("If you wish, you can restart the application by toggling the switch in this box. That way it starts the onboarding process and you will see the welcome screen again.")
                                .padding(.vertical, 8)
                                .frame(minHeight: 60)
                                .layoutPriority(1)
                                .font(.footnote)
                                .multilineTextAlignment(.leading)
                            
                            Toggle(isOn: $isOnboarding) {
                                //This ternary operator works as intended. When using an IF statement with isOnboarding as the conditional, settings view disappears upon clicking the toggle
                                isOnboarding ?
                                Text("Restarted".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundColor(.green) :
                                Text("Restart".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundColor(.secondary)
                                //Text("Restart".uppercased()).bold().foregroundColor(.green) Debugging - ignore
                            }
                            .padding()
                            .background() {
                                Color(UIColor.tertiarySystemBackground)
                                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                            }
                        },
                        label: {
                            SettingsLabelView(labelText: "Customization", labelImage: "paintbrush")
                        })
                    
                    // MARK: - SECTION 3
                    GroupBox(
                        content: {
                            SettingsRowView(name: "Developer", content: "Eric")
                            SettingsRowView(name: "Designer", content: "Robert Petras")
                            SettingsRowView(name: "Compatibility", content: "iOS 13+")
                            SettingsRowView(name: "Website", linkLabel: "SwiftUI Masterclass", linkDestination: "swiftuimasterclass.com")
                            SettingsRowView(name: "Twitter", linkLabel: "@RobertPetras", linkDestination: "twitter.com/robertpetras")
                            SettingsRowView(name: "SwiftUI", content: "2.0")
                            SettingsRowView(name: "Version", content: "1.1.0")
                        },
                        label: {
                            SettingsLabelView(labelText: "Application", labelImage: "apps.iphone")
                        })
                    
                } //: VSTACK
                .navigationBarTitle("Settings", displayMode: .large)
                .navigationBarItems(trailing: Button(
                    action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "xmark")
                    })
                .padding()
            } //: SCROLL
        } //: NAVIGATION
    }
}

//MARK: - PREVIEW
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 11")
    }
}
