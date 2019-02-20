//
//  Thesis.swift
//  Academic Plagiarizm
//
//  Created by AHG on 2/20/19.
//  Copyright © 2019 Microcis. All rights reserved.
//

import Foundation

struct Thesis {
    var title: String?
    var id: String?
    var university: String?
    var faculty: String?
    var year: String?
    var isReported: Bool = false;
    
    init(_ dic: [String: Any]) {
        self.title = dic["title"] as? String;
        self.id = dic["id"] as? String;
        self.university = dic["university"] as? String;
        self.faculty = dic["faculty"] as? String;
        self.year = dic["year"] as? String;
        self.isReported = dic["isReported"] as? Bool ?? false;
    }
}
