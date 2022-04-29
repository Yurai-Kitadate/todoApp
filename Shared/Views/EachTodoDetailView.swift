//
//  EachTodoView.swift
//  todoApp
//
//  Created by yurai on 2022/04/29.
//

import Foundation
import SwiftUI
struct EachTodoDetailView: View {
    let updatedAt:String
    let title:String
    let about:String
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(updatedAt)
                    .font(.caption)
                Text(title)
                    .font(.body)
                    .fontWeight(.semibold)
                Divider().background(Color.orange)
                Text(about)
                Spacer()
            }
            Spacer()
        }.padding()
    }
}
