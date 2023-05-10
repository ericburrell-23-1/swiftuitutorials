//
//  SettingsInfoLineView.swift
//  Fructus
//
//  Created by Eric Burrell on 10/4/22.
//

import SwiftUI

struct SettingsRowView: View {
    //MARK: - PROPERTIES
    
    var name: String
    var content: String?
    var linkLabel: String?
    var linkDestination: String?
    
    //MARK: - BODY
    var body: some View {
        VStack {
            Divider().padding(.vertical, 4)
            
            HStack {
                Text(name).foregroundColor(.gray)
                Spacer()
                //This if statement returns the content if present, a link if no content, or an empty view if both are nil
                if (content != nil) {
                    Text(content!)
                } else if (linkLabel != nil && linkDestination != nil) {
                    Link(destination:
                            (URL(string: "https://\(linkDestination!)")!)
                    )
                    {
                        HStack {
                            Text(linkLabel!)
                            
                            Image(systemName: "arrow.up.right.square")
                                .foregroundColor(.pink)
                        }
                    } //: LINK
                }
                else {
                    EmptyView()
                } //: IF - ELSE
            }
        } //: HSTACK
    }
}

//MARK: - PREVIEW
struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SettingsRowView(name: "Developer", content: "Eric")
                .previewLayout(.fixed(width: 375, height: 60))
            .padding()
            SettingsRowView(name: "Website", linkLabel: "SwiftUI Masterclass", linkDestination: "swiftuimasterclass.com")
                .preferredColorScheme(.dark)
                .previewLayout(.fixed(width: 375, height: 60))
                .padding()
        }
    }
}
