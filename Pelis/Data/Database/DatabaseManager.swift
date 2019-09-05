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
  private var database: Realm? {
    do {
      return try Realm()
    } catch {
      return nil
    }
  }

  static let shared = DatabaseManager()

  private init() {
  }

  public func create(item: Object) {
    do {
      guard let realm = database else {
        return
      }

      try realm.write {
        realm.add(item, update: true)
      }
    } catch {
      print("Error saving item \(error)")
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
      print("Error updating \(error)")
    }
  }

  public func setFavoriteMovie(movie: Movie, value: Bool) {
    do {
      guard let realm = database else {
        return
      }

      try realm.write {
        movie.favorite = value
        realm.add(movie, update: true)
      }
    } catch {
      print("Error updating \(error)")
    }

    print("Movie favorite value", movie.favorite)
  }

  public func update(item: Object) {
    guard let realm = database else {
      return
    }

    realm.add(item, update: true)
  }

  public func retrieveData(filter predicate: (_ movie: Movie) -> Bool) -> [Object] {
    guard let realm = database else {
      return []
    }

    return realm.objects(Movie.self).filter(predicate)
  }
}
