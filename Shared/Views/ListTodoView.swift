//
//  ListTodoView.swift
//  todoApp
//
//  Created by yurai on 2022/04/29.
//

import Foundation
import SwiftUI
struct ListTodoView: View {
    let updatedAt:String
    let title:String
    var body: some View {
        VStack(alignment: .leading) {
            Text(updatedAt)
                .font(.caption)
            Text(title)
                .font(.body)
                .fontWeight(.semibold)
        }
    }
}
