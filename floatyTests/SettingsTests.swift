//
//  SettingsTests.swift
//  FloatyTests
//
//  Created by James Zaghini on 16/12/18.
//  Copyright © 2018 James Zaghini. All rights reserved.
//

import XCTest
@testable import Floaty

class SettingsTests: XCTestCase {

    var disposable: Disposable?

    func testChangingHomepageURLSaves() {
        var settings = Settings.load()
        let urlString = "http://www.duckduckgo.com"
        settings.homepageURL = urlString
        let settings2 = Settings.load()
        XCTAssertEqual(settings2.homepageURL, urlString)
    }

    func testChangingWindowOpacityFiresObserver() {

        var settings = Settings.load()
        let newOpacity: CGFloat = 0.05

        let promise = expectation(description: "Observer will fire on opacity change")

        disposable = settings.windowOpacityObservable.observe { opacity, _ in
            guard opacity == newOpacity else { return }
            promise.fulfill()
        }

        settings.windowOpacity = newOpacity

        waitForExpectations(timeout: 3) { _ in
            XCTAssertEqual(settings.windowOpacity, newOpacity, accuracy: CGFloat.ulpOfOne)
        }
    }
}
