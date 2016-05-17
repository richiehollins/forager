//
//  SuperEmptyTableViewCell.swift
//  Forager
//
//  Created by Hollins, Richie on 5/17/16.
//  Copyright © 2016 Hollins, Richie. All rights reserved.
//

import UIKit

class SuperEmptyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var loadingImage: UIImageView!
    
    var animatedImage: UIImage!
    var loadingImages: [UIImage]!
    var loading00: UIImage!
    var loading01: UIImage!
    var loading02: UIImage!
    var loading03: UIImage!
    var loading04: UIImage!
    var loading05: UIImage!
    var loading06: UIImage!
    var loading07: UIImage!
    var loading08: UIImage!
    var loading09: UIImage!
    var loading10: UIImage!
    var loading11: UIImage!
    var loading12: UIImage!
    var loading13: UIImage!
    var loading14: UIImage!
    var loading15: UIImage!
    var loading16: UIImage!
    var loading17: UIImage!
    var loading18: UIImage!
    var loading19: UIImage!
    var loading20: UIImage!
    var loading21: UIImage!
    var loading22: UIImage!
    var loading23: UIImage!
    var loading24: UIImage!
    var loading25: UIImage!
    var loading26: UIImage!
    var loading27: UIImage!
    var loading28: UIImage!
    var loading29: UIImage!

    @IBOutlet weak var emptyImage: UIImageView!
    @IBOutlet weak var emptyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        loading00 = UIImage(named:"Digging_00000")
        loading01 = UIImage(named:"Digging_00001")
        loading02 = UIImage(named:"Digging_00002")
        loading03 = UIImage(named:"Digging_00003")
        loading04 = UIImage(named:"Digging_00004")
        loading05 = UIImage(named:"Digging_00005")
        loading06 = UIImage(named:"Digging_00006")
        loading07 = UIImage(named:"Digging_00007")
        loading08 = UIImage(named:"Digging_00008")
        loading09 = UIImage(named:"Digging_00009")
        loading10 = UIImage(named:"Digging_00010")
        loading11 = UIImage(named:"Digging_00011")
        loading12 = UIImage(named:"Digging_00012")
        loading13 = UIImage(named:"Digging_00013")
        loading14 = UIImage(named:"Digging_00014")
        loading15 = UIImage(named:"Digging_00015")
        loading16 = UIImage(named:"Digging_00016")
        loading17 = UIImage(named:"Digging_00017")
        loading18 = UIImage(named:"Digging_00018")
        loading19 = UIImage(named:"Digging_00019")
        loading20 = UIImage(named:"Digging_00020")
        loading21 = UIImage(named:"Digging_00021")
        loading22 = UIImage(named:"Digging_00022")
        loading23 = UIImage(named:"Digging_00023")
        loading24 = UIImage(named:"Digging_00024")
        loading25 = UIImage(named:"Digging_00025")
        loading26 = UIImage(named:"Digging_00026")
        loading27 = UIImage(named:"Digging_00027")
        loading28 = UIImage(named:"Digging_00028")
        loading29 = UIImage(named:"Digging_00029")
        
        loadingImages = [loading00, loading01, loading02, loading03, loading04, loading05, loading06, loading07, loading08, loading09, loading10, loading11, loading12, loading13, loading14, loading15, loading16, loading17, loading18, loading19, loading20, loading21, loading22, loading23, loading24, loading25, loading26, loading27, loading28, loading29]
        animatedImage = UIImage.animatedImageWithImages(loadingImages, duration: 1)
        emptyImage.image = animatedImage
        emptyImage.startAnimating()
        //emptyLabel.text = "Foraging for scraps..."
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
