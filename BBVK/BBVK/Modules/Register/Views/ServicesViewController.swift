//
//  ServicesViewController.swift
//  proyecyoginal
//
//  Created by user209759 on 4/5/22.
//



import UIKit

class ServicesViewController: UIViewController {
    
    let bbvkUtilities = initializerUI()
    let constantes = constants()
    var userLabel: String = ""
    var moneyLabel: String = "0.00"
            

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        initUI()
    }
    
    
    func initUI()
    {
       bbvkUtilities.MainViewController(viewControllerParam: view)
       
        
        let servicesLabel = bbvkUtilities.uiLabelSetter(labelString: "Services", labelSize: 20, textaligment: .left, isBold: false, isHighLighted: false)
        view.addSubview(servicesLabel)
        servicesLabel.addAnchors(left: 20, top: 100, right: 20, bottom: nil, withAnchor: nil, relativeToView: nil)
        
        var rechargeView = UIView(frame: CGRect(x: 20, y: 160, width: width - 40, height: 60))
        rechargeView.layer.borderWidth = 0.5
        rechargeView.layer.cornerRadius = 8
        view.addSubview(rechargeView)
        

       
       let rechargeLabel = bbvkUtilities.uiLabelSetter(labelString: "Recharge Cell", labelSize: 20, textaligment: .center, isBold: false, isHighLighted: false)
        rechargeLabel.backgroundColor = .clear
        rechargeLabel.textAlignment = .left
        rechargeLabel.font = .boldSystemFont(ofSize: 18)
        rechargeView.addSubview(rechargeLabel)
        rechargeLabel.addAnchorsAndSize(width: nil, height: 20, left: 5, top:nil, right: 20, bottom: nil, withAnchor: nil, relativeToView:nil)
       
        let telcelLabel = bbvkUtilities.uiLabelSetter(labelString: "Telcel, AT&T,Movistar", labelSize: 15, textaligment: .center, isBold: false, isHighLighted: false)
         telcelLabel.backgroundColor = .clear
        telcelLabel.textAlignment = .left
         rechargeView.addSubview(telcelLabel)
         telcelLabel.addAnchorsAndSize(width: nil, height: 20, left: 5, top: 30, right: 20, bottom: nil, withAnchor: nil, relativeToView:rechargeLabel)
        
        
        
        var planView = UIView()
        planView.layer.borderWidth = 0.5
        planView.layer.cornerRadius = 8
        view.addSubview(planView)
        planView.addAnchorsAndSize(width: nil, height: 60, left: 20, top: 30, right: 20, bottom: nil, withAnchor: .top, relativeToView:rechargeView)
        
        
        let planLabel = bbvkUtilities.uiLabelSetter(labelString: "Plan Movil", labelSize: 20, textaligment: .center, isBold: false, isHighLighted: false)
         planLabel.backgroundColor = .clear
         planLabel.textAlignment = .left
         planLabel.font = .boldSystemFont(ofSize: 18)
         planView.addSubview(planLabel)
         planLabel.addAnchorsAndSize(width: nil, height: 20, left: 5, top:nil, right: 20, bottom: nil, withAnchor: nil, relativeToView: nil )
        
        let telcelLabel2 = bbvkUtilities.uiLabelSetter(labelString: "AT&T, Telcel, Movistar", labelSize: 15, textaligment: .center, isBold: false, isHighLighted: false)
         telcelLabel2.backgroundColor = .clear
        telcelLabel2.textAlignment = .left
         planView.addSubview(telcelLabel2)
        telcelLabel2.addAnchorsAndSize(width: nil, height: 20, left: 5, top: 10, right: 20, bottom: nil, withAnchor: .top, relativeToView:planLabel)
        
        
        var planView2 = UIView()
        planView2.layer.borderWidth = 0.5
        planView2.layer.cornerRadius = 8
        view.addSubview(planView2)
        planView2.addAnchorsAndSize(width: nil, height: 60, left: 20, top: 30, right: 20, bottom: nil, withAnchor: .top, relativeToView:planView)
        
        
        let planLabel2 = bbvkUtilities.uiLabelSetter(labelString: "Plan Movil", labelSize: 20, textaligment: .center, isBold: false, isHighLighted: false)
         planLabel2.backgroundColor = .clear
         planLabel2.textAlignment = .left
         planLabel2.font = .boldSystemFont(ofSize: 18)
         planView2.addSubview(planLabel2)
         planLabel2.addAnchorsAndSize(width: nil, height: 20, left: 5, top:nil, right: 20, bottom: nil, withAnchor: nil, relativeToView: nil )
        
        let telcelLabel3 = bbvkUtilities.uiLabelSetter(labelString: "AT&T, Telcel, Movistar", labelSize: 15, textaligment: .center, isBold: false, isHighLighted: false)
         telcelLabel3.backgroundColor = .clear
        telcelLabel3.textAlignment = .left
         planView2.addSubview(telcelLabel3)
        telcelLabel3.addAnchorsAndSize(width: nil, height: 20, left: 5, top: 10, right: 20, bottom: nil, withAnchor: .top, relativeToView:planLabel2)
        
        
        var internetView = UIView()
        internetView.layer.borderWidth = 0.5
        internetView.layer.cornerRadius = 8
        view.addSubview(internetView)
        internetView.addAnchorsAndSize(width: nil, height: 60, left: 20, top: 30, right: 20, bottom: nil, withAnchor: .top, relativeToView:planView2)
        
        
        let internetLabel = bbvkUtilities.uiLabelSetter(labelString: "Internet / TV / Telefono", labelSize: 20, textaligment: .center, isBold: false, isHighLighted: false)
         internetLabel.backgroundColor = .clear
         internetLabel.textAlignment = .left
         internetLabel.font = .boldSystemFont(ofSize: 18)
         internetView.addSubview(internetLabel)
         internetLabel.addAnchorsAndSize(width: nil, height: 20, left: 5, top:nil, right: 20, bottom: nil, withAnchor: nil, relativeToView: nil )
        
        let telmexLabel = bbvkUtilities.uiLabelSetter(labelString: "Telmex, Izzi, TotalPlay", labelSize: 15, textaligment: .center, isBold: false, isHighLighted: false)
         telmexLabel.backgroundColor = .clear
        telmexLabel.textAlignment = .left
         internetView.addSubview(telmexLabel)
        telmexLabel.addAnchorsAndSize(width: nil, height: 20, left: 5, top: 10, right: 20, bottom: nil, withAnchor: .top, relativeToView:internetLabel)
        
        
        
        var gasView = UIView()
        gasView.layer.borderWidth = 0.5
        gasView.layer.cornerRadius = 8
        view.addSubview(gasView)
        gasView.addAnchorsAndSize(width: nil, height: 60, left: 20, top: 30, right: 20, bottom: nil, withAnchor: .top, relativeToView:internetView)
        
        
        let gasLabel = bbvkUtilities.uiLabelSetter(labelString: "Gas", labelSize: 20, textaligment: .center, isBold: false, isHighLighted: false)
         gasLabel.backgroundColor = .clear
         gasLabel.textAlignment = .left
         gasLabel.font = .boldSystemFont(ofSize: 18)
         gasView.addSubview(gasLabel)
         gasLabel.addAnchorsAndSize(width: nil, height: 20, left: 5, top:nil, right: 20, bottom: nil, withAnchor: nil, relativeToView: nil )
        
        let naturgyLabel = bbvkUtilities.uiLabelSetter(labelString: "Naturgy And Mexican Company", labelSize: 15, textaligment: .center, isBold: false, isHighLighted: false)
         naturgyLabel.backgroundColor = .clear
        naturgyLabel.textAlignment = .left
         gasView.addSubview(naturgyLabel)
        naturgyLabel.addAnchorsAndSize(width: nil, height: 20, left: 5, top: 10, right: 20, bottom: nil, withAnchor: .top, relativeToView:gasLabel)
        
        
        var cardView = UIView()
        cardView.layer.borderWidth = 0.5
        cardView.layer.cornerRadius = 8
        view.addSubview(cardView)
        cardView.addAnchorsAndSize(width: nil, height: 60, left: 20, top: 30, right: 20, bottom: nil, withAnchor: .top, relativeToView:gasView)
        
        
        let cardLabel = bbvkUtilities.uiLabelSetter(labelString: "Credit Cards", labelSize: 20, textaligment: .center, isBold: false, isHighLighted: false)
         cardLabel.backgroundColor = .clear
         cardLabel.textAlignment = .left
         cardLabel.font = .boldSystemFont(ofSize: 18)
         cardView.addSubview(cardLabel)
         cardLabel.addAnchorsAndSize(width: nil, height: 20, left: 5, top:nil, right: 20, bottom: nil, withAnchor: nil, relativeToView: nil )
        
        let banksLabel = bbvkUtilities.uiLabelSetter(labelString: "BBVA, Santander, Banorte ,Banamex", labelSize: 15, textaligment: .center, isBold: false, isHighLighted: false)
         banksLabel.backgroundColor = .clear
        banksLabel.textAlignment = .left
         cardView.addSubview(banksLabel)
        banksLabel.addAnchorsAndSize(width: nil, height: 20, left: 5, top: 10, right: 20, bottom: nil, withAnchor: .top, relativeToView:cardLabel)
        
        
        
        
        
        var storeView = UIView()
        storeView.layer.borderWidth = 0.5
        storeView.layer.cornerRadius = 8
        view.addSubview(storeView)
        storeView.addAnchorsAndSize(width: nil, height: 60, left: 20, top: 30, right: 20, bottom: nil, withAnchor: .top, relativeToView:cardView)
        
        
        let storeLabel = bbvkUtilities.uiLabelSetter(labelString: "Department stores", labelSize: 20, textaligment: .center, isBold: false, isHighLighted: false)
         storeLabel.backgroundColor = .clear
         storeLabel.textAlignment = .left
         storeLabel.font = .boldSystemFont(ofSize: 18)
         storeView.addSubview(storeLabel)
         storeLabel.addAnchorsAndSize(width: nil, height: 20, left: 5, top:nil, right: 20, bottom: nil, withAnchor: nil, relativeToView: nil )
        
        let departmentLabel = bbvkUtilities.uiLabelSetter(labelString: " Liverpool, Sears,Iron Palace", labelSize: 15, textaligment: .center, isBold: false, isHighLighted: false)
         departmentLabel.backgroundColor = .clear
        departmentLabel.textAlignment = .left
         storeView.addSubview(departmentLabel)
        departmentLabel.addAnchorsAndSize(width: nil, height: 20, left: 5, top: 10, right: 20, bottom: nil, withAnchor: .top, relativeToView:storeLabel)
        
        
       
       let startButton = bbvkUtilities.uiButtonSetter(ispurple: false, isgray: true, isgreen: false, buttonText: " Home")
       startButton.backgroundColor = .black
       startButton.setImage(UIImage(systemName: "house"), for: .normal)
       startButton.tintColor = .white
       let cardButton = bbvkUtilities.uiButtonSetter(ispurple: false, isgray: false, isgreen: true, buttonText: " Credit Card")
       cardButton.backgroundColor = .black
       cardButton.setImage(UIImage(systemName: "creditcard"), for: .normal)
       cardButton.tintColor = .white
       let servicesButton = bbvkUtilities.uiButtonSetter(ispurple: false, isgray: false, isgreen: true, buttonText: " Services")
       servicesButton.backgroundColor = .black
       servicesButton.setImage(UIImage(systemName: "menubar.arrow.up.rectangle"), for: .normal)
       servicesButton.tintColor = .white
       servicesButton.addTarget(self, action: #selector(goToService), for: .touchUpInside)

       let stackFooter = UIStackView(arrangedSubviews: [startButton, cardButton,servicesButton])
       stackFooter.distribution = .fillEqually
       stackFooter.spacing = 2
       stackFooter.translatesAutoresizingMaskIntoConstraints = false
       stackFooter.backgroundColor = .black
       view.addSubview(stackFooter)
       stackFooter.addAnchors(left: 0, top: (constants.height/20)*18.5, right: 0, bottom: 0)
       
       

    }
}

extension ServicesViewController{
   
   @objc func goToService(){
      let detailstransactionVC = ViewController()
      detailstransactionVC.modalPresentationStyle = .fullScreen
      present(detailstransactionVC, animated: true, completion: nil)
   }
}
