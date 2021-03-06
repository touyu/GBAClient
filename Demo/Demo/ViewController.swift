//
//  ViewController.swift
//  Demo
//
//  Created by Yuto Akiba on 2018/11/10.
//  Copyright © 2018 Yuto Akiba. All rights reserved.
//

import UIKit
import GBAClient

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        GBAClient.shared.fetch("東野圭吾") { result in
            switch result {
            case .success(let res):
                print(res.items[0].volumeInfo.title)
                print(res.items[0].volumeInfo.authors!)
            case .failure(let error):
                print(error)
            }
        }

        GBAClient.shared.fetch(search: .author, keyword: "東野圭吾") { result in
            switch result {
            case .success(let res):
                print(res.items[0].volumeInfo.title)
                print(res.items[0].volumeInfo.authors!)
            case .failure(let error):
                print(error)
            }
        }
    }

}

