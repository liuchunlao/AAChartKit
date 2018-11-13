
//  SpecialChartVC.m
//  AAChartKit
//
//  Created by An An on 17/3/23.
//  Copyright © 2017年 An An. All rights reserved.
//*************** ...... SOURCE CODE ...... ***************
//***...................................................***
//*** https://github.com/AAChartModel/AAChartKit        ***
//*** https://github.com/AAChartModel/AAChartKit-Swift  ***
//***...................................................***
//*************** ...... SOURCE CODE ...... ***************

/*
 
 * -------------------------------------------------------------------------------
 *
 * 🌕 🌖 🌗 🌘  ❀❀❀   WARM TIPS!!!   ❀❀❀ 🌑 🌒 🌓 🌔
 *
 * Please contact me on GitHub,if there are any problems encountered in use.
 * GitHub Issues : https://github.com/AAChartModel/AAChartKit/issues
 * -------------------------------------------------------------------------------
 * And if you want to contribute for this project, please contact me as well
 * GitHub        : https://github.com/AAChartModel
 * StackOverflow : https://stackoverflow.com/users/7842508/codeforu
 * JianShu       : http://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

#import "SpecialChartVC.h"
#import "AAChartKit.h"

@interface SpecialChartVC ()

@property (nonatomic, strong) AAChartModel *aaChartModel;
@property (nonatomic, strong) AAChartView  *aaChartView;

@end

@implementation SpecialChartVC


- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *chartType = [self configureTheChartTypeWithIntenger:self.chartType];
    self.title = [NSString stringWithFormat:@"%@ chart",chartType];
    
    [self setUpTheChartView:chartType];
    [self setUpTheNextTypeChartButton];
}

- (NSString *)configureTheChartTypeWithIntenger:(NSInteger)intenger {
    AAChartType chartType;
    
    switch (self.chartType) {
        case SpecialChartVCChartTypeColorfulColumnChart:
            chartType = @"colorfulColumnChart";
            break;
        case SpecialChartVCChartTypeGradientColorBar:
            chartType = @"gradientColorBar";
            break;
        case SpecialChartVCChartTypeMixedLine:
            chartType = AAChartTypeLine;
            break;
        case SpecialChartVCChartTypeArea:
            chartType = AAChartTypeArea;
            break;
        case SpecialChartVCChartTypeAreaspline:
            chartType = AAChartTypeAreaspline;
            break;
        case SpecialChartVCChartTypePie:
            chartType = AAChartTypePie;
            break;
        case SpecialChartVCChartTypeBubble:
            chartType = AAChartTypeBubble;
            break;
        case SpecialChartVCChartTypeScatter:
            chartType = AAChartTypeScatter;
            break;
        case SpecialChartVCChartTypeArearange:
            chartType = AAChartTypeArearange;
            break;
        case SpecialChartVCChartTypeAreasplinerange:
            chartType = AAChartTypeAreasplinerange;
            break;
        case SpecialChartVCChartTypeColumnrange:
            chartType = AAChartTypeColumnrange;
            break;
        case SpecialChartVCChartTypeStepLine:
            chartType = @"stepLine";
            break;
        case SpecialChartVCChartTypeStepArea:
            chartType = @"stepArea";
            break;
        case SpecialChartVCChartTypeNightingaleRoseChart:
            chartType = @"NightingaleRoseChart";
            break;
        case SpecialChartVCChartTypeBoxplot:
            chartType = AAChartTypeBoxplot;
            break;
        case SpecialChartVCChartTypeWaterfall:
            chartType = AAChartTypeWaterfall;
            break;
        case SpecialChartVCChartTypePyramid:
            chartType = AAChartTypePyramid;
            break;
        case SpecialChartVCChartTypeFunnel:
            chartType = AAChartTypeFunnel;
            break;
            
        default:
            break;
    }
    return chartType;
}

- (void)setUpTheChartView:(AAChartType)chartType {
    
    self.aaChartView = [[AAChartView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.view.backgroundColor = [UIColor whiteColor];
    self.aaChartView.scrollEnabled = NO;
    self.aaChartView.contentHeight = self.aaChartView.frame.size.height-80;
    [self.view addSubview:self.aaChartView];
    
    self.aaChartModel = [self configureTheChartModel:chartType];
//    self.aaChartModel.colorsTheme = [self configureTheRandomColorArray];

    
    [self.aaChartView aa_drawChartWithChartModel:_aaChartModel];
}

- (NSArray *)configureTheRandomColorArrayWithColorNumber:(NSInteger)colorNumber {
    NSMutableArray *colorStringArr = [[NSMutableArray alloc]init];
    for (int i=0; i < colorNumber; i++) {
        int R = (arc4random() % 256) ;
        int G = (arc4random() % 256) ;
        int B = (arc4random() % 256) ;
        NSString *colorStr = [NSString stringWithFormat:@"rgba(%d,%d,%d,0.9)",R,G,B];
        [colorStringArr addObject:colorStr];
    }
    return colorStringArr;
}


- (AAChartModel *)configureTheChartModel:(NSString *)chartType {
    if ([chartType isEqualToString:@"colorfulColumnChart"]) {
        
        AAChartModel *aaChartModel = AAChartModel.new
        .chartTypeSet(AAChartTypeColumn)
        .titleSet(@"Colorful Column Chart")
        .subtitleSet(@"single data array colorful column chart")
        .colorsThemeSet([self configureTheRandomColorArrayWithColorNumber:14])
        .gradientColorsThemeEnabledSet(true)
        .seriesSet(@[AASeriesElement.new
                     .nameSet(@"ElementOne")
                     .dataSet(@[@211,@183,@157,@133,@111,@91,@73,@57,@43,@31,@21,@13,@7,@3])
                     .colorByPointSet((id)@(true)),//When using automatic point colors pulled from the options.colors collection, this option determines whether the chart should receive one color per series or one color per point. Default Value：false.
                     ]
                   );
        
        return aaChartModel;
        
    } else if ([chartType isEqualToString:@"gradientColorBar"]) {
        
        NSDictionary *gradientColorDic1 =
        @{
          @"linearGradient": @{
                  @"x1": @0,
                  @"y1": @0,
                  @"x2": @0,
                  @"y2": @1
                  },
          @"stops": @[@[@0,@"#8A2BE2"],
                      @[@1,@"#1E90FF"]]//颜色字符串设置支持十六进制类型和 rgba 类型
          };
        
        
        NSDictionary *gradientColorDic2 =
        @{
          @"linearGradient": @{
                  @"x1": @0,
                  @"y1": @1,
                  @"x2": @0,
                  @"y2": @0
                  },
          @"stops": @[@[@0,@"rgba(255,140,0,0.2)"],
                      @[@1,@"rgba(220,20,60,1)"]]//颜色字符串设置支持十六进制类型和 rgba 类型
          };
        
        AAChartModel *aaChartModel = AAChartModel.new
        .chartTypeSet(AAChartTypeBar)
        .titleSet(@"Bar Chart")
        .subtitleSet(@"gradient color bar")
        .borderRadiusSet(@5)
        .xAxisReversedSet(true)
        .seriesSet(@[
                     AASeriesElement.new
                     .nameSet(@"2020")
                     .dataSet(@[@211,@183,@157,@133,@111,@91,@73,@57,@43,@31,@21,@13,@7,@3])
                     .colorSet((id)gradientColorDic1),
                     AASeriesElement.new
                     .nameSet(@"2021")
                     .dataSet(@[@111,@83,@187,@163,@151,@191,@173,@157,@143,@131,@121,@113,@97,@93])
                     .colorSet((id)gradientColorDic2),
                     ]
                   );
        
        return aaChartModel;
        
    } else if ([chartType isEqualToString:AAChartTypeLine]) {
        
        AAChartModel *aaChartModel = AAChartModel.new
        //.connectNullsSet(true)//设置折线是否断点重连
        .chartTypeSet(chartType)
        .titleSet(@"")
        .subtitleSet(@"虚拟数据")
        .categoriesSet(@[@"Java",@"Swift",@"Python",@"Ruby", @"PHP",@"Go",@"C",@"C#",@"C++",@"Perl",@"R",@"MATLAB",@"SQL"])
        .yAxisTitleSet(@"摄氏度")
        .dataLabelEnabledSet(true)
        .seriesSet(@[AASeriesElement.new
                     .nameSet(@"本专业")
                     .dataSet(@[@45,@88,@49,@43,@65,@56,@47,@28,@49,@44,@89,@55])
                     .zoneAxisSet(@"x")
                     .zonesSet(@[
                                 @{@"value": @8},
                                 @{@"dashStyle": AALineDashSyleTypeDash}
                                 ]),
                     AASeriesElement.new
                     .nameSet(@"所有专业")
                     .dataSet(@[[NSNull null],[NSNull null],@100,@109,@89,[NSNull null],[NSNull null],@120,[NSNull null],[NSNull null],[NSNull null],[NSNull null]])
                     ]);
        
        return aaChartModel;
        
    } else if ([chartType isEqualToString:AAChartTypeArea]) {
        
        AAChartModel *aaChartModel = AAChartModel.new
        .chartTypeSet(AAChartTypeArea)
        .symbolSet(AAChartSymbolTypeCircle)
        .titleSet(@"带有数据阈值标志线的区域填充图")
        .markerRadiusSet(@6)//设置折线连接点宽度为0,即是隐藏连接点
        .subtitleSet(@"横屏查看效果更佳")
        .yAxisGridLineWidthSet(@0.5)
        .yAxisTitleSet(@"")
        .symbolStyleSet(AAChartSymbolStyleTypeInnerBlank)
        .dataLabelEnabledSet(true)
        .seriesSet(@[AASeriesElement.new
                     .nameSet(@"2017")
                     .dataSet(@[@7.0, @6.9, @9.5, @14.5, @18.2, @21.5, @25.2, @26.5, @23.3, @18.3, @13.9, @9.6,])
                     .lineWidthSet(@5)
                     .zonesSet(@[@{
                                    @"value": @10,
                                    @"color": @"#EA007B"
                                    }, @{
                                    @"value": @20,
                                    @"color": @"#FDC20A"
                                    }, @{
                                    @"color": @"#F78320"
                                    }])
                     ,]
                   )
        .yAxisPlotLinesSet(@[
                            AAPlotLinesElement.new
                             .colorSet(@"#FF0000")//颜色值(16进制)
                             .dashStyleSet(AALineDashSyleTypeLongDashDotDot)//样式：Dash,Dot,Solid等,默认Solid
                             .widthSet(@(1)) //标示线粗细
                             .valueSet(@(10)) //所在位置
                             .zIndexSet(@(1)) //层叠,标示线在图表中显示的层叠级别，值越大，显示越向前
                             .labelSet(@{@"text":@"标示线1",@"x":@(0),@"style":@{@"color":@"#33bdfd"}})/*这里其实也可以像AAPlotLinesElement这样定义个对象来赋值（偷点懒直接用了字典，最会终转为js代码，可参考https://www.hcharts.cn/docs/basic-plotLines来写字典）*/
                             ,
                            AAPlotLinesElement.new
                             .colorSet(@"#FF0000")
                             .dashStyleSet(AALineDashSyleTypeLongDashDotDot)
                             .widthSet(@(1))
                             .valueSet(@(20))
                             .labelSet(@{@"text":@"标示线2",@"x":@(0),@"style":@{@"color":@"#33bdfd"}})
                             ]
                           )
        ;
        
        return aaChartModel;
        
    } else if ([chartType isEqualToString:AAChartTypeAreaspline]) {
        
        AAChartModel *aaChartModel = AAChartModel.new
        .chartTypeSet(chartType)
        .gradientColorsThemeEnabledSet(true)
        //.dataLabelEnabledSet(true)
        .titleSet(@"带有负数的区域填充图")
        .markerRadiusSet(@0)//设置折线连接点宽度为0,即是隐藏连接点
        .subtitleSet(@"横屏查看效果更佳")
        .yAxisGridLineWidthSet(@0)
        .categoriesSet(@[@"Java",@"Swift",@"Python",@"Ruby", @"PHP",@"Go",@"C",@"C#",@"C++",@"HTML",@"CSS",@"Perl",@"R",@"MATLAB",@"SQL"])
        .yAxisTitleSet(@"")
        .colorsThemeSet(@[@"#49C1B6", @"#FDC20A", @"#F78320", @"#068E81", @"#EA007B"])
        .seriesSet(@[
                     AASeriesElement.new
                     .nameSet(@"2017")
                     .dataSet(@[@0, @(-7.5), @(-1.0), @3.7, @0, @(-3), @8, @0,@(-3.6), @4, @(-2), @0]),
                     AASeriesElement.new
                     .nameSet(@"2018")
                     .dataSet(@[@0, @(-2.2), @2, @(-2.2), @0, @(-1.5), @0, @2.4, @(-1), @3, @(-1), @0]),
                     AASeriesElement.new
                     .nameSet(@"2019")
                     .dataSet(@[@0, @2.3, @0, @1.2, @(-1), @3, @0, @(-3.3), @0, @2, @(-0.3), @0]),
                     AASeriesElement.new
                     .nameSet(@"2020")
                     .dataSet(@[@0, @10, @0.13,@2,@0, @2, @0, @3.7, @0, @1, @(-3), @0]),
                     AASeriesElement.new
                     .nameSet(@"2020")
                     .dataSet(@[@0, @(-4.5), @(-0.9), @5.5, @(-1.9), @1.3, @(-2.8), @0, @(-1.7), @0, @3, @0, ]),
                     ]
                   )
        ;
        
        return aaChartModel;
        
    }  else if ([chartType isEqualToString:AAChartTypePie]) {
        
        bool bool_false = false;
        
        AAChartModel *aaChartModel= AAChartModel.new
        .chartTypeSet(AAChartTypePie)
        .colorsThemeSet(@[@"#0c9674",@"#7dffc0",@"#d11b5f",@"#facd32",@"#ffffa0",@"#EA007B"])
        .titleSet(@"")
        .subtitleSet(@"")
        .dataLabelEnabledSet(true)//是否直接显示扇形图数据
        .yAxisTitleSet(@"摄氏度")
        .seriesSet(
                   @[
                     AASeriesElement.new
                     .nameSet(@"语言热度值")
                     .innerSizeSet(@"20%")//内部圆环半径大小占比
                     .sizeSet(@300)//尺寸大小
                     .borderWidthSet(@0)//描边的宽度
                     .allowPointSelectSet(false)//是否允许在点击数据点标记(扇形图点击选中的块发生位移)
                     .statesSet(@{@"hover": @{@"enabled": @(bool_false)}})//禁用点击区块之后出现的半透明遮罩层 (先定义bool变量的原因是，直接用true，false，处理完成之后容易变成0或者1。https://www.cnblogs.com/haojuncong/p/4652998.html )
                     .dataSet(
                              @[
                                @[@"Firefox",   @3336.2],
                                @[@"IE",        @26.8],
                                @{
                                    @"name":@"Chrome",
                                    @"y":@100.8,
                                    @"sliced":@(true),
                                    @"selected":@(true)
                                    },
                                @[@"Safari",    @88.5],
                                @[@"Opera",     @46.0],
                                @[@"Others",    @223]
                                ]
                              ),
                     ]
                   )
        ;
        
        return aaChartModel;
        
    } else if ([chartType isEqualToString:AAChartTypeBubble]) {
        
        AAChartModel *aaChartModel= AAChartModel.new
        .chartTypeSet(AAChartTypeBubble)
        .titleSet(@"Bubble")
        .subtitleSet(@"Virtual data")
        .yAxisTitleSet(@"℃")
        .gradientColorsThemeEnabledSet(true)
        .yAxisGridLineWidthSet(@0)
        .colorsThemeSet(@[@"#0c9674",@"#7dffc0",@"#d11b5f",@"#facd32",@"#ffffa0",@"#EA007B"])
        .seriesSet(
                   @[
                     AASeriesElement.new
                     .nameSet(@"2017")
                     .dataSet(
                              @[
                                @[@97, @36, @79],
                                @[@94, @74, @60],
                                @[@68, @76, @58],
                                @[@64, @87, @56],
                                @[@68, @27, @73],
                                @[@74, @99, @42],
                                @[@7 , @93, @87],
                                @[@51, @69, @40],
                                @[@38, @23, @33],
                                @[@57, @86, @31]
                                ]),
                     
                     AASeriesElement.new
                     .nameSet(@"2018")
                     .dataSet(
                              @[
                                @[@25, @10, @87],
                                @[@2 , @75, @59],
                                @[@11, @54, @8 ],
                                @[@86, @55, @93],
                                @[@5 , @3 , @58],
                                @[@90, @63, @44],
                                @[@91, @33, @17],
                                @[@97, @3 , @56],
                                @[@15, @67, @48],
                                @[@54, @25, @81]
                                ]),
                     
                     AASeriesElement.new
                     .nameSet(@"2019")
                     .dataSet(
                              @[
                                @[@47, @47, @21],
                                @[@20, @12, @4 ],
                                @[@6 , @76, @91],
                                @[@38, @30, @60],
                                @[@57, @98, @64],
                                @[@61, @17, @80],
                                @[@83, @60, @13],
                                @[@67, @78, @75],
                                @[@64, @12, @10],
                                @[@30, @77, @82]
                                ]),
                     ]
                   )
        ;
        
        return aaChartModel;
        
    } else if ([chartType isEqualToString:AAChartTypeScatter]) {
        
        AAChartModel *aaChartModel= AAChartModel.new
        .chartTypeSet(AAChartTypeScatter)
        .titleSet(@"按性别划分的身高体重分布图")
        .yAxisTitleSet(@"千克(kg)")
        .markerRadiusSet(@9)
        .yAxisGridLineWidthSet(@0)
        .colorsThemeSet(@[@"#c3b1fb",@"#e70b2d",@"#77ed00",@"#00f3d2",@"#83ddff",])
        .symbolStyleSet(AAChartSymbolStyleTypeInnerBlank)
        .symbolSet(AAChartSymbolTypeCircle)
        .markerRadiusSet(@9)
        .backgroundColorSet(@"#000000")
        .seriesSet(
                   @[
                     AASeriesElement.new
                     .nameSet(@"男")
                     .dataSet(@[
                                @[@161.2, @51.6], @[@167.5, @59.0], @[@159.5, @49.2], @[@157.0, @63.0], @[@155.8, @53.6],
                                @[@170.0, @59.0], @[@159.1, @47.6], @[@166.0, @69.8], @[@176.2, @66.8], @[@160.2, @75.2],
                                @[@172.5, @55.2], @[@170.9, @54.2], @[@172.9, @62.5], @[@153.4, @42.0], @[@160.0, @50.0],
                                @[@147.2, @49.8], @[@168.2, @49.2], @[@175.0, @73.2], @[@157.0, @47.8], @[@167.6, @68.8],
                                @[@159.5, @50.6], @[@175.0, @82.5], @[@166.8, @57.2], @[@176.5, @87.8], @[@170.2, @72.8],
                                @[@174.0, @54.5], @[@173.0, @59.8], @[@179.9, @67.3], @[@170.5, @67.8], @[@160.0, @47.0],
                                @[@154.4, @46.2], @[@162.0, @55.0], @[@176.5, @83.0], @[@160.0, @54.4], @[@152.0, @45.8],
                                @[@162.1, @53.6], @[@170.0, @73.2], @[@160.2, @52.1], @[@161.3, @67.9], @[@166.4, @56.6],
                                @[@168.9, @62.3], @[@163.8, @58.5], @[@167.6, @54.5], @[@160.0, @50.2], @[@161.3, @60.3],
                                @[@167.6, @58.3], @[@165.1, @56.2], @[@160.0, @50.2], @[@170.0, @72.9], @[@157.5, @59.8],
                                @[@167.6, @61.0], @[@160.7, @69.1], @[@163.2, @55.9], @[@152.4, @46.5], @[@157.5, @54.3],
                                @[@168.3, @54.8], @[@180.3, @60.7], @[@165.5, @60.0], @[@165.0, @62.0], @[@164.5, @60.3],
                                @[@156.0, @52.7], @[@160.0, @74.3], @[@163.0, @62.0], @[@165.7, @73.1], @[@161.0, @80.0],
                                @[@162.0, @54.7], @[@166.0, @53.2], @[@174.0, @75.7], @[@172.7, @61.1], @[@167.6, @55.7],
                                @[@151.1, @48.7], @[@164.5, @52.3], @[@163.5, @50.0], @[@152.0, @59.3], @[@169.0, @62.5],
                                @[@164.0, @55.7], @[@161.2, @54.8], @[@155.0, @45.9], @[@170.0, @70.6], @[@176.2, @67.2],
                                @[@170.0, @69.4], @[@162.5, @58.2], @[@170.3, @64.8], @[@164.1, @71.6], @[@169.5, @52.8],
                                @[@163.2, @59.8], @[@154.5, @49.0], @[@159.8, @50.0], @[@173.2, @69.2], @[@170.0, @55.9],
                                @[@161.4, @63.4], @[@169.0, @58.2], @[@166.2, @58.6], @[@159.4, @45.7], @[@162.5, @52.2],
                                @[@159.0, @48.6], @[@162.8, @57.8], @[@159.0, @55.6], @[@179.8, @66.8], @[@162.9, @59.4],
                                @[@161.0, @53.6], @[@151.1, @73.2], @[@168.2, @53.4], @[@168.9, @69.0], @[@173.2, @58.4],
                                @[@171.8, @56.2], @[@178.0, @70.6], @[@164.3, @59.8], @[@163.0, @72.0], @[@168.5, @65.2],
                                @[@166.8, @56.6], @[@172.7, @93.3], @[@163.5, @51.8], @[@169.4, @63.4], @[@167.8, @59.0],
                                @[@159.5, @47.6], @[@167.6, @63.0], @[@161.2, @55.2], @[@160.0, @45.0], @[@163.2, @54.0],
                                @[@162.2, @50.2], @[@161.3, @60.2], @[@149.5, @44.8], @[@157.5, @58.8], @[@163.2, @56.4],
                                @[@172.7, @62.0], @[@155.0, @49.2], @[@156.5, @67.2], @[@164.0, @53.8], @[@160.9, @54.4],
                                @[@162.8, @58.0], @[@167.0, @59.8], @[@160.0, @54.8], @[@160.0, @43.2], @[@168.9, @60.5],
                                @[@158.2, @46.4], @[@156.0, @64.4], @[@160.0, @48.8], @[@167.1, @62.2], @[@158.0, @55.5],
                                @[@167.6, @57.8], @[@156.0, @54.6], @[@162.1, @59.2], @[@173.4, @52.7], @[@159.8, @53.2],
                                @[@170.5, @64.5], @[@159.2, @51.8], @[@157.5, @56.0], @[@161.3, @63.6], @[@162.6, @63.2],
                                @[@160.0, @59.5], @[@168.9, @56.8], @[@165.1, @64.1], @[@162.6, @50.0], @[@165.1, @72.3],
                                @[@166.4, @55.0], @[@160.0, @55.9], @[@152.4, @60.4], @[@170.2, @69.1], @[@162.6, @84.5],
                                @[@170.2, @55.9], @[@158.8, @55.5], @[@172.7, @69.5], @[@167.6, @76.4], @[@162.6, @61.4],
                                @[@167.6, @65.9], @[@156.2, @58.6], @[@175.2, @66.8], @[@172.1, @56.6], @[@162.6, @58.6],
                                @[@160.0, @55.9], @[@165.1, @59.1], @[@182.9, @81.8], @[@166.4, @70.7], @[@165.1, @56.8],
                                @[@177.8, @60.0], @[@165.1, @58.2], @[@175.3, @72.7], @[@154.9, @54.1], @[@158.8, @49.1],
                                @[@172.7, @75.9], @[@168.9, @55.0], @[@161.3, @57.3], @[@167.6, @55.0], @[@165.1, @65.5],
                                @[@175.3, @65.5], @[@157.5, @48.6], @[@163.8, @58.6], @[@167.6, @63.6], @[@165.1, @55.2],
                                @[@165.1, @62.7], @[@168.9, @56.6], @[@162.6, @53.9], @[@164.5, @63.2], @[@176.5, @73.6],
                                @[@168.9, @62.0], @[@175.3, @63.6], @[@159.4, @53.2], @[@160.0, @53.4], @[@170.2, @55.0],
                                @[@162.6, @70.5], @[@167.6, @54.5], @[@162.6, @54.5], @[@160.7, @55.9], @[@160.0, @59.0],
                                @[@157.5, @63.6], @[@162.6, @54.5], @[@152.4, @47.3], @[@170.2, @67.7], @[@165.1, @80.9],
                                @[@172.7, @70.5], @[@165.1, @60.9], @[@170.2, @63.6], @[@170.2, @54.5], @[@170.2, @59.1],
                                @[@161.3, @70.5], @[@167.6, @52.7], @[@167.6, @62.7], @[@165.1, @86.3], @[@162.6, @66.4],
                                @[@152.4, @67.3], @[@168.9, @63.0], @[@170.2, @73.6], @[@175.2, @62.3], @[@175.2, @57.7],
                                @[@160.0, @55.4], @[@165.1, @94.4], @[@174.0, @55.5], @[@170.2, @77.3], @[@160.0, @80.5],
                                @[@167.6, @64.5], @[@167.6, @72.3], @[@167.6, @61.4], @[@154.9, @58.2], @[@162.6, @81.8],
                                @[@175.3, @63.6], @[@171.4, @53.4], @[@157.5, @54.5], @[@165.1, @53.6], @[@160.0, @60.0],
                                @[@174.0, @73.6], @[@162.6, @61.4], @[@174.0, @55.5], @[@162.6, @63.6], @[@161.3, @60.9],
                                @[@156.2, @60.0], @[@149.9, @46.8], @[@169.5, @57.3], @[@160.0, @64.1], @[@175.3, @63.6],
                                @[@169.5, @67.3], @[@160.0, @75.5], @[@172.7, @68.2], @[@162.6, @61.4], @[@157.5, @76.8],
                                @[@176.5, @71.8], @[@164.4, @55.5], @[@160.7, @48.6], @[@174.0, @66.4], @[@163.8, @67.3]
                                ]),
                     
                     AASeriesElement.new
                     .nameSet(@"女")
                     .dataSet(@[
                                @[@174.0, @65.6], @[@175.3, @71.8], @[@193.5, @80.7], @[@186.5, @72.6], @[@187.2, @78.8],
                                @[@181.5, @74.8], @[@184.0, @86.4], @[@184.5, @78.4], @[@175.0, @62.0], @[@184.0, @81.6],
                                @[@180.0, @76.6], @[@177.8, @83.6], @[@192.0, @90.0], @[@176.0, @74.6], @[@174.0, @71.0],
                                @[@184.0, @79.6], @[@192.7, @93.8], @[@171.5, @70.0], @[@173.0, @72.4], @[@176.0, @85.9],
                                @[@176.0, @78.8], @[@180.5, @77.8], @[@172.7, @66.2], @[@176.0, @86.4], @[@173.5, @81.8],
                                @[@178.0, @89.6], @[@180.3, @82.8], @[@180.3, @76.4], @[@164.5, @63.2], @[@173.0, @60.9],
                                @[@183.5, @74.8], @[@175.5, @70.0], @[@188.0, @72.4], @[@189.2, @84.1], @[@172.8, @69.1],
                                @[@170.0, @59.5], @[@182.0, @67.2], @[@170.0, @61.3], @[@177.8, @68.6], @[@184.2, @80.1],
                                @[@186.7, @87.8], @[@171.4, @84.7], @[@172.7, @73.4], @[@175.3, @72.1], @[@180.3, @82.6],
                                @[@182.9, @88.7], @[@188.0, @84.1], @[@177.2, @94.1], @[@172.1, @74.9], @[@167.0, @59.1],
                                @[@169.5, @75.6], @[@174.0, @86.2], @[@172.7, @75.3], @[@182.2, @87.1], @[@164.1, @55.2],
                                @[@163.0, @57.0], @[@171.5, @61.4], @[@184.2, @76.8], @[@174.0, @86.8], @[@174.0, @72.2],
                                @[@177.0, @71.6], @[@186.0, @84.8], @[@167.0, @68.2], @[@171.8, @66.1], @[@182.0, @72.0],
                                @[@167.0, @64.6], @[@177.8, @74.8], @[@164.5, @70.0], @[@192.0, @92.2], @[@175.5, @63.2],
                                @[@171.2, @79.1], @[@181.6, @78.9], @[@167.4, @67.7], @[@181.1, @66.0], @[@177.0, @68.2],
                                @[@174.5, @63.9], @[@177.5, @72.0], @[@170.5, @56.8], @[@182.4, @74.5], @[@197.1, @90.9],
                                @[@180.1, @93.0], @[@175.5, @80.9], @[@180.6, @72.7], @[@184.4, @68.0], @[@175.5, @70.9],
                                @[@180.6, @72.5], @[@177.0, @72.5], @[@177.1, @83.4], @[@181.6, @75.5], @[@176.5, @73.0],
                                @[@175.0, @70.2], @[@174.0, @73.4], @[@165.1, @70.5], @[@177.0, @68.9], @[@192.0, @99.9],
                                @[@176.5, @68.4], @[@169.4, @65.9], @[@182.1, @75.7], @[@179.8, @84.5], @[@175.3, @87.7],
                                @[@184.9, @86.4], @[@177.3, @73.2], @[@167.4, @53.9], @[@178.1, @72.0], @[@168.9, @55.5],
                                @[@157.2, @58.4], @[@180.3, @83.2], @[@170.2, @72.7], @[@177.8, @64.1], @[@172.7, @72.3],
                                @[@165.1, @65.0], @[@186.7, @86.4], @[@165.1, @65.0], @[@174.0, @88.6], @[@175.3, @84.1],
                                @[@185.4, @66.8], @[@177.8, @75.5], @[@180.3, @93.2], @[@180.3, @82.7], @[@177.8, @58.0],
                                @[@177.8, @79.5], @[@177.8, @78.6], @[@177.8, @71.8], @[@177.8, @116 ], @[@163.8, @72.2],
                                @[@188.0, @83.6], @[@198.1, @85.5], @[@175.3, @90.9], @[@166.4, @85.9], @[@190.5, @89.1],
                                @[@166.4, @75.0], @[@177.8, @77.7], @[@179.7, @86.4], @[@172.7, @90.9], @[@190.5, @73.6],
                                @[@185.4, @76.4], @[@168.9, @69.1], @[@167.6, @84.5], @[@175.3, @64.5], @[@170.2, @69.1],
                                @[@190.5, @96.6], @[@177.8, @86.4], @[@190.5, @80.9], @[@177.8, @87.7], @[@184.2, @94.5],
                                @[@176.5, @80.2], @[@177.8, @72.0], @[@180.3, @71.4], @[@171.4, @72.7], @[@172.7, @84.1],
                                @[@172.7, @76.8], @[@177.8, @63.6], @[@177.8, @80.9], @[@182.9, @80.9], @[@170.2, @85.5],
                                @[@167.6, @68.6], @[@175.3, @67.7], @[@165.1, @66.4], @[@185.4, @99.9], @[@181.6, @70.5],
                                @[@172.7, @95.9], @[@190.5, @84.1], @[@179.1, @87.3], @[@175.3, @71.8], @[@170.2, @65.9],
                                @[@193.0, @95.9], @[@171.4, @91.4], @[@177.8, @81.8], @[@177.8, @96.8], @[@167.6, @69.1],
                                @[@167.6, @82.7], @[@180.3, @75.5], @[@182.9, @79.5], @[@176.5, @73.6], @[@186.7, @91.8],
                                @[@188.0, @84.1], @[@188.0, @85.9], @[@177.8, @81.8], @[@174.0, @82.5], @[@177.8, @80.5],
                                @[@171.4, @70.0], @[@185.4, @81.8], @[@185.4, @84.1], @[@188.0, @90.5], @[@188.0, @91.4],
                                @[@182.9, @89.1], @[@176.5, @85.0], @[@175.3, @69.1], @[@175.3, @73.6], @[@188.0, @80.5],
                                @[@188.0, @82.7], @[@175.3, @86.4], @[@170.5, @67.7], @[@179.1, @92.7], @[@177.8, @93.6],
                                @[@175.3, @70.9], @[@182.9, @75.0], @[@170.8, @93.2], @[@188.0, @93.2], @[@180.3, @77.7],
                                @[@177.8, @61.4], @[@185.4, @94.1], @[@168.9, @75.0], @[@185.4, @83.6], @[@180.3, @85.5],
                                @[@174.0, @73.9], @[@167.6, @66.8], @[@182.9, @87.3], @[@160.0, @72.3], @[@180.3, @88.6],
                                @[@167.6, @75.5], @[@186.7, @95.5], @[@175.3, @91.1], @[@175.3, @67.3], @[@175.9, @77.7],
                                @[@175.3, @81.8], @[@179.1, @75.5], @[@181.6, @84.5], @[@177.8, @76.6], @[@182.9, @85.0],
                                @[@177.8, @98.8], @[@184.2, @77.3], @[@179.1, @71.8], @[@176.5, @87.9], @[@188.0, @94.3],
                                @[@174.0, @70.9], @[@167.6, @64.5], @[@170.2, @77.3], @[@167.6, @72.3], @[@188.0, @87.3],
                                @[@174.0, @80.0], @[@176.5, @82.3], @[@180.3, @73.6], @[@167.6, @74.1], @[@188.0, @85.9],
                                @[@180.3, @73.2], @[@167.6, @76.3], @[@183.0, @65.9], @[@183.0, @90.9], @[@179.1, @89.1],
                                @[@170.2, @62.3], @[@177.8, @82.7], @[@179.1, @79.1], @[@190.5, @98.2], @[@177.8, @84.1],
                                @[@180.3, @83.2], @[@180.3, @83.2]
                                ])
                     
                     ]
                   )
        ;
        
        return aaChartModel;
        
    }  else if ([chartType isEqualToString:AAChartTypeArearange]) {
        
        AAChartModel *aaChartModel = AAChartModel.new
        .chartTypeSet(AAChartTypeArearange)
        .titleSet(@"黄昏别馆日气温起伏图")
        .subtitleSet(@"实时监测")
        .yAxisTitleSet(@"摄氏度")
        .xAxisVisibleSet(false)
        .dataLabelEnabledSet(false)
        .seriesSet(
                   @[
                     AASeriesElement.new
                     .nameSet(@"2020")
                     .typeSet(AAChartTypeArearange)
                     .dataSet(@[
                                /* 2014-01-01 */
                                @[@1388538000000, @1.1,  @4.7],
                                @[@1388624400000, @1.8,  @6.4],
                                @[@1388710800000, @1.7,  @6.9],
                                @[@1388797200000, @2.6,  @7.4],
                                @[@1388883600000, @3.3,  @9.3],
                                @[@1388970000000, @3.0,  @7.9],
                                @[@1389056400000, @3.9,  @6.0],
                                @[@1389142800000, @3.9,  @5.5],
                                @[@1389229200000, @-0.6, @4.5],
                                @[@1389315600000, @-0.5, @5.3],
                                @[@1389402000000, @-0.3, @2.4],
                                @[@1389488400000, @-6.5,@-0.4],
                                @[@1389574800000, @-7.3,@-3.4],
                                @[@1389661200000, @-7.3,@-2.3],
                                @[@1389747600000, @-7.9,@-4.2],
                                @[@1389834000000, @-4.7, @0.9],
                                @[@1389920400000, @-1.2, @0.4],
                                @[@1390006800000, @-2.3,@-0.1],
                                @[@1390093200000, @-2.0, @0.3],
                                @[@1390179600000, @-5.1,@-2.0],
                                @[@1390266000000, @-4.4,@-0.5],
                                @[@1390352400000, @-6.4,@-2.7],
                                @[@1390438800000, @-3.2,@-0.5],
                                @[@1390525200000, @-5.5,@-0.8],
                                @[@1390611600000, @-4.4, @2.4],
                                @[@1390698000000, @-4.0, @1.1],
                                @[@1390784400000, @-3.4, @0.8],
                                @[@1390870800000, @-1.7, @2.6],
                                @[@1390957200000, @-3.1, @3.9],
                                @[@1391043600000, @-4.8,@-1.9],
                                @[@1391130000000, @-7.0,@-2.8],
                                /* 2014-02-01 */
                                @[@1391216400000, @-2.7, @2.6],
                                @[@1391302800000, @-1.3, @8.2],
                                @[@1391389200000, @1.5,  @7.7],
                                @[@1391475600000, @-0.5, @5.3],
                                @[@1391562000000, @-0.2, @5.2],
                                @[@1391648400000, @0.7,  @4.8],
                                @[@1391734800000, @0.9,  @5.7],
                                @[@1391821200000, @1.7,  @3.9],
                                @[@1391907600000, @2.2,  @8.8],
                                @[@1391994000000, @3.0,  @6.6],
                                @[@1392080400000, @1.4,  @5.4],
                                @[@1392166800000, @0.6,  @5.1],
                                @[@1392253200000, @0.1,  @7.8],
                                @[@1392339600000, @3.4,  @7.3],
                                @[@1392426000000, @2.0,  @5.9],
                                @[@1392512400000, @1.1,  @4.7],
                                @[@1392598800000, @1.1,  @4.4],
                                @[@1392685200000, @-2.8, @2.6],
                                @[@1392771600000, @-5.0, @0.1],
                                @[@1392858000000, @-5.7, @0.2],
                                @[@1392944400000, @-0.7, @3.9],
                                @[@1393030800000, @1.5,  @7.8],
                                @[@1393117200000, @5.5,  @8.8],
                                @[@1393203600000, @5.3, @11.7],
                                @[@1393290000000, @1.7, @11.1],
                                @[@1393376400000, @3.4,  @9.3],
                                @[@1393462800000, @3.4,  @7.3],
                                @[@1393549200000, @4.5,  @8.0],
                                /* 2014-03-01 */
                                @[@1393635600000, @2.1,  @8.9],
                                @[@1393722000000, @0.6,  @6.1],
                                @[@1393808400000, @1.2,  @9.4],
                                @[@1393894800000, @2.6,  @7.3],
                                @[@1393981200000, @3.9,  @9.5],
                                @[@1394067600000, @5.3,  @9.9],
                                @[@1394154000000, @2.7,  @7.1],
                                @[@1394240400000, @4.0,  @8.6],
                                @[@1394326800000, @6.1, @10.7],
                                @[@1394413200000, @4.2,  @7.6],
                                @[@1394499600000, @2.5,  @9.0],
                                @[@1394586000000, @0.2,  @7.0],
                                @[@1394672400000, @-1.2, @6.9],
                                @[@1394758800000, @0.4,  @6.7],
                                @[@1394845200000, @0.2,  @5.1],
                                @[@1394931600000, @-0.1, @6.0],
                                @[@1395018000000, @1.0,  @5.6],
                                @[@1395104400000, @-1.1, @6.3],
                                @[@1395190800000, @-1.9, @0.3],
                                @[@1395277200000, @0.3,  @4.5],
                                @[@1395363600000, @2.4,  @6.7],
                                @[@1395450000000, @3.2,  @9.2],
                                @[@1395536400000, @1.7,  @3.6],
                                @[@1395622800000, @-0.3, @7.9],
                                @[@1395709200000, @-2.4, @8.6],
                                @[@1395795600000, @-1.7,@10.3],
                                @[@1395882000000, @4.1, @10.0],
                                @[@1395968400000, @4.4, @14.0],
                                @[@1396054800000, @3.3, @11.0],
                                @[@1396141200000, @3.0, @12.5],
                                @[@1396224000000, @1.4, @10.4],
                                /* 2014-04-01 */
                                @[@1396310400000, @-1.2, @8.8],
                                @[@1396396800000, @2.2,  @7.6],
                                @[@1396483200000, @-1.0,@10.1],
                                @[@1396569600000, @-1.8, @9.5],
                                @[@1396656000000, @0.2,  @7.7],
                                @[@1396742400000, @3.7,  @6.4],
                                @[@1396828800000, @5.8, @11.4],
                                @[@1396915200000, @5.4,  @8.7],
                                @[@1397001600000, @4.5, @12.2],
                                @[@1397088000000, @3.9,  @8.4],
                                @[@1397174400000, @4.5,  @8.0],
                                @[@1397260800000, @6.6,  @8.4],
                                @[@1397347200000, @3.7,  @7.3],
                                @[@1397433600000, @3.6,  @6.7],
                                @[@1397520000000, @3.5,  @8.3],
                                @[@1397606400000, @1.5, @10.2],
                                @[@1397692800000, @4.9,  @9.4],
                                @[@1397779200000, @3.5, @12.0],
                                @[@1397865600000, @1.5, @13.1],
                                @[@1397952000000, @1.7, @15.6],
                                @[@1398038400000, @1.4, @16.0],
                                @[@1398124800000, @3.0, @18.4],
                                @[@1398211200000, @5.6, @18.8],
                                @[@1398297600000, @5.7, @17.2],
                                @[@1398384000000, @4.5, @16.4],
                                @[@1398470400000, @3.1, @17.6],
                                @[@1398556800000, @4.7, @18.9],
                                @[@1398643200000, @4.9, @16.6],
                                @[@1398729600000, @6.8, @15.6],
                                @[@1398816000000, @2.8,  @9.2],
                                /* 2014-05-01 */
                                @[@1398902400000, @-2.7,@10.5],
                                @[@1398988800000, @-1.9,@10.9],
                                @[@1399075200000, @4.5,  @8.5],
                                @[@1399161600000, @-0.6,@10.4],
                                @[@1399248000000, @4.0,  @9.7],
                                @[@1399334400000, @5.5,  @9.5],
                                @[@1399420800000, @6.5, @13.2],
                                @[@1399507200000, @3.2, @14.5],
                                @[@1399593600000, @2.1, @13.5],
                                @[@1399680000000, @6.5, @15.6],
                                @[@1399766400000, @5.7, @16.2],
                                @[@1399852800000, @6.3, @15.3],
                                @[@1399939200000, @5.3, @15.3],
                                @[@1400025600000, @6.0, @14.1],
                                @[@1400112000000, @1.9,  @7.7],
                                @[@1400198400000, @7.2,  @9.8],
                                @[@1400284800000, @8.9, @15.2],
                                @[@1400371200000, @9.1, @20.5],
                                @[@1400457600000, @8.4, @17.9],
                                @[@1400544000000, @6.8, @21.5],
                                @[@1400630400000, @7.6, @14.1],
                                @[@1400716800000, @11.1,@16.5],
                                @[@1400803200000, @9.3, @14.3],
                                @[@1400889600000, @10.4,@19.3],
                                @[@1400976000000, @5.7, @19.4],
                                @[@1401062400000, @7.9, @17.9],
                                @[@1401148800000, @5.0, @22.5],
                                @[@1401235200000, @7.6, @22.0],
                                @[@1401321600000, @5.7, @21.9],
                                @[@1401408000000, @4.6, @20.0],
                                @[@1401494400000, @7.0, @22.0],
                                /* 2014-06-01 */
                                @[@1401580800000, @5.1, @20.6],
                                @[@1401667200000, @6.6, @24.6],
                                @[@1401753600000, @9.7, @22.2],
                                @[@1401840000000, @9.6, @21.6],
                                @[@1401926400000, @13.0,@20.0],
                                @[@1402012800000, @12.9,@18.2],
                                @[@1402099200000, @8.5, @23.2],
                                @[@1402185600000, @9.2, @21.4],
                                @[@1402272000000, @10.5,@22.0],
                                @[@1402358400000, @7.3, @23.4],
                                @[@1402444800000, @12.1,@18.2],
                                @[@1402531200000, @11.1,@13.3],
                                @[@1402617600000, @10.0,@20.7],
                                @[@1402704000000, @5.8, @23.4],
                                @[@1402790400000, @7.4, @20.1],
                                @[@1402876800000, @10.3,@21.9],
                                @[@1402963200000, @7.8, @16.8],
                                @[@1403049600000, @11.6,@19.7],
                                @[@1403136000000, @9.8, @16.0],
                                @[@1403222400000, @10.7,@14.4],
                                @[@1403308800000, @9.0, @15.5],
                                @[@1403395200000, @5.1, @13.3],
                                @[@1403481600000, @10.0,@19.3],
                                @[@1403568000000, @5.2, @22.1],
                                @[@1403654400000, @6.3, @21.3],
                                @[@1403740800000, @5.5, @21.1],
                                @[@1403827200000, @8.4, @19.7],
                                @[@1403913600000, @7.1, @23.3],
                                @[@1404000000000, @6.1, @20.8],
                                @[@1404086400000, @8.4, @22.6],
                                /* 2014-07-01 */
                                @[@1404172800000, @7.6, @23.3],
                                @[@1404259200000, @8.1, @21.5],
                                @[@1404345600000, @11.2,@18.1],
                                @[@1404432000000, @6.4, @14.9],
                                @[@1404518400000, @12.7,@23.1],
                                @[@1404604800000, @15.3,@21.7],
                                @[@1404691200000, @15.1,@19.4],
                                @[@1404777600000, @10.8,@22.8],
                                @[@1404864000000, @15.8,@29.7],
                                @[@1404950400000, @15.8,@29.0],
                                @[@1405036800000, @15.2,@30.5],
                                @[@1405123200000, @14.9,@28.1],
                                @[@1405209600000, @13.1,@27.4],
                                @[@1405296000000, @15.5,@23.5],
                                @[@1405382400000, @14.7,@20.1],
                                @[@1405468800000, @14.4,@16.8],
                                @[@1405555200000, @12.6,@18.5],
                                @[@1405641600000, @13.9,@24.4],
                                @[@1405728000000, @11.3,@26.9],
                                @[@1405814400000, @13.3,@27.4],
                                @[@1405900800000, @13.3,@29.7],
                                @[@1405987200000, @14.0,@28.8],
                                @[@1406073600000, @14.1,@29.8],
                                @[@1406160000000, @15.4,@31.1],
                                @[@1406246400000, @17.0,@26.5],
                                @[@1406332800000, @16.6,@27.1],
                                @[@1406419200000, @13.3,@25.6],
                                @[@1406505600000, @16.8,@21.9],
                                @[@1406592000000, @16.0,@22.8],
                                @[@1406678400000, @14.4,@19.0],
                                @[@1406764800000, @12.8,@18.1],
                                /* 2014-08-01 */
                                @[@1406851200000, @12.6,@18.0],
                                @[@1406937600000, @11.4,@19.7],
                                @[@1407024000000, @13.9,@18.9],
                                @[@1407110400000, @12.5,@19.9],
                                @[@1407196800000, @12.3,@23.4],
                                @[@1407283200000, @12.8,@23.3],
                                @[@1407369600000, @11.0,@20.4],
                                @[@1407456000000, @14.7,@22.4],
                                @[@1407542400000, @11.1,@23.6],
                                @[@1407628800000, @13.5,@20.7],
                                @[@1407715200000, @13.7,@23.1],
                                @[@1407801600000, @12.8,@19.6],
                                @[@1407888000000, @12.1,@18.7],
                                @[@1407974400000, @8.8, @22.4],
                                @[@1408060800000, @8.2, @20.1],
                                @[@1408147200000, @10.9,@16.3],
                                @[@1408233600000, @10.7,@16.1],
                                @[@1408320000000, @11.0,@18.9],
                                @[@1408406400000, @12.1,@14.7],
                                @[@1408492800000, @11.2,@14.4],
                                @[@1408579200000, @9.9, @16.6],
                                @[@1408665600000, @6.9, @15.7],
                                @[@1408752000000, @8.9, @15.3],
                                @[@1408838400000, @8.2, @17.6],
                                @[@1408924800000, @8.4, @19.5],
                                @[@1409011200000, @6.6, @19.9],
                                @[@1409097600000, @6.4, @19.7],
                                @[@1409184000000, @0, @0],
                                @[@1409270400000, @0, @0],
                                @[@1409356800000, @0, @0],
                                @[@1409443200000, @0, @0],
                                /* 2014-09-01 */
                                @[@1409529600000, @0, @0],
                                @[@1409616000000, @0, @0],
                                @[@1409702400000, @0, @0],
                                @[@1409788800000, @0, @0],
                                @[@1409875200000, @0, @0],
                                @[@1409961600000, @13.4,@13.4],
                                @[@1410048000000, @13.2,@17.1],
                                @[@1410134400000, @11.9,@18.9],
                                @[@1410220800000, @9.0, @15.9],
                                @[@1410307200000, @5.9, @17.5],
                                @[@1410393600000, @6.8, @16.2],
                                @[@1410480000000, @10.3,@19.9],
                                @[@1410566400000, @8.7, @17.9],
                                @[@1410652800000, @7.9, @19.1],
                                @[@1410739200000, @6.0, @20.1],
                                @[@1410825600000, @4.7, @19.9],
                                @[@1410912000000, @4.0, @18.8],
                                @[@1410998400000, @4.5, @17.9],
                                @[@1411084800000, @3.1, @16.1],
                                @[@1411171200000, @8.5, @12.2],
                                @[@1411257600000, @7.6, @13.8],
                                @[@1411344000000, @1.3, @12.6],
                                @[@1411430400000, @2.0, @10.9],
                                @[@1411516800000, @5.0, @10.8],
                                @[@1411603200000, @6.4, @10.1],
                                @[@1411689600000, @8.2, @13.3],
                                @[@1411776000000, @8.9, @11.8],
                                @[@1411862400000, @9.9, @15.9],
                                @[@1411948800000, @5.2, @12.5],
                                @[@1412035200000, @4.6, @11.7],
                                /* 2014-10-01 */
                                @[@1412121600000, @8.8, @12.1],
                                @[@1412208000000, @3.9, @12.3],
                                @[@1412294400000, @2.7, @18.1],
                                @[@1412380800000, @10.2,@18.2],
                                @[@1412467200000, @9.6, @17.9],
                                @[@1412553600000, @9.3, @17.5],
                                @[@1412640000000, @8.1, @12.7],
                                @[@1412726400000, @6.7, @11.2],
                                @[@1412812800000, @4.0, @10.0],
                                @[@1412899200000, @6.3, @10.2],
                                @[@1412985600000, @6.6, @10.7],
                                @[@1413072000000, @6.6, @10.3],
                                @[@1413158400000, @5.9, @10.4],
                                @[@1413244800000, @1.2, @10.6],
                                @[@1413331200000, @-0.1, @9.2],
                                @[@1413417600000, @-1.0, @9.4],
                                @[@1413504000000, @-1.7, @8.3],
                                @[@1413590400000, @-0.6, @7.5],
                                @[@1413676800000, @6.9, @10.1],
                                @[@1413763200000, @7.7, @10.5],
                                @[@1413849600000, @3.8,  @9.7],
                                @[@1413936000000, @6.2,  @8.6],
                                @[@1414022400000, @6.5,  @9.2],
                                @[@1414108800000, @7.9, @10.7],
                                @[@1414195200000, @6.1, @10.9],
                                @[@1414281600000, @10.3,@13.1],
                                @[@1414371600000, @7.1, @13.3],
                                @[@1414458000000, @0.0, @10.1],
                                @[@1414544400000, @0.0,  @5.7],
                                @[@1414630800000, @3.9,  @4.6],
                                @[@1414717200000, @4.0,  @4.8],
                                /* 2014-11-01 */
                                @[@1414803600000, @4.8, @11.2],
                                @[@1414890000000, @7.0,  @8.5],
                                @[@1414976400000, @3.0,  @9.8],
                                @[@1415062800000, @2.8,  @5.9],
                                @[@1415149200000, @0.8,  @4.8],
                                @[@1415235600000, @-0.2, @2.9],
                                @[@1415322000000, @-0.6, @5.5],
                                @[@1415408400000, @6.6, @10.3],
                                @[@1415494800000, @5.4,  @7.3],
                                @[@1415581200000, @3.0,  @8.4],
                                @[@1415667600000, @0.4,  @3.2],
                                @[@1415754000000, @-0.1, @6.8],
                                @[@1415840400000, @4.8,  @8.8],
                                @[@1415926800000, @4.6,  @8.5],
                                @[@1416013200000, @4.3,  @7.7],
                                @[@1416099600000, @3.3,  @7.5],
                                @[@1416186000000, @-0.4, @3.2],
                                @[@1416272400000, @1.9,  @4.7],
                                @[@1416358800000, @-0.2, @3.7],
                                @[@1416445200000, @-1.3, @2.1],
                                @[@1416531600000, @-1.8, @0.9],
                                @[@1416618000000, @-2.7, @1.3],
                                @[@1416704400000, @0.3,  @2.5],
                                @[@1416790800000, @3.4,  @6.5],
                                @[@1416877200000, @0.8,  @6.1],
                                @[@1416963600000, @-1.0, @1.3],
                                @[@1417050000000, @0.4,  @3.1],
                                @[@1417136400000, @-1.2, @1.9],
                                @[@1417222800000, @-1.1, @2.8],
                                @[@1417309200000, @-0.7, @1.8],
                                /* 2014-12-01 */
                                @[@1417395600000, @0.5,  @2.5],
                                @[@1417482000000, @1.4,  @3.2],
                                @[@1417568400000, @4.5, @10.2],
                                @[@1417654800000, @0.4, @10.0],
                                @[@1417741200000, @2.5,  @3.7],
                                @[@1417827600000, @1.1,  @5.0],
                                @[@1417914000000, @2.0,  @4.4],
                                @[@1418000400000, @1.4,  @2.2],
                                @[@1418086800000, @0.7,  @4.6],
                                @[@1418173200000, @1.9,  @3.9],
                                @[@1418259600000, @-0.2, @3.7],
                                @[@1418346000000, @-0.1, @1.7],
                                @[@1418432400000, @-1.0, @3.8],
                                @[@1418518800000, @0.5,  @5.4],
                                @[@1418605200000, @-1.7, @5.6],
                                @[@1418691600000, @0.3,  @2.8],
                                @[@1418778000000, @-3.0, @0.4],
                                @[@1418864400000, @-1.1, @1.5],
                                @[@1418950800000, @0.8,  @3.4],
                                @[@1419037200000, @0.9,  @4.4],
                                @[@1419123600000, @0.3,  @3.9],
                                @[@1419210000000, @0.6,  @5.3],
                                @[@1419296400000, @1.5,  @4.4],
                                @[@1419382800000, @0, @0],
                                @[@1419469200000, @0, @0],
                                @[@1419555600000, @-4,  @-4.1],
                                @[@1419642000000, @-10, @-5.2],
                                @[@1419728400000, @-8,  @-4.1],
                                @[@1419814800000, @-5.2, @2.4],
                                @[@1419901200000, @1.3,  @2.5],
                                @[@1419987600000, @1.6,  @4.2]
                                ]
                     ),
                     ]
                   );
        
        return aaChartModel;
        
    } else if ([chartType isEqualToString:AAChartTypeAreasplinerange]) {
        
        NSDictionary *gradientColorDic =
        @{
          @"linearGradient": @{
                  @"x1": @0,
                  @"y1": @1,
                  @"x2": @0,
                  @"y2": @0
                  },
          @"stops": @[@[@0,@"rgba(255,140,0,0.6)"],
                      @[@1,@"rgba(220,20,60,1)"]]//颜色字符串设置支持十六进制类型和 rgba 类型
          };
        
        AAChartModel *aaChartModel = AAChartModel.new
        .chartTypeSet(AAChartTypeArearange)
        .titleSet(@"黄昏别馆日气温起伏图")
        .subtitleSet(@"实时监测")
        .yAxisTitleSet(@"摄氏度")
        .xAxisVisibleSet(false)
        .dataLabelEnabledSet(false)
        .seriesSet(
                   @[
                     AASeriesElement.new
                     .nameSet(@"2020")
                     .typeSet(AAChartTypeAreasplinerange)
                     .colorSet((id)gradientColorDic)//猩红色
                     .dataSet(@[
                                /* 2014-03-01 */
                                @[@1393635600000, @2.1,  @8.9],
                                @[@1393722000000, @0.6,  @6.1],
                                @[@1393808400000, @1.2,  @9.4],
                                @[@1393894800000, @2.6,  @7.3],
                                @[@1393981200000, @3.9,  @9.5],
                                @[@1394067600000, @5.3,  @9.9],
                                @[@1394154000000, @2.7,  @7.1],
                                @[@1394240400000, @4.0,  @8.6],
                                @[@1394326800000, @6.1, @10.7],
                                @[@1394413200000, @4.2,  @7.6],
                                @[@1394499600000, @2.5,  @9.0],
                                @[@1394586000000, @0.2,  @7.0],
                                @[@1394672400000, @-1.2, @6.9],
                                @[@1394758800000, @0.4,  @6.7],
                                @[@1394845200000, @0.2,  @5.1],
                                @[@1394931600000, @-0.1, @6.0],
                                @[@1395018000000, @1.0,  @5.6],
                                @[@1395104400000, @-1.1, @6.3],
                                @[@1395190800000, @-1.9, @0.3],
                                @[@1395277200000, @0.3,  @4.5],
                                @[@1395363600000, @2.4,  @6.7],
                                @[@1395450000000, @3.2,  @9.2],
                                @[@1395536400000, @1.7,  @3.6],
                                /* 2014-04-01 */
                                @[@1396310400000, @-1.2, @8.8],
                                @[@1396396800000, @2.2,  @7.6],
                                @[@1396483200000, @-1.0,@10.1],
                                @[@1396569600000, @-1.8, @9.5],
                                @[@1396656000000, @0.2,  @7.7],
                                @[@1396742400000, @3.7,  @6.4],
                                @[@1396828800000, @5.8, @11.4],
                                @[@1396915200000, @5.4,  @8.7],
                                @[@1397001600000, @4.5, @12.2],
                                @[@1397088000000, @3.9,  @8.4],
                                @[@1397174400000, @4.5,  @8.0],
                                @[@1397260800000, @6.6,  @8.4],
                                @[@1397347200000, @3.7,  @7.3],
                                @[@1397433600000, @3.6,  @6.7],
                                @[@1397520000000, @3.5,  @8.3],
                                @[@1397606400000, @1.5, @10.2],
                                @[@1397692800000, @4.9,  @9.4],
                                @[@1397779200000, @3.5, @12.0],
                                @[@1397865600000, @1.5, @13.1],
                                @[@1397952000000, @1.7, @15.6],
                                ]
                              ),
                     ]
                   );
        
        return aaChartModel;
        
    } else if ([chartType isEqualToString:AAChartTypeColumnrange]) {
        
        AAChartModel *aaChartModel= AAChartModel.new
        .chartTypeSet(AAChartTypeColumnrange)
        .titleSet(@"")
        .subtitleSet(@"")
        .yAxisGridLineWidthSet(@0)
        .yAxisTitleSet(@"℃")
        .categoriesSet(@[@"一月", @"二月", @"三月", @"四月", @"五月", @"六月", @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"])
        .dataLabelEnabledSet(true)
        .invertedSet(true)
        .backgroundColorSet(@"#4b2b7f")
        .dataLabelEnabledSet(true)
        .dataLabelFontColorSet(@"#ffffff")
        .colorsThemeSet(@[@"#06caf4",@"#fe117c",@"#ffc069",@"#7dffc0"])//设置主体颜色数组
        .seriesSet(@[
                     AASeriesElement.new
                     .nameSet(@"温度")
                     .dataSet(@[
                                @[@-9.7,  @9.4],
                                @[@-8.7,  @6.5],
                                @[@-3.5,  @9.4],
                                @[@-1.4, @19.9],
                                @[@0.0 , @22.6],
                                @[@2.9 , @29.5],
                                @[@9.2 , @30.7],
                                @[@7.3 , @26.5],
                                @[@4.4 , @18.0],
                                @[@-3.1, @11.4],
                                @[@-5.2, @10.4],
                                @[@-9.9, @16.8]
                                ]),
                     ]
                   )
        ;
        
        return aaChartModel;
        
    } else if ([chartType isEqualToString:@"stepLine"]) {
        
        AAChartModel *aaChartModel = AAChartModel.new
        .chartTypeSet(AAChartTypeLine)//图形类型
        .animationTypeSet(AAChartAnimationBounce)//图形渲染动画类型为"bounce"
        .titleSet(@"STEP LINE CHART")//图形标题
        .subtitleSet(@"2020/08/08")//图形副标题
        .dataLabelEnabledSet(NO)//是否显示数字
        .symbolStyleSet(AAChartSymbolStyleTypeBorderBlank)//折线连接点样式
        .markerRadiusSet(@7)//折线连接点半径长度,为0时相当于没有折线连接点
        .seriesSet(@[
                     AASeriesElement.new
                     .nameSet(@"Berlin")
                     .dataSet(@[@450, @432, @401, @454, @590, @530, @510])
                     .stepSet(@"right"), //折线连接点靠右👉
                     AASeriesElement.new
                     .nameSet(@"New York")
                     .dataSet(@[@220, @282, @201, @234, @290, @430, @410])
                     .stepSet(@"center"),//折线连接点居中
                     AASeriesElement.new
                     .nameSet(@"Tokyo")
                     .dataSet(@[@120, @132, @101, @134, @90, @230, @210])
                     .stepSet(@"left"),//折线连接点靠左边👈
                     ]
                   )
        ;
        
        return aaChartModel;
        
    } else if ([chartType isEqualToString:@"stepArea"]) {
        
        AAChartModel *aaChartModel = AAChartModel.new
        .chartTypeSet(AAChartTypeArea)//图形类型
        .animationTypeSet(AAChartAnimationBounce)//图形渲染动画类型为"bounce"
        .gradientColorsThemeEnabledSet(true)//开启主题渐变色
        .titleSet(@"STEP AREA CHART")//图形标题
        .subtitleSet(@"2020/08/08")//图形副标题
        .dataLabelEnabledSet(NO)//是否显示数字
        .symbolStyleSet(AAChartSymbolStyleTypeInnerBlank)//折线连接点样式
        .markerRadiusSet(@0)//折线连接点半径长度,为0时相当于没有折线连接点
        .seriesSet(@[
                     AASeriesElement.new
                     .nameSet(@"Berlin")
                     .dataSet(@[@450, @432, @401, @454, @590, @530, @510])
                     .stepSet(@(true))//设置折线样式为直方折线,连接点位置默认靠左👈
                     ,
                     AASeriesElement.new
                     .nameSet(@"New York")
                     .dataSet(@[@220, @282, @201, @234, @290, @430, @410])
                     .stepSet(@(true))//设置折线样式为直方折线,连接点位置默认靠左👈
                     ,
                     AASeriesElement.new
                     .nameSet(@"Tokyo")
                     .dataSet(@[@120, @132, @101, @134, @90, @230, @210])
                     .stepSet(@(true))//设置折线样式为直方折线,连接点位置默认靠左👈
                     ,
                     ]
                   )
        ;

        return aaChartModel;
        
    } else if ([chartType isEqualToString:@"NightingaleRoseChart"]) {
        
        AAChartModel *aaChartModel= AAChartModel.new
        .titleSet(@"南丁格尔玫瑰图")
        .subtitleSet(@"极地图中的一种")
        .yAxisTitleSet(@"cm")
        .chartTypeSet(AAChartTypeColumn)
        //.xAxisVisibleSet(true)//是否显示最外一层圆环
        //.yAxisVisibleSet(false)//是否显示中间的多个圆环
        .legendEnabledSet(false)//隐藏图例(底部可点按的小圆点)
        .categoriesSet(@[@"一月", @"二月", @"三月", @"四月", @"五月", @"六月", @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"])
        .dataLabelEnabledSet(true)
        .polarSet(true)//极地化图形
        .seriesSet(@[
                     AASeriesElement.new
                     .nameSet(@"东京")
                     .dataSet(@[@7.0, @6.9, @9.5, @9.6,@13.9, @14.5,@18.3, @18.2, @21.5, @25.2,@26.5, @23.3,  ]),
                     ]
                   )
        ;
        
        return aaChartModel;
        
    } else if ([chartType isEqualToString:AAChartTypeBoxplot]) {

        AAChartModel *aaChartModel = AAChartModel.new
        .chartTypeSet(AAChartTypeBoxplot)
        .titleSet(@"BOXPLOT CHART")
        .subtitleSet(@"virtual data")
        .yAxisTitleSet(@"℃")
        .yAxisVisibleSet(true)
        .seriesSet(
                   @[
                     AASeriesElement.new
                     .nameSet(@"Observed Data")
                     .fillColorSet(@"#04d69f")
                     .dataSet(@[
                                @[@760, @801, @848, @895, @965],
                                @[@733, @853, @939, @980, @1080],
                                @[@714, @762, @817, @870, @918],
                                @[@724, @802, @806, @871, @950],
                                @[@834, @836, @864, @882, @910]
                                ]),
                     ]
                   );
        
        
        
        return aaChartModel;
        
    } else if ([chartType isEqualToString:AAChartTypeWaterfall]) {

        AAChartModel *aaChartModel = AAChartModel.new
        .chartTypeSet(AAChartTypeWaterfall)
        .titleSet(@"WATERFALL CHART")
        .subtitleSet(@"virtual data")
        .yAxisVisibleSet(true)
        .yAxisTitleSet(@"💲")
        .seriesSet(
                   @[@{
                         @"upColor":@"#9b43b4",
                         @"color": @"#ef476f",
                         @"borderWidth":@0,
                         @"data": @[@{
                                        @"name": @"启动资金",
                                        @"y": @120000
                                        }, @{
                                        @"name": @"产品收入",
                                        @"y": @569000
                                        }, @{
                                        @"name": @"服务收入",
                                        @"y": @231000
                                        }, @{
                                        @"name": @"正平衡",
                                        @"isIntermediateSum": @true,
                                        @"color": @"#ffd066"
                                        }, @{
                                        @"name": @"固定成本",
                                        @"y": @-342000
                                        }, @{
                                        @"name": @"可变成本",
                                        @"y": @-233000
                                        }, @{
                                        @"name": @"余额",
                                        @"isSum": @true,
                                        @"color": @"#04d69f"
                                        }],
                         }]);
        return aaChartModel;
    } else if ([chartType isEqualToString:AAChartTypePyramid]) {
        
        AAChartModel *aaChartModel= AAChartModel.new
        .chartTypeSet(AAChartTypePyramid)
        .titleSet(@"编程语言热度")
        .subtitleSet(@"横屏查看效果更佳")
        .yAxisTitleSet(@"摄氏度")
        .seriesSet(
                   @[
                     AASeriesElement.new
                     .nameSet(@"2020")
                     .dataSet(@[
                                @[@"Swift",       @15654],
                                @[@"Objective-C",  @4064],
                                @[@"JavaScript",   @1987],
                                @[@"GO",            @976],
                                @[@"Python",        @846]
                                ]),
                     ]
                   )
        ;
        
        return aaChartModel;
        
    } else if ([chartType isEqualToString:AAChartTypeFunnel]) {
        
        AAChartModel *aaChartModel= AAChartModel.new
        .chartTypeSet(AAChartTypeFunnel)
        .titleSet(@"编程语言热度")
        .subtitleSet(@"横屏查看效果更佳")
        .yAxisTitleSet(@"摄氏度")
        .seriesSet(
                   @[
                     AASeriesElement.new
                     .nameSet(@"2020")
                     .dataSet(@[
                                @[@"Swift",       @15654],
                                @[@"Objective-C",  @4064],
                                @[@"JavaScript",   @1987],
                                @[@"GO",            @976],
                                @[@"Python",        @846]
                                ]),
                     ]
                   )
        ;
        
        return aaChartModel;
        
    }
    
    return nil;
}

- (void)setUpTheNextTypeChartButton {
    UIBarButtonItem *btnItem = [[UIBarButtonItem alloc] initWithTitle:@"Next Chart"
                                                                style:UIBarButtonItemStylePlain
                                                               target:self
                                                               action:@selector(monitorTap)];
    self.navigationItem.rightBarButtonItem = btnItem;
}

- (void)monitorTap {
    if (self.chartType == SpecialChartVCChartTypeFunnel) {
        self.title = [NSString stringWithFormat:@"❗️This is the last chart❗️"];
    } else {
        self.chartType = self.chartType + 1;
        NSString *chartType = [self configureTheChartTypeWithIntenger:self.chartType];
        self.title = [NSString stringWithFormat:@"%@ chart",chartType];
        _aaChartModel = [self configureTheChartModel:chartType];
        [_aaChartView aa_refreshChartWithChartModel:_aaChartModel];
    }
}

@end
