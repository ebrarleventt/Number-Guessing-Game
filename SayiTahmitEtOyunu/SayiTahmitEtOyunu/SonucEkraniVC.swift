//
//  SonucEkraniVC.swift
//  SayiTahmitEtOyunu
//
//  Created by Ebrar Levent on 10.01.2024.
//

import UIKit

class SonucEkraniVC: UIViewController {
    
    
    
    @IBOutlet weak var imageViewSonuc: UIImageView!
    
    
    @IBOutlet weak var labelSonuc: UILabel!
    
    var sonuc:Bool?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //geri ozelligini kaldiriyor
        self.navigationItem.hidesBackButton = true
        
        //Baslik
        self.navigationItem.title = "Sonuc Ekranı"
        
        print("Sonuc: \(sonuc!)")
        
        if sonuc! {
            
            labelSonuc.text = "KAZANDINIZ"
            imageViewSonuc.image = UIImage(named: "mutluResim")
            
        }else{
            
            labelSonuc.text = "KAYBETTINIZ"
            imageViewSonuc.image = UIImage(named: "uzgunResim")
            
        }
        
        

    }
    

    
    
    @IBAction func tekrarOyna(_ sender: Any) {
        
        navigationController?.popToRootViewController(animated: true)
        
    }
    
    
    
    

}
