//
//  EditTodoView.swift
//  todoApp
//
//  Created by yurai on 2022/04/29.
//

import Foundation
import SwiftUI
var EditTodoView:View{
    let todo = Todos(context: moc)
    todo.title = title
    todo.about = about
    todo.updatedAt = getNowClockString()
    title = ""
    about = ""
    try? moc.save()
    
}
