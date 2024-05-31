//
//  Path.swift
//  N_Voice_App
//
//  Created by Yoon Ro on 2024-05-30.
//

import Foundation

class PathModel: ObservableObject {
    @Published var paths: [PathType]
    
    init(paths: [PathType] = []) {
        self.paths = paths
    }
}
