//
//  PushButtonViewController.swift
//  SampleMicroView
//
//  Created by 朴 成基 on 2018/09/14.
//  Copyright © 2018年 朴 成基. All rights reserved.
//

import UIKit
import Mew

final class PushButtonViewController: UIViewController, Instantiatable, Interactable {

    
    typealias Input = Void
    typealias Environment = EnvironmentMock
    var environment: EnvironmentMock
    
    typealias Output = Int
    var handler: ((Int) -> Void)?
    
    init(with input: Input, environment: Environment) {
        self.environment = environment
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func output(_ handler: ((Int) -> Void)?) {
        self.handler = handler
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        let viewController = ValueInputViewController(with: .init(presentedStyle: .push), environment: self.environment)
        
        navigationController?.pushViewController(viewController, animated: true)
        viewController.output { self.handler?($0) }
        
        
        
    }

}
