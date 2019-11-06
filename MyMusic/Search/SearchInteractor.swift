//
//  SearchInteractor.swift
//  MyMusic
//
//  Created by Aleksey on 07/10/2019.
//  Copyright (c) 2019 Aleksey. All rights reserved.
//

import UIKit

protocol SearchBusinessLogic {
  func makeRequest(request: Search.Model.Request.RequestType)
}

class SearchInteractor: SearchBusinessLogic {

    var networkService = NetworkService()
  var presenter: SearchPresentationLogic?
  var service: SearchService?
  
  func makeRequest(request: Search.Model.Request.RequestType) {
    if service == nil {
      service = SearchService()
    }
    
    switch request {
    case .getTracks(let searchTerm):
        print("interactor .getTrack")
        presenter?.presentData(response: Search.Model.Response.ResponseType.presentFooterView)
        networkService.fetchTracks(searchText: searchTerm) { [weak self ](searchResponse) in
            self?.presenter?.presentData(response: Search.Model.Response.ResponseType.presentTracks(searchResponse: searchResponse))
        }
    }
  }
  
}
