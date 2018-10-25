//
//  Foo.swift
//  RealmPredicateTest
//
//  Created by Ramon Honório on 24/10/18.
//  Copyright © 2018 Ramon Honório. All rights reserved.
//

import RealmSwift

class Foo: Object {
    
    @objc dynamic var text: String = ""
    let bars = List<Bar>()
    
    public convenience init(text: String, bars: [Bar]) {
        self.init()
        self.text = text
        self.bars.append(objectsIn: bars)
    }
    
}

class Bar: Object {
    @objc dynamic var text: String = ""
    
    convenience init(text: String) {
        self.init()
        self.text = text
    }
}
