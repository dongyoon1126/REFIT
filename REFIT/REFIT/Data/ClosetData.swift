//
//  ClosetData.swift
//  REFIT
//
//  Created by 김동윤 on 2022/11/21.
//

import Foundation


class ClosetData {
    static let shared = ClosetData()
    
    //allCloset
    var allClosetData = [[String: Any]]()
    
    private init() {}
}

func getAllClosetData(completion: @escaping () -> Void) {
    FirebaseFirestoreManger.db.collection("Closet").whereField("userID", isEqualTo: FirebaseAuthManager.userID).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    ClosetData.shared.allClosetData.append(document.data())
                }
            }
        completion()
    }
}
