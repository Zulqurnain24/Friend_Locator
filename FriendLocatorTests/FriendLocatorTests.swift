//
//  FriendLocatorTests.swift
//  FriendLocatorTests
//
//  Created by Mohammad Zulqurnain on 11/08/2018.
//  Copyright © 2018 Mohammad Zulqurnain. All rights reserved.
//
import Foundation
import XCTest
@testable import FriendLocator

class FriendLocatorTests: XCTestCase {

    func testValidFriend() {
        let friend = Friend(longitude: "95.415437", latitude: "-25.446305", picture: "http://placehold.it/32x32", _id: "5ab8706aee622a5ef85cb2c4", name: "Cook Mckay", email: "cookmckay@xiix.com")
        friend.name = "Cook Mckay"
        
        XCTAssertEqual(friend.name, "Cook Mckay")
        XCTAssertEqual(friend.longitude, "95.415437")
        XCTAssertEqual(friend.latitude, "-25.446305")
        XCTAssertEqual(friend.picture, "http://placehold.it/32x32")
        XCTAssertEqual(friend._id, "5ab8706aee622a5ef85cb2c4")
        XCTAssertEqual(friend.name, "Cook Mckay")
        XCTAssertEqual(friend.email, "cookmckay@xiix.com")
    }
    
    func testValidFriendCell() {
        let friendCell = FriendCell(frame: CGRect(x: 0, y: 0, width: 300, height: 70))
        
         XCTAssertNotEqual(friendCell, nil)
    }
    
    func testValidFriendBrowseView() {
        let friendBrowseView = FriendBrowseView(frame:  CGRect(x: 0, y: 0, width: 300, height: 70))
        
        XCTAssertNotEqual(friendBrowseView, nil)
    }
    
    func testValidFriendCoordinate() {
        let friendCoordinate = FriendCoordinate(name: "friend location", lat: 95.415437, long: -25.446305)
        
       XCTAssertNotEqual(friendCoordinate, nil)
    }
    
    func testValidFriendDetailView() {
        let friendDetailView = FriendDetailView(frame:  CGRect(x: 0, y: 0, width: 300, height: 70))
        
        XCTAssertNotEqual(friendDetailView, nil)
    }

    func testValidColors() {
        XCTAssertEqual(Colors.white, UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0))
        XCTAssertEqual(Colors.lightGray, UIColor(red: 193/255, green: 193/255, blue: 193/255, alpha: 1.0))
        XCTAssertEqual(Colors.blackish, UIColor(red: 0, green: 0, blue: 0, alpha: 1.0))
        XCTAssertEqual(Colors.reddish, UIColor(red: 209/255, green: 102/255, blue: 102/255, alpha: 1.0))
        XCTAssertEqual(Colors.greenish, UIColor(red: 182/255, green: 198/255, blue: 73/255, alpha: 1.0))
        XCTAssertEqual(Colors.clear, UIColor.clear)
    }

    func testValidFonts() {
        XCTAssertEqual(Fonts.heading,UIFont(name: "ChalkboardSE-Bold", size: 24.0)!)
        XCTAssertEqual(Fonts.subheading,UIFont(name: "ChalkboardSE-Regular", size: 18.0)!)
        XCTAssertEqual(Fonts.body,UIFont(name: "ChalkboardSE-Regular", size: 16.0)!)
        XCTAssertEqual(Fonts.button,UIFont(name: "ChalkboardSE-Bold", size: 18.0)!)
        XCTAssertEqual(Fonts.label,UIFont(name: "ChalkboardSE-Regular", size: 18.0)!)
    }
    
    func testPadding() {
        XCTAssertEqual(Padding.standard, 30)
    }
    
    func testScreen() {
        XCTAssertEqual(ScreenDimensions.screenSize, UIScreen.main.bounds)
        XCTAssertEqual(ScreenDimensions.width, ScreenDimensions.screenSize.width)
        XCTAssertEqual(ScreenDimensions.height, ScreenDimensions.screenSize.height)
    }
    
    func testEnpoints() {
        XCTAssertEqual(baseUrl, "http://www.json-generator.com/")
        XCTAssertEqual(Endpoint.friends.rawValue, "api/json/get/cfdlYqzrfS")
    }
    
}
