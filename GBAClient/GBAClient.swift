//
//  GBAClient.swift
//  GBAClient
//
//  Created by Yuto Akiba on 2018/11/10.
//  Copyright © 2018 Yuto Akiba. All rights reserved.
//

import Foundation

public final class GBAClient {
    public static let shared = GBAClient(session: URLSession.shared)
    
    private let baseURL = "https://www.googleapis.com/books/v1/volumes"
    private let urlSession: URLSession

    public init(session: URLSession) {
        self.urlSession = session
    }

    public func fetch(_ keyword: String, completion: ((Result) -> Void)?) {
        guard let urlStr = urlEncode("\(baseURL)?q=\(keyword)") else {
            completion?(.failure(GBAClientError.urlEncodingError))
            return
        }
        guard let url = URL(string: urlStr) else {
            completion?(.failure(GBAClientError.urlEncodingError))
            return
        }

        let task = urlSession.dataTask(with: url) { data, res, error in
            if let error = error {
                completion?(.failure(error))
                return
            }

            guard let data = data else {
                completion?(.failure(GBAClientError.dataNotFound))
                return
            }

            do {
                let response = try JSONDecoder().decode(Response.self, from: data)
                completion?(.success(response))
            } catch {
                completion?(.failure(error))
            }
        }
        task.resume()
    }

    public func fetch(search: QueryPrefix, keyword: String, completion: ((Result) -> Void)?) {
        fetch("\(search.rawValue):\(keyword)", completion: completion)
    }

    private func urlEncode(_ string: String) -> String? {
        return string.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)
    }
}

public enum Result {
    case success(Response)
    case failure(Error)
}

public enum GBAClientError: Error {
    case dataNotFound
    case urlEncodingError
}

public enum QueryPrefix: String {
    case title     = "intitle"
    case author    = "inauthor"
    case publisher = "inpublisher"
    case subject   = "subject"
    case isbn      = "isbn"
    case lccn      = "lccn"
    case oclc      = "oclc"
}
