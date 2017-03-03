//
//  TBUtils.swift
//  Translate Menu
//
//  Created by Talles Borges  on 3/3/17.
//  Copyright © 2017 Razeware LLC. All rights reserved.
//

import Foundation

func saveCookies() {
    guard let cookies = HTTPCookieStorage.shared.cookies else {
        return
    }
    let array = cookies.flatMap { (cookie) -> [HTTPCookiePropertyKey: Any]? in
        cookie.properties
    }
    UserDefaults.standard.set(array, forKey: "cookies")
    UserDefaults.standard.synchronize()
}

func loadCookies() {
    guard let cookies = UserDefaults.standard.value(forKey: "cookies") as? [[HTTPCookiePropertyKey: Any]] else {
        return
    }
    cookies.forEach { (cookie) in
        guard let cookie = HTTPCookie.init(properties: cookie) else {
            return
        }
        HTTPCookieStorage.shared.setCookie(cookie)
    }
}
