//
//  HomeDataModal.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 21/01/24.
//

import Foundation

struct JobsResponse : Codable {
    let jobs : [Jobs]
}

struct Jobs : Codable {
    let Id : String
    let title : String
    let department : String
    let postedDate : String
    let deadlineDate : String
    let description : String
    let responsibilities : String
    let requirements : String
    let location : String
    let salary : String
    let status : String
}




