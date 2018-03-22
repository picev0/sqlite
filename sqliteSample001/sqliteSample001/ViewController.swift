//
//  ViewController.swift
//  sqliteSample001
//
//  Created by Shuhei Murata on 2018/03/14.
//  Copyright © 2018年 xyz.pice001. All rights reserved.
//

import Foundation
import UIKit
import FMDB

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

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let sql = "" +
            "CREATE TABLE IF NOT EXISTS books (" +
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
        var dirPath = paths.first! as String
        var _path = dirPath.appendingPathComponent("test.db")
        
        
        //<Application>/Documents/sample.dbというパスを生成
        //let _path = paths[0].appendingPathComponent("sample.db")
        //print(_path)
        
        
        //FMDatabaseクラスのインスタンスを生成
        //引数にファイルまでのパスを渡す
        let db = FMDatabase(path: _path)
        
        
        //データベースをオープン
        db.open()
        
        //https://qiita.com/wz732905639/items/f8efbcbbee49219909f3
        let ret = db.executeUpdate(sql, withArgumentsIn: []) // let ret が _ にもできる
        
        //db.close()
        
        
        //db.open()
        
        if ret {
            let myLabel: UILabel = UILabel(frame: CGRect(x: 100, y: 100, width: 200, height: 50))
            myLabel.text = "OK!"
            self.view.addSubview(myLabel)
            
        }else{
            let myLabel: UILabel = UILabel(frame: CGRect(x: 100, y: 100, width: 200, height: 50))
            myLabel.text = "NO!"
            self.view.addSubview(myLabel)
            
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

