//
//  SceneDelegate.swift
//  DependencyInversionDemo
//
//  Created by Windy on 13/10/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions) {
       
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        window?.makeKeyAndVisible()
        
        let dataProvider = CompanyDataProvider()
//        let dataProvider = MonggoDBProvider()
//        let dataProvider = FirebaseDataProvider()
        let vc = ViewController(dataProvider: dataProvider)
        window?.rootViewController = UINavigationController(rootViewController: vc)
    }

}
