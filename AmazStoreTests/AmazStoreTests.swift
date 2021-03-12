//
//  AmazStoreTests.swift
//  AmazStoreTests
//
//  Created by Aadil Ali on 3/11/21.
//

import XCTest
@testable import AmazStore

class AmazStoreTests: XCTestCase {

    var sessionURLTest : URLSession! = URLSession(configuration: .default)
     
    override class func setUp() {
        super.setUp()
//        sessionURLTest = URLSession(configuration: .default)
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // Asynchronous test: success fast, failure slow
    func testValidCallToStoreDataGetsHTTPStatusCode200() {
      // given
      let url =
        URL(string: AppURLs.BASE_URL)
      // 1
      let promise = expectation(description: "Status code: 200")

      // when
      let dataTask = sessionURLTest.dataTask(with: url!) { data, response, error in
        // then
        if let error = error {
          XCTFail("Error: \(error.localizedDescription)")
          return
        } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
          if statusCode == 200 {
            // 2
            promise.fulfill()
          } else {
            XCTFail("Status code: \(statusCode)")
          }
        }
      }
      dataTask.resume()
      // 3
      wait(for: [promise], timeout: 10)
    }
    
    func testStoreData()  {
        let itemName = "Pen"
        let itemPrice = "AED 500"
        let itemAdditionDate = "10-10-2021"
        let itemUID = "aksjdn43234"
        let itemImagesIds = ["sdfs234234wsdfs"]
        let itemImagesURLs = ["http://www.google.com"]
        let itemImagesThumbnailsURLs = ["http://www."]
        
        let storeItem: StoreData? = StoreData.init(itemName: itemName, itemPrice: itemPrice, itemAdditionDate: itemAdditionDate, itemUID: itemUID, itemImagesIds: itemImagesIds, itemThumbnails: itemImagesThumbnailsURLs, itemImages: itemImagesURLs)
        
        XCTAssertNotNil(storeItem != nil, "storeItem is not nil")
    }
    
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
