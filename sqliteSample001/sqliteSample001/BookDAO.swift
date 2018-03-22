//
//  BookDAO.swift
//  sqliteSample001
//
//  Created by Shuhei Murata on 2018/03/14.
//  Copyright © 2018年 xyz.pice001. All rights reserved.
//

import Foundation
import UIKit
import FMDB
/*
// https://qiita.com/sgr-ksmt/items/77345499e04de7f214ad
extension String {
        
    private var ns: NSString {
        return (self as NSString)
    }
    
    public func substring(from index: Int) -> String {
        return ns.substring(from: index)
    }
    
    public func substring(to index: Int) -> String {
        return ns.substring(to: index)
        
    }
    
    public func substring(with range: NSRange) -> String {
        return ns.substring(with: range)
    }
    
    public var lastPathComponent: String {
        return ns.lastPathComponent
    }
    
    public var pathExtension: String {
        return ns.pathExtension
    }
    
    public var deletingLastPathComponent: String {
        return ns.deletingLastPathComponent
    }
    
    public var deletingPathExtension: String {
        return ns.deletingPathExtension
    }
    
    public var pathComponents: [String] {
        return ns.pathComponents
    }
    
    public func appendingPathComponent(_ str: String) -> String {
        return ns.appendingPathComponent(str)
    }
    
    public func appendingPathExtension(_ str: String) -> String {
        return ns.appendingPathExtension(str)!
    }
}

class BookDAO: NSObject {
    let sql = "" +
    "CREATE TABLE NOT EXISTS books (" +
      "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
      "author TEXT, " +
      "title TEXT, " +
      "release_date INTEGER" +
    ");"
    
    //Documentsまでのパスを取得する
    let paths = NSSearchPathForDirectoriesInDomains(
        .documentDirectory,
        .userDomainMask, true)
    
    // lazyは遅延初期化、ないとエラー
    //pathにDocumentディレクトリにあるtest.dbのフルパスを入れる
    //dirPathはStringだがNSString#stringByAppendingPathComponentが使える
    //lazy var dirPath = paths.first! as String
    //lazy var path = dirPath.stringByAppendingPathComponent("test.db")
    
    
    //<Application>/Documents/sample.dbというパスを生成
    lazy var _path = paths[0].appendingPathComponent("sample.db")
 
    
    //FMDatabaseクラスのインスタンスを生成
    //引数にファイルまでのパスを渡す
    lazy var db = FMDatabase(path: _path)
    
    //データベースをオープン
    //db.open()
    
    //https://qiita.com/wz732905639/items/f8efbcbbee49219909f3
    lazy var ret = db.executeUpdate(sql, withArgumentsIn: [])
    
    //db.close()
    
    
    db.open()
    
    /*
    func create(){
        self.db.executeUpdate(BookDAO.SQLCreate, withArgumentsIn: nil)
    }
 */
}

*/
