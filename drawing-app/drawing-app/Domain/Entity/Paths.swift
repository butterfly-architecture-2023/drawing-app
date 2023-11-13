//
//  Paths.swift
//  drawing-app
//
//  Created by Jihee hwang on 2023/11/12.
//

import Foundation

final class Paths {
    
    private var paths: [CGPoint]
    
    init() {
        self.paths = []
    }
    
    func count() -> Int {
        paths.count
    }
    
    func getPaths() -> [CGPoint] {
        paths
    }
    
    func resetPaths() {
        paths.removeAll()
    }
    
    func addPaths(_ point: CGPoint) {
        paths.append(point)
    }
    
    func insertPaths(point: CGPoint, at: Int) {
        paths.insert(point, at: at)
    }

}
