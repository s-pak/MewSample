//
//  MainViewController.swift
//  SampleMicroView
//
//  Created by 朴 成基 on 2018/09/14.
//  Copyright © 2018年 朴 成基. All rights reserved.
//

import UIKit
import Mew

final class MainViewController: UIViewController, Instantiatable {

    
    typealias Input = Void
    typealias Environment = EnvironmentMock
    
    var environment: EnvironmentMock
    
    @IBOutlet weak var containerView: ContainerView!
    lazy var pushButton = self.containerView.makeContainer(for: PushButtonViewController.self, parent: self, with: ())
    
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
        pushButton.output { print($0)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}
