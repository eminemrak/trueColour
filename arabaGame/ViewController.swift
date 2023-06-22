//
//  ViewController.swift
//  arabaGame
//
//  Created by Eminko on 29.07.2022.
//

import UIKit
import AudioToolbox


class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var scoreLabel: UILabel!
    var myMutableString = NSMutableAttributedString()

    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    
    @IBOutlet weak var star3: UIImageView!
    @IBOutlet weak var tekrarButton: UIButton!
    
    @IBOutlet weak var buton1: UIButton!
    @IBOutlet weak var buton2: UIButton!
    @IBOutlet weak var buton3: UIButton!
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    var highScore = 0
    
    var sarı = UIColor.yellow
    let kırmızı = UIColor.red
    let turuncu = UIColor.orange
    
    let siyah = UIColor.black
    let yeşil = UIColor.green
    let mavi = UIColor.blue
    
    
    var dogruArray = [UIColor]()
    
    var yanlısArray = [UIColor]()

    var buttonArray = [UIButton]()
    var labelArray = [UILabel]()
    
    var sayı = [0,1,2,10]
    
    var renkisimArray = ["","",""]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        score = 0
        scoreLabel.text = "Skor: \(score)"
        
        starSayısı = 3
        
        star1.image = UIImage(systemName: "star.fill")
        star2.image = UIImage(systemName: "star.fill")
        star3.image = UIImage(systemName: "star.fill")
        
        
        
        

       
        buton1.isEnabled = true
        buton2.isEnabled = true
        buton3.isEnabled = true
        
        buton1.setImage(UIImage(named: "bos2"), for: UIControl.State.normal)
        buton2.setImage(UIImage(named: "bos2"), for: UIControl.State.normal)
        buton3.setImage(UIImage(named: "bos2"), for: UIControl.State.normal)
        
        

        
        
        buton1.tintColor = UIColor.white
        buton2.tintColor = UIColor.white
        buton3.tintColor = UIColor.white
        
        dogruArray = [sarı,kırmızı,turuncu]
        yanlısArray = [siyah,mavi,yeşil]
        
        
        //dogruArray.append(sarı)
        //dogruArray.append(kırmızı)
        //yanlısArray.append(siyah)
        //yanlısArray.append(yeşil)
        //yanlısArray.append(mavi)
        
        buttonArray.append(buton1)
        buttonArray.append(buton2)
        buttonArray.append(buton3)
        
        labelArray.append(label1)
        labelArray.append(label2)
        labelArray.append(label3)


        
        
        imageView.image = UIImage(named: "bos")
        
        
        
        //buton1.backgroundColor = dogruArray.randomElement()
        //buton2.backgroundColor = yanlısArray.randomElement()
        //buton3.backgroundColor = yanlısArray.randomElement()
        
        
        var a = buttonArray.randomElement()
        var aa = dogruArray.randomElement()
        
        a?.backgroundColor = aa
        
        
        var b = buttonArray.randomElement()
        var bb = yanlısArray.randomElement()
        while a == b {
            b = buttonArray.randomElement()
        }
        
        b?.backgroundColor = bb
        
        
        var c = buttonArray.randomElement()
        var cc = yanlısArray.randomElement()

        
        while c == a || c == b {
            c = buttonArray.randomElement()
        }
        
        while cc == bb {
            cc = yanlısArray.randomElement()
        }
        
        c?.backgroundColor = cc
        
        
        
        
        var index1 = buttonArray.firstIndex(of: a!)
        var index2 = buttonArray.firstIndex(of: b!)
        var index3 = buttonArray.firstIndex(of: c!)
        
        
        
            if aa == sarı {
                renkisimArray[index1!] = "SARI"
            }
            else if aa == kırmızı {
                renkisimArray[index1!] = "KIRMIZI"
            } else if aa == turuncu {
                renkisimArray[index1!] = "TURUNCU"
            }
        
        
       
        if bb == siyah{
            renkisimArray[index2!] = "SİYAH"
        }
        else if bb == yeşil{
            renkisimArray[index2!] = "YEŞİL"
        }
        else if bb == mavi{
            renkisimArray[index2!] = "MAVİ"
        }
        
        
        if cc == siyah{
            renkisimArray[index3!] = "SİYAH"
        }
        else if cc == yeşil{
            renkisimArray[index3!] = "YEŞİL"
        }
        else if cc == mavi{
            renkisimArray[index3!] = "MAVİ"
        }
        
        
        
      
        
        print(renkisimArray)
        
           


        
            labelArray[index1!].text = renkisimArray[index1!]
            
            labelArray[index2!].text = renkisimArray[index2!]
            
            labelArray[index3!].text = renkisimArray[index3!]
        
        //titleLabel.text = "RENKLİ ARABA"
        
        for slide in labelArray{
        //tüm slaytlarda text kısmını myMutable yapıyoruz
        myMutableString = NSMutableAttributedString(string: slide.text!)
        
        //arrayOluşturma fonksiyonu sayesinde aldığımız tüm indexleri renklendiriyoruz
        //tabi fonksiyona önce ki for döngüsünden tüm slaytların textlerini veriyoruz
        
        for i in renklendirmeArrayiOlusturma(textLabel: slide.text!){
            myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemOrange, range: NSRange(location: i as! Int, length: 1))
            slide.attributedText = myMutableString
        }
        }
        
       /*
        
        
        myMutableString = NSMutableAttributedString(string: titleLabel.text!)
        for i in renklendirmeArrayiOlusturma(textLabel: titleLabel.text!){
            myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemOrange, range: NSRange(location: i as! Int, length: 1))
            titleLabel.attributedText = myMutableString
        }
        */
        
      
        
        
    }
    
    
    
    

    @IBAction func buton1(_ sender: Any) {
        dogruResim(buton: buton1)
        
    }
    
    @IBAction func buton2(_ sender: Any) {
        dogruResim(buton: buton2)

    }
    
    @IBAction func buton3(_ sender: Any) {
       dogruResim(buton: buton3)
    }
    
    @IBAction func tekrarButton(_ sender: Any) {
        buton1.isEnabled = true
        buton2.isEnabled = true
        buton3.isEnabled = true
        
        buton1.setImage(UIImage(named: "bos2"), for: UIControl.State.normal)
        buton2.setImage(UIImage(named: "bos2"), for: UIControl.State.normal)
        buton3.setImage(UIImage(named: "bos2"), for: UIControl.State.normal)
        
        imageView.image = UIImage(named: "bos")

        var a = buttonArray.randomElement()
        var aa = dogruArray.randomElement()
        
        a?.backgroundColor = aa
        
        
        var b = buttonArray.randomElement()
        var bb = yanlısArray.randomElement()
        while a == b {
            b = buttonArray.randomElement()
        }
        
        b?.backgroundColor = bb
        
        
        var c = buttonArray.randomElement()
        var cc = yanlısArray.randomElement()

        
        while c == a || c == b {
            c = buttonArray.randomElement()
        }
        
        while cc == bb {
            cc = yanlısArray.randomElement()
        }
        
        c?.backgroundColor = cc
        
        
        
        
        var index1 = buttonArray.firstIndex(of: a!)
        var index2 = buttonArray.firstIndex(of: b!)
        var index3 = buttonArray.firstIndex(of: c!)
        
        
        
            if aa == sarı {
                renkisimArray[index1!] = "SARI"
            }
            else if aa == kırmızı {
                renkisimArray[index1!] = "KIRMIZI"
            } else if aa == turuncu {
                renkisimArray[index1!] = "TURUNCU"
            }
        
        
       
        if bb == siyah{
            renkisimArray[index2!] = "SİYAH"
        }
        else if bb == yeşil{
            renkisimArray[index2!] = "YEŞİL"
        }
        else if bb == mavi{
            renkisimArray[index2!] = "MAVİ"
        }
        
        
        if cc == siyah{
            renkisimArray[index3!] = "SİYAH"
        }
        else if cc == yeşil{
            renkisimArray[index3!] = "YEŞİL"
        }
        else if cc == mavi{
            renkisimArray[index3!] = "MAVİ"
        }
        
        
        
      
        
        print(renkisimArray)
        
           


        
            labelArray[index1!].text = renkisimArray[index1!]
            
            labelArray[index2!].text = renkisimArray[index2!]
            
            labelArray[index3!].text = renkisimArray[index3!]

    }
    
    
    
    var score = 0
    func dogruResim(buton: UIButton) {
        
        for i in dogruArray{
            if i == buton.backgroundColor{
                if i == sarı{
                    imageView.image = UIImage(named: "sarı")
                    buton.setImage(UIImage(systemName: "star.fill"), for: UIControl.State.normal)
                    buton.tintColor = UIColor.red
                    score = score + 1
                    scoreLabel.text = "Skor: \(score)"
                    print(score)
                    print("DOĞRU OLDU VE SARI ÇALIŞTI")
                }
                else if i == kırmızı {
                    imageView.image = UIImage(named: "kırmızı")
                    buton.setImage(UIImage(systemName: "star.fill"), for: UIControl.State.normal)
                    buton.tintColor = UIColor.white
                    score = score + 1
                    scoreLabel.text = "Skor: \(score)"

                    print(score)

                    print("DOĞRU OLDU VE Kırmızı ÇALIŞTI")
                            }
                
                else if i == turuncu {
                    imageView.image = UIImage(named: "kırmızı")
                    buton.setImage(UIImage(systemName: "star.fill"), for: UIControl.State.normal)
                    buton.tintColor = UIColor.gray
                    score = score + 1
                    scoreLabel.text = "Skor: \(score)"

                    print(score)
                    
                }
                if buton == buton1 {
                    buton2.isEnabled = false
                    buton3.isEnabled = false
                    
                    buton2.setImage(UIImage(named: "carpı"), for: UIControl.State.normal)
                    buton3.setImage(UIImage(named: "carpı"), for: UIControl.State.normal)


                } else if buton == buton2{
                    buton1.isEnabled = false
                    buton3.isEnabled = false
                    
                    buton1.setImage(UIImage(named: "carpı"), for: UIControl.State.normal)
                    buton3.setImage(UIImage(named: "carpı"), for: UIControl.State.normal)
                    
                }else if buton == buton3{
                    buton1.isEnabled = false
                    buton2.isEnabled = false
                    
                    buton1.setImage(UIImage(named: "carpı"), for: UIControl.State.normal)
                    buton2.setImage(UIImage(named: "carpı"), for: UIControl.State.normal)
                    
                }
                
                
                
                        }
                    }
        
        for i in yanlısArray{
            if i == buton.backgroundColor{
                    //buton.backgroundColor = nil
                    buton.setImage(UIImage(named: "carpı"), for: UIControl.State.normal)
                    buton.tintColor = UIColor.black
                    
                    print("YANLIŞ OLDU")
                starSayısı = starSayısı - 1
                AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))

                
            }
            }
        buton.isEnabled = false
        if starSayısı == 3 {
            star1.image = UIImage(systemName: "star.fill")
            star2.image = UIImage(systemName: "star.fill")
            star3.image = UIImage(systemName: "star.fill")
        }
        else if starSayısı == 2{
            star3.image = UIImage(systemName: "star")

        } else if starSayısı == 1 {
            star2.image = UIImage(systemName: "star")
            star3.image = UIImage(systemName: "star")
            
        } else if starSayısı == 0 {
            star1.image = UIImage(systemName: "star")
            star2.image = UIImage(systemName: "star")
            star3.image = UIImage(systemName: "star")
            
            
            
            if score > UserDefaults.standard.integer(forKey: "highScore"){
                highScore = score
                UserDefaults.standard.setValue(highScore, forKey: "highScore")

            }
            
            
            makeAlert(titleInput: "Skor: \(score)", messageInput: "Maalesef! 3 Yıldızı kaybettin. Tekrar Başlayabilirsin! ---- High Score: \(UserDefaults.standard.integer(forKey: "highScore"))")
            
            
            
            

        }

        
    }
    func makeAlert(titleInput:String, messageInput:String){
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Yeniden Başla!", style: UIAlertAction.Style.default) { ACTION in self.viewDidLoad()}
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    var starSayısı = 3
    
    func renklendirmeArrayiOlusturma(textLabel: String) -> Array<Any>{
        var harfIndexArray = [Int]()
        var x = -1
        for i in textLabel {
            x = x + 1
            
                if i == "r" || i == "R"{
                    harfIndexArray.append(x)
                
                }
           
        }
        return harfIndexArray
    }
    
    
    
    
    
}

