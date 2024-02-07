//
//  ElixrTalentConnectTests.swift
//  ElixrTalentConnectTests
//
//  Created by Devasurya on 10/01/24.
//

import XCTest
@testable import ElixrTalentConnect

final class ElixrTalentConnectTests: XCTestCase {
    
    var loginViewModel :LoginViewModel?
    override func setUpWithError() throws {
        var  loginViewmodel :  LoginViewModel?
    }

    override func tearDownWithError() throws {
        loginViewModel = nil
    }

//    func testUserValidationOnTrue() throws {
//          let userModelInstance = UserModel(userName: "valid@gmail.com", passwordValue: "123qweasd")
//            let result = loginViewModel?.validateCredentials(model: userModelInstance)
//        XCTAssertTrue(result?.isValid,"Validation should pass for  valid credentials")
//        XCTAssertNil(result?.message,"Message should be nil for valid credentials")
//
//    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
