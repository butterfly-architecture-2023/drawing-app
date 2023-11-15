//
//  BezierPathManager.swift
//  Drawing
//
//  Created by ByungHoon Ann on 2023/11/15.
//

import UIKit

final class BezierPathManager {
    static func archive(_ drawingBezierPath: UIBezierPathProtocol) -> Data? {
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: drawingBezierPath, requiringSecureCoding: false)
            return data
        } catch {
            return nil
        }
    }
    
    static func unarchive(from data: Data) -> UIBezierPathProtocol? {
        do {
            let path = try NSKeyedUnarchiver.unarchivedObject(ofClass: UIBezierPath.self, from: data)
            return path
        } catch {
            return nil
        }
    }
}
