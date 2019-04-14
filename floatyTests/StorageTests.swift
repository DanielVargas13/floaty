//
//  StorageTests.swift
//  FloatyTests
//
//  Created by James Zaghini on 3/4/19.
//  Copyright © 2019 James Zaghini. All rights reserved.
//

import XCTest
@testable import Floaty

private struct Thing: Codable {
    var name = "thing"
}

class StorageTests: XCTestCase {

    func testClear() {
        let thing = Thing()
        let storeFilename = "test"
        Storage.store(thing, as: storeFilename)
        let retrievedThing = Storage.retrieve(storeFilename, as: Thing.self)
        XCTAssertNotNil(retrievedThing)
        Storage.remove(storeFilename)
        let retrievedThing2 = Storage.retrieve(storeFilename, as: Thing.self)
        XCTAssertNil(retrievedThing2)
    }

}
