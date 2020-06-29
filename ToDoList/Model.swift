//
//  Model.swift
//  ToDoList
//
//  Created by 12dot on 17.11.2019.
//  Copyright © 2019 12dot. All rights reserved.
//

import Foundation
import UIKit


var ToDoThings: [Todo] {
    set {
        UserDefaults.standard.set(newValue, forKey: "ToDoDataKey")
        UserDefaults.standard.synchronize()
    }
    get {
        if let array = UserDefaults.standard.array(forKey: "ToDoDataKey") as? [[String:Any]]{
            return array
        } else {
            return []
        }
    }
}

typealias Todo = [String:Any]


/*
func trueCount() -> Int {
    return ToDoThings.reduce(0, {
        acc, todo in
        ((todo["isCompleted"] as! Bool) ?
                acc + 1 : acc) as Int;
    })
}


func falseCount() -> Int {
    return ToDoThings.reduce(0, {
        acc, todo in
        ((todo["isCompleted"] as! Bool) ?
                acc : acc + 1) as Int;
    })
}
*/

func uncompletedArray()-> [Todo] {
    return ToDoThings.filter{todo in !(todo["isCompleted"] as! Bool)}
}



func completedArray() -> [Todo]{
    return ToDoThings.filter{todo in (todo["isCompleted"] as! Bool)}
}

        
func moveItem(fromIndex: Int , toIndex : Int){
            let from = ToDoThings[fromIndex]
           ToDoThings.remove(at: fromIndex)
           ToDoThings.insert(from, at: toIndex)
}

    //"Написать текст", "Записать трек", "Разорвать лица"]

func addItem(nameItem: String, isCompleted: Bool = false){
    ToDoThings.append(["Name":nameItem, "isCompleted":false])
}

func removeItem(at index : Int){
    ToDoThings.remove(at: index)
}

func changeState(at item : Int) -> Bool{
    ToDoThings[item]["isCompleted"] = !(ToDoThings[item]["isCompleted"] as! Bool)
    return ToDoThings[item]["isCompleted"] as! Bool
}


