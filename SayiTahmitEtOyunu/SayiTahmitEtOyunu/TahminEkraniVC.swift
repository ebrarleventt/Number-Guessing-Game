//
//  TahminEkraniVC.swift
//  SayiTahmitEtOyunu
//
//  Created by Ebrar Levent on 10.01.2024.
//

import UIKit

class TahminEkraniVC: UIViewController {
    
    
    @IBOutlet weak var labelKalanHak: UILabel!

    @IBOutlet weak var labelYardim: UILabel!

    @IBOutlet weak var textFieldGirdi: UITextField!
    
    
    var randomSayi:Int?
    var kalanHak = 5
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        randomSayi = Int(arc4random_uniform(100))   //0 ile 100 arasinda sayi uretir
        print("Random Sayi: \(randomSayi!)")

    }
    

    //veri transferi gerceklestirmek icin ve genel bir gecis kullandigimiz icin prepare metodu yani gecisi dinleme metodu olusturulmali:
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let gelenVeri = sender as? Bool {
            
            let gidilecekVC = segue.destination as! SonucEkraniVC
            gidilecekVC.sonuc = gelenVeri
            
        }
        
    }
    
    
    @IBAction func tahminEt(_ sender: Any) {
        
        labelYardim.isHidden = false
        kalanHak -= 1
        
        if let veri = textFieldGirdi.text {
            
            if let tahmin = Int(veri){

                    if tahmin == randomSayi! {
                        //Dogru bildiniz
                        //Sayfa Gecisi
                        
                        let sonuc = true
                        performSegue(withIdentifier: "tahminToSonuc", sender: sonuc)
                        return
                        
                    }
                    if tahmin > randomSayi! {
                        labelYardim.text = "Azalt"
                        labelKalanHak.text = "Kalan Hak: \(kalanHak)"
                    }
                    if tahmin < randomSayi! {
                        labelYardim.text = "Arttır"
                        labelKalanHak.text = "Kalan Hak: \(kalanHak)"
                    }
                    
                if(kalanHak==0){
                    
                    //Sayfa gecisi
                    let sonuc = false
                    performSegue(withIdentifier: "tahminToSonuc", sender: sonuc)
                    
                }
                
                textFieldGirdi.text = ""
                
            }
            
        }
        
        
    }
    
    
    
    

}
