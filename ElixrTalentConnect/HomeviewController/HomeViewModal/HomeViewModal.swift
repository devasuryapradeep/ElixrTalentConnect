//
//  HomeViewModal.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 21/01/24.
//

import Foundation

/// JobViewModal - Act as a Viewmodel for MVVM unit in the Homepage.
final class JobViewModel{
    
    /// Variable declarations
    var  jobDetails :[Jobs] = []
    var filteredJobs:[Jobs] = []
    var idInstance : String?
    
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
    func formattingFunction(_dateString:String?)->String?{
        guard let _dateString = _dateString,
              let formattedDate = formatHelper(_dateString: _dateString) else {
            return nil
        }
        return formattedDate
    }
    private func formatHelper(_dateString:String)->String?{
        let dateFormatter = DateFormatter()
        if let date = dateFormatter.date(from: _dateString){
            let dayFormatter = DateFormatter()
            dayFormatter.dateFormat = "d"
            let day = dayFormatter.string(from: date)
              
            let  monthFormatter = DateFormatter()
            monthFormatter.dateFormat = "MMM"
            let  month = monthFormatter.string(from: date)
             
            let yearFormattter  = DateFormatter()
            yearFormattter.dateFormat = "YYYY"
            let year  = yearFormattter.string(from: date)
            print("\(day)\(dateSuffix(_day: day))\(month)\(year)")
            return ("\(day)\(dateSuffix(_day: day))\(month)\(year)")
        }
        return String()
    }
    private func dateSuffix(_day:String)->String{
        let dayInt = Int(_day) ?? 0
        switch dayInt{
        case 1,21,31:return "st"
        case 2,22:return "nd"
        case 3,23:return"rd"
        default :
            return "th"
        }
    }
    
    ///favouriteButtonAction -sets the value in the  userefault  that determines whether the job is selected as favourite or not .
    func favouriteButtonAction(){
        guard let uniqueJobId = idInstance else{
            return
        }
        let isFavourite = UserDefaults.standard.bool(forKey: uniqueJobId)
        UserDefaults.standard.set(!isFavourite, forKey: uniqueJobId)
    }
    
    /// getInfoCell - This method is responsible for deciding array on the basis of the functionlity.
    /// - Parameters:
    ///   - index: This indicates the  number of values in the array.
    ///   - isSearching: isSearching is the argument given for the attribute is
    /// - Returns: Bool value that determines whether the the display table should be presented from the filtered array or the job details  array.
    func getInfoCell(at index : Int, isSearching :Bool)->Jobs{
        if isSearching{
            return filteredJobs [index]
        } else {
         return jobDetails [index]
        }
    }
}
