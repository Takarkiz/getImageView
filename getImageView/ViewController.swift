//
//  ViewController.swift
//  getImageView
//
//  Created by 澤田昂明 on 2017/01/02.
//  Copyright © 2017年 takarki. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet var imageView:UIImageView!
    @IBOutlet var button:UIButton!
    
    var newImage:UIImage!
    
    //選択されたイメージを格納する配列
    var imageArray:[UIImage] = []
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //デフォルトのイメージを設定
        let defaultImage:UIImage = UIImage(named: "人物アイコン.png")!
        imageView.image = defaultImage
        
        button.setTitle("タップで変更", for: UIControlState.normal)
        button.setTitleColor(UIColor.red, for: UIControlState.normal)
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
    }
    
    //フォトライブラリを呼び出す
    func photoLibrary(){
        //UIImagePickerControllerのインスタンスを作る
        let imagePickerController:UIImagePickerController = UIImagePickerController()
        
        //フォトライブラリを使う設定
        imagePickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        //フォトライブラリを呼び出す
        self.present(imagePickerController, animated: true, completion: nil)
        
    }
    
    //フォトライブラリから画像の選択が終わったら呼ばれるメソッド
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        //imageに選んだ画像を設定する
        newImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        //imageを背景に設定する
        self.imageView.image = newImage
        //フォトライブラリを閉じる
        self.dismiss(animated: true, completion: nil)
        
        //選択終了後にボタンの文字色を変更する
        button.setTitleColor(UIColor.gray, for: UIControlState.normal)
        //選択終了後も画像を丸くする
        imageView.layer.cornerRadius = 190/2
        imageView.clipsToBounds = true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //ImageView上のボタンをタップした時の処理
    @IBAction func imageChange(){
        self.photoLibrary()
        
    }


}

