//
//  RealLifeTests.swift
//  BigIntegerTests
//
//  Created by Vladimir Abramichev on 28/11/2017.
//  Copyright © 2017 Vladimir Abramichev. All rights reserved.
//

import XCTest

class RealLifeTests: XCTestCase {
    
    func testChainOperations() {
        var a = BigInteger(value: 100)
        a = a - 1
        XCTAssertEqual(a.description, "99")
        
        a = a + 2
        XCTAssertEqual(a.description, "101")
        
        a = a * 2
        XCTAssertEqual(a.description, "202")

        a = BigInteger(value: 100000)
        a = a - 1
        XCTAssertEqual(a.description, "99999")
        
        a = a + 2
        XCTAssertEqual(a.description, "100001")
        
        a = a * 2
        XCTAssertEqual(a.description, "200002")
        
        a = BigInteger(value: 100000000)
        a = a - 1
        XCTAssertEqual(a.description, "99999999")
        
        a = a + 2
        XCTAssertEqual(a.description, "100000001")
        
        a = a * 2
        XCTAssertEqual(a.description, "200000002")
    }
    
    func testFibonaccy10() {
        let number = 92
        let actualResult = "7540113804746346429"
        let result = fibonacci(of: number)
        
        XCTAssertEqual(String(result), actualResult)
    }
    
    func testFibonaccy200() {
        let number = BigInteger(value: 200)
        let actualResult = "280571172992510140037611932413038677189525"
        let result = fibonacci(of: number)
        
        XCTAssertEqual(result.description, actualResult)
    }
    
    func testFibonaccy15000() {
        let number = BigInteger(value: 15000)
        let start = CFAbsoluteTimeGetCurrent()
        let actualResult = "291822482420491383023640722369851320223096265571182877461713873515662445807918312889571855821855443057170018915544140673813139288992006519445420511522501871839129697256085064947056503909529854158932872201875201399667128848417938314849451512802519608086882325973494186047943825115976917118393747504392653368245937172941708303615511146935651190005282029885911226536421189857229602343636615695140578412064630184957031169425874381333306782199854518478703841243438559001961942476419716049431461398852068937496532702484782377830430826364213278925308508324548001557934936077715514003588518801124904399346785982147238302911095788047085464245153506338016606869623553997201937064220291622262717935478025996550369392041093778032074384777894575577730784603840997734212200063565793584625139684812761944262176275894005530397852274226740655837551277936672171617001321643902022543217117598529992970057551787943572171175262896613570929057258741106916372769543386513808605761180117908598498291361651232480538443534644654670726403907179033403137082918197548872138930407712383444587069543878099029827149351809059228918890195150384534077018404146215681472025875766068729891987655254387174101578844808330116467762851448877551666381233277937168228261933825327063991083857110325908301124913866766410407664110857341740006694083885057251407118017956908937617974357670780833995973404755793454757776213733933029325002162671790383725810839223584319727751444653619212527722891833631252126032466161374535014881501151749654706541818597978747418538032722002387577920489415566750682533898528506816103770475941974258377364464028425400330064280519208784541012452161205695725205041539841970590789521162391228925401795412007542598085259331162119721670589149176624709160010542989389222845796197446399950310050433418993561165953330953890003973920583345715846005717958242843226091661882659750717437634079361927711565054620110900859791636070975947216677546937719120729784085519260932298476005771546795769572874895866055415216307971471417092972554541855505020004439200930435915484847842032966882300127147403897272623099204582004595855388008043208297987914915116669232439687141874091429449369803550137870515211430996672030442878917572368229803748388547623511882793891824184310125594622681166495348957518944579596891586338978004451701726457285040154971265350898519194486525672226125702900165135675283777194258607147558727730735917052683469304395667759708808549114652270141375757746104161123946766798505252272809475428608094228095982727180568782673409167756185330034888406210901420617854377956953894417451404316156563779507774067824149279372027410313468586412958654870462174116992864773003643628242809835583529038699017950482636291373580733702623336843189654244749920987627356390455941019925558579489437021325631214072903083225239344023351966531835713254402702444405165631589535469628719114302631638580677411935571507343153437251699725486090759357166647574912872185956444977488361348357624590401512055582842699604622014302583314067673695981346203233466378796897692478813098509881242360797278617948316663931666162574107570737272044374680294118782065306140908611007655976683548980000"
        let result = fibonacci(of: number)
        XCTAssertTrue(CFAbsoluteTimeGetCurrent() - start < 5.0)
        XCTAssertEqual(result.description, actualResult)
    }
}

var known = Dictionary<BigInteger, BigInteger>()
var knownI = Dictionary<Int, Int>()

func fibonacci(of num: BigInteger) -> BigInteger {
    if num < 2 {
        return num
    }
    
    if let value = known[num] {
        return value
    }
    
    let result = fibonacci(of: num - 1) + fibonacci(of: num - 2)
    known[num] = result
    return result
}

func fibonacci(of num: Int) -> Int {
    if num < 2 {
        return num
    }
    
    if let value = knownI[num] {
        return value
    }
    
    let result = fibonacci(of: num - 1) + fibonacci(of: num - 2)
    knownI[num] = result
    return result
}