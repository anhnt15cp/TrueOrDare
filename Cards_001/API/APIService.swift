//
//  APIService.swift
//  Cards_001
//
//  Created by Tuấn Anh on 07/01/2023.
//

import Foundation

class APIService {
    
     static let shared = APIService()
    
     func getDataNewYear(completed: @escaping (([ListItemTet]?)->Void)) {
         DispatchQueue.global(qos: .userInteractive).async {
             guard let path = Bundle.main.path(forResource: "tet", ofType: "json") else {
                 return
             }
             let url = URL(fileURLWithPath: path)
             do {
                 let json = try Data(contentsOf: url)
                 let result: ItemTet =  try! JSONDecoder().decode(ItemTet.self, from: json)
                 completed(result.tet)
                 
             } catch  {
                 completed(nil)             }
         }
    }
    
    func getDataDrink(completed: @escaping (([ListItemNhau]?)->Void)) {
        DispatchQueue.global(qos: .userInteractive).async {
            guard let path = Bundle.main.path(forResource: "nhau", ofType: "json") else {
                return
            }
            let url = URL(fileURLWithPath: path)
            do {
                let json = try Data(contentsOf: url)
                let result: ItemNhau =  try! JSONDecoder().decode(ItemNhau.self, from: json)
                completed(result.nhau)
                
            } catch  {
                completed(nil)
            }
        }
   }
    
    func gameEasy(completed: @escaping (([ListItemEasy]?)->Void)) {
        DispatchQueue.global(qos: .userInteractive).async {
            guard let path = Bundle.main.path(forResource: "easy", ofType: "json") else {
                return
            }
            let url = URL(fileURLWithPath: path)
            do {
                let json = try Data(contentsOf: url)
                let result: StartUp =  try! JSONDecoder().decode(StartUp.self, from: json)
                completed(result.easy)
                
            } catch  {
                completed(nil)            }
        }
   }
    
    func gameMedium(completed: @escaping (([ListItemMedium]?)->Void)) {
        DispatchQueue.global(qos: .userInteractive).async {
            guard let path = Bundle.main.path(forResource: "medium", ofType: "json") else {
                return
            }
            let url = URL(fileURLWithPath: path)
            do {
                let json = try Data(contentsOf: url)
                let result: Acceleration =  try! JSONDecoder().decode(Acceleration.self, from: json)
                completed(result.medium)
                
            } catch  {
                completed(nil)            }
        }
   }
    
    func gameHard(completed: @escaping (([ListItemHard]?)->Void)) {
        DispatchQueue.global(qos: .userInteractive).async {
            guard let path = Bundle.main.path(forResource: "hard", ofType: "json") else {
                return
            }
            let url = URL(fileURLWithPath: path)
            do {
                let json = try Data(contentsOf: url)
                let result: Finish =  try! JSONDecoder().decode(Finish.self, from: json)
                completed(result.hard)
            } catch  {
                completed(nil)
            }
        }
   }
    
}

