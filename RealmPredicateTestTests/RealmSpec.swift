//
//  RealmSpec.swift
//  RealmPredicateTestTests
//
//  Created by Ramon Honório on 24/10/18.
//  Copyright © 2018 Ramon Honório. All rights reserved.
//

import Quick
import Nimble
import RealmSwift
@testable import RealmPredicateTest

class RealmSpec: QuickSpec {
    let realm = try! Realm()
    
    override func setUp() {
        super.setUp()
    }
    
    override func spec() {
        
        describe("realm") {
            
            it("should retrieve my objects correctly") {
                
                // Adds foos into realm
                let foos = self.createFoos()
                try! self.realm.write {
                    self.realm.add(foos)
                }
                
                // Tries to retrieve filtering by array attribute's size
                let results = self.realm.objects(Foo.self)
                    .filter("bars[SIZE] == 0")
                
                expect(results.count).to(equal(2))
            }
            
        }
        
    }
}

extension RealmSpec {
    
    func createBars() -> [Bar] {
        var bars: [Bar] = []
        
        for i in 1...5 {
            bars.append(Bar(text: "bar-\(i)"))
        }
        
        return bars
    }
    
    func createFoos() -> [Foo] {
        var foos: [Foo] = []
        
        for i in 1...3 {
            let foo = Foo(text: "foo.\(i)", bars: createBars())
            foos.append(foo)
        }
        
        for i in 4...6 {
            let foo = Foo(text: "foo.\(i)", bars: [])
            foos.append(foo)
        }
        
        return foos
    }
    
}
