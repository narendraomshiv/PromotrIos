//
//  VSGeneralLoading.swift
//  Promotr
//
//  Created by Mac on 3/3/23.
//

import UIKit
//
//class VSGeneralLoading: UIView {
//
//    @IBOutlet weak var loaderView: UIActivityIndicatorView!
//        public override init(frame: CGRect) {
//
//            super.init(frame: frame)
//
//            commonInit()
//        }
//        public required init?(coder aDecoder: NSCoder) {
//            super.init(coder: aDecoder)
//            commonInit()
//        }
//        private func commonInit() {
//            fromNib()
//            self.backgroundColor = UIColor.black.withAlphaComponent( 0.15)
//
//        }
//}

public class VSGeneralLoading: UIView {


    @IBOutlet weak var loaderView: UIActivityIndicatorView!


    public override init(frame: CGRect) {

        super.init(frame: frame)

        commonInit()

    }
    public required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)

        commonInit()

    }
    private func commonInit() {

        //fromNib()
        self.backgroundColor = UIColor.black.withAlphaComponent( 0.15)

    }



}
