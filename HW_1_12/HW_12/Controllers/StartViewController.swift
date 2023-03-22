//
//  StartViewController.swift
//  HW_12
//
//  Created by Olga Novikova on 15.01.2021.
//

// обновлено 17-14


import UIKit

class StartViewController: UIViewController {

    
    @IBOutlet weak var buttonSpirit1: UIButton!
    @IBOutlet weak var buttonSpirit2: UIButton!
    @IBOutlet weak var buttonSpirit3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        buttonSpirit1.layer.cornerRadius = 15
        buttonSpirit1.layer.borderWidth = 1
        buttonSpirit1.layer.borderColor = UIColor.black.cgColor
        
        buttonSpirit2.layer.cornerRadius = 15
        buttonSpirit2.layer.borderWidth = 1
        buttonSpirit2.layer.borderColor = UIColor.black.cgColor
        
        buttonSpirit3.layer.cornerRadius = 15
        buttonSpirit3.layer.borderWidth = 1
        buttonSpirit3.layer.borderColor = UIColor.black.cgColor
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false) // уберем footer - чтоб красиво
        //или self.navigationController?.navigationBarHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
      super.viewWillDisappear(animated) // вернем footer - чтоб можно было отобразить кнопку back
      navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
}
