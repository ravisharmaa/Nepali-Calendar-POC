//
//  Reader.swift
//  CalendarPOC
//
//  Created by Ravi Bastola on 4/13/20.
//  Copyright © 2020 Ravi Bastola. All rights reserved.
//

import Foundation

enum FileExtensions: String {
    case json = "json"
    case text = "txt"
}

protocol Readable {
    
    func read<T: Codable>(from path: String, fileExtension: FileExtensions, responsible: T.Type, completion: @escaping((Result<T, Error>) -> ()))
}

struct Reader: Readable {
    
    static let singleton = Reader()
    
    private init () {}
        
    func read<T: Codable>(from path: String, fileExtension: FileExtensions, responsible: T.Type, completion: @escaping ((Result<T, Error>) -> ())) {
        
        let file = Bundle.main.path(forResource: path, ofType: fileExtension.rawValue)
        
        do {
            let file = try String(contentsOfFile: file!).data(using: .utf8)
            let data = try JSONDecoder().decode(T.self, from: file!)
            completion(.success(data))
        } catch {
            completion(.failure(error))
        }
    }
    
    
}
