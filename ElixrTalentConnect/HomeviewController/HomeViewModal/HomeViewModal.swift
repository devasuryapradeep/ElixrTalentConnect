//
//  HomeViewModal.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 21/01/24.
//

import Foundation

final class JobViewModal{
    var  jobDetails :[Jobs] = []
    
    /// get job list from api
    /// - Parameter completion: completion return true or false
    func getJobsList(completion: @escaping (Bool) -> ()) {
        APIManager.shared.fetchJobs { response in
            switch response {
            case .success(let tableData):
                print(tableData)
                self.jobDetails = tableData
                completion(true)
            case .failure(let error):
                print(error.localizedDescription)
                completion(false)
            }
        }
    }
}
