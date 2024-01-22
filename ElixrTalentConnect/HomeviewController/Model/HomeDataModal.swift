//
//  HomeDataModal.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 21/01/24.
//

import Foundation
struct JobsResponse : Codable {
    let jobs : [Jobs]?

    enum CodingKeys: String, CodingKey {

        case jobs = "jobs"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        jobs = try values.decodeIfPresent([Jobs].self, forKey: .jobs)
    }

}

struct Jobs : Codable {
    let title : String?
    let department : String?
    let postedDate : String?
    let deadlineDate : String?
    let description : String?
    let responsibilities : String?
    let requirements : String?
    let location : String?
    let salary : String?
    let status : String?

    enum CodingKeys: String, CodingKey {

        case title = "title"
        case department = "department"
        case postedDate = "postedDate"
        case deadlineDate = "deadlineDate"
        case description = "description"
        case responsibilities = "responsibilities"
        case requirements = "requirements"
        case location = "location"
        case salary = "salary"
        case status = "status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        department = try values.decodeIfPresent(String.self, forKey: .department)
        postedDate = try values.decodeIfPresent(String.self, forKey: .postedDate)
        deadlineDate = try values.decodeIfPresent(String.self, forKey: .deadlineDate)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        responsibilities = try values.decodeIfPresent(String.self, forKey: .responsibilities)
        requirements = try values.decodeIfPresent(String.self, forKey: .requirements)
        location = try values.decodeIfPresent(String.self, forKey: .location)
        salary = try values.decodeIfPresent(String.self, forKey: .salary)
        status = try values.decodeIfPresent(String.self, forKey: .status)
    }
}




