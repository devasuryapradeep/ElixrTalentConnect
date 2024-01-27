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
    
    /// formattingFunction_ this functtion is to setup the formatHelper() and using that value.
    /// - Parameter _dateString: A varaible of type string.
    /// - Returns: String
    func formattingFunction(_dateString:String?)->String?{
        guard let _dateString = _dateString,
              let formattedDate = formatHelper(_dateString: _dateString) else {
            return nil
        }
        return formattedDate
    }
    
    /// formatHelper
    /// - Parameter _dateString: A varaible of type string
    /// - Returns: String value that sets a specific format for the date.
    private func formatHelper(_dateString:String)->String?{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
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
            
            return ("\(day)\(dateSuffix(_day: day))\(month)\(year)")
        }
        return String()
    }
    
    /// dateSuffix
    /// - Parameter _day: This parameter of value string is passed to the function inorder to add suffix to the day .
    /// - Returns: String type value.
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
}
