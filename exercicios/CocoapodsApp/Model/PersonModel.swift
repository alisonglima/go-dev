//
//  Person.swift
//  CocoapodsApp
//
//  Created by FL00022 on 21/03/22.
//

import Foundation
import UIKit

// MARK: - PeopleList
struct Person: Codable {
    let id: Int
    let name: String
    let photo: String
    let company: Company
}

// MARK: - Company
struct Company: Codable {
    let name: String
}

typealias PeopleList = [Person]
