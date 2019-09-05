//
//
//  DatabaseManager.swift
//  Pelis
//
//  Created by Blashadow on 9/4/19.
//  Copyright © 2019 Blashadow. All rights reserved.
//

import UIKit
import RealmSwift

class DatabaseManager {
  private var database: Realm?
  static let shared = DatabaseManager()

  private init() {
    do {
      try database = Realm()
    } catch {
    }
  }

  public func create(item: Object) {
    do {
      guard let realm = database else {
        return
      }

      try realm.write {
        realm.add(item)
      }
    } catch {

    }
  }

  public func update(with block: () -> Void) {
    do {
      guard let realm = database else {
        return
      }

      try realm.write {
        block()
      }
    } catch {
    }
  }

  public func update(item: Object) {
    guard let realm = database else {
      return
    }

    realm.add(item, update: true)
  }

  public func retrieveData(source: AnyObject) {
  }
}
