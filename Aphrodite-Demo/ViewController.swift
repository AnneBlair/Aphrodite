
//
//  ViewController.swift
//  Aphrodite-Demo
//
//  Created by AnneBlair on 2017/9/8.
//  Copyright © 2017年 blog.aiyinyu.com. All rights reserved.
//
import UIKit
import Aphrodite

class ViewController: UIViewController {

    @IBOutlet weak var CandleView: CandleStickView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        printDebug("Test")
        setUpPieCandleView()
        self.CandleView.animate(yAxisDuration: 3)
        setDataCount(count: 20, range: 2000)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpPieCandleView() {
        CandleView.delegate = self
        CandleView.chartDescription?.enabled = false
        CandleView.maxVisibleCount = 60
        CandleView.pinchZoomEnabled = false
        CandleView.drawGridBackgroundEnabled = false
        
        let xAxis = CandleView.xAxis
        xAxis.labelPosition = .bottom
        xAxis.drawGridLinesEnabled = false
        xAxis.drawGridLinesEnabled = false
        
        let leftAxis = CandleView.leftAxis
        leftAxis.labelCount = 7
        leftAxis.drawGridLinesEnabled = false
        leftAxis.drawAxisLineEnabled = false
        
        let rightAxis = CandleView.rightAxis
        rightAxis.enabled = false
        rightAxis.drawGridLinesEnabled = false
        CandleView.legend.enabled = false
        
    }
    
    func setDataCount(count: Int, range: Double) {
        var yVals1: [CandleDataEntry] = []
        for i in 0..<count {
            let mult = range + 1
            
            let val = Double(arc4random_uniform(40)) + mult
            let high = Double(arc4random_uniform(9)) + 8.0
            let low = Double(arc4random_uniform(9)) + 8.0
            let open = Double(arc4random_uniform(6)) + 1.0
            let close = Double(arc4random_uniform(6)) + 1.0
            let even = i % 2 == 0
            
            yVals1.append(CandleDataEntry(x: Double(i), shadowH: val + high,
                                          shadowL:val - low,
                                          open: even ? val + open : val - open,
                                          close: val + close,
                                          icon: nil))

        }
        
        let data = loadingCandleChartDataSet(values: yVals1)
        CandleView.data = data
    }
    
    func loadingCandleChartDataSet(values:  [ADataEntry]?) -> CandleBubbleData {
        let set1 = CandleDataSet(values: values, label: "Data Set")
        set1.axisDependency = .right
        set1.setColor(Color.blue, alpha: 1.0)
        set1.drawIconsEnabled = false
        //  控制上方是否显示文字内容
        set1.drawValuesEnabled = false
        set1.shadowColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        set1.shadowWidth = 0.7
        set1.decreasingColor = Color.red
        set1.decreasingFilled = true
        set1.increasingColor = Color.brown
        set1.increasingFilled = true
        set1.neutralColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        set1.highlightColor = Color.blue
        /// 上绿下红
        set1.shadowColorSameAsCandle = true
        
        let data = CandleData(dataSet: set1)
        return data
    }
}

extension ViewController: CandleViewDelegate {
    func chartValueSelected(_ chartView: CandleViewBase, entry: ADataEntry, highlight: Highlight) {
        printDebug("选择了😄")
    }
}

