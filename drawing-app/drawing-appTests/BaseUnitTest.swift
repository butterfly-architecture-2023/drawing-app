//
//  BaseUnitTest.swift
//  drawing-appTests
//
//  Created by Jihee hwang on 2023/11/12.
//

import XCTest
import RxSwift
import RxCocoa
import RxTest

class BaseUnitTests: XCTestCase {
    
    var disposeBag: DisposeBag!
    var scheduler: TestScheduler!
    
    override func setUpWithError() throws {
        disposeBag = DisposeBag()
        scheduler = TestScheduler(initialClock: 0)
    }
    
    override func tearDownWithError() throws {
        disposeBag = nil
        scheduler = nil
    }
    
}

