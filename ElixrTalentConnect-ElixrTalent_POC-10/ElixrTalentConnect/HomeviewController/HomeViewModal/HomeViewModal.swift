//
//  HomeViewModal.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 21/01/24.
//

import Foundation

/// JobViewModal - Act as a Viewmodel for MVVM unit in the Homepage.
final class JobViewModel{
    var  jobDetails :[Jobs] = []
    var mainDataSource :[Jobs] = []
    var filteredJobs:[Jobs] = []
    
    /// get job list from api
    /// - Parameter completion: completion return true or false
    func getJobsList(completion: @escaping (Bool) -> ()) {
        APIManager.shared.fetchJobs { [self] response in
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
    
    /// Funtion to reset the filteredJobs when there is no search criteria applied.
    func resetSearch(){
        filteredJobs = jobDetails
    }
    
    /// filtereData- Main Filter Logic based on job Title.
    /// - Parameter searchTerm: searchTerm: type- String which represents the user input.
    func filteredData(with searchTerm :String?){
        guard let searchTerm = searchTerm,!searchTerm.isEmpty else {
            filteredJobs = jobDetails
            return
        }
        filteredJobs = jobDetails.filter{job in return job.title.lowercased().contains(searchTerm.lowercased()  )
            
        }
    }
}
