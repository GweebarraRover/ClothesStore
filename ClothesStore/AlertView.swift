//
//  AlertView.swift
//  ClothesStore
//
//  Created by Keelin Devenney on 08/12/2016.
//  Copyright © 2016 KeelinDevenney. All rights reserved.
//

import Foundation
import UIKit

func alertAdded(to: String) {
    showAlert(title: "Product added", message: "This product has been added to your \(to).")
}

func alertRemoved(from: String) {
    showAlert(title: "Product removed", message: "This product has been removed from your \(from).")
}

func showAlert(title: String, message: String) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
    getTopViewController().present(alert, animated: true, completion: nil)
}

func getTopViewController() -> UIViewController {
    var topViewController = UIApplication.shared.delegate!.window!!.rootViewController!
    while (topViewController.presentedViewController != nil) {
        topViewController = topViewController.presentedViewController!
    }
    return topViewController
}
