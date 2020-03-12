//
//  PickerData.swift
//  PickerView
//
//  Created by leslie on 3/10/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import Foundation

struct PickerData {
    
    var years: [String] = []
    
    init() {
        
        initYears()
        
    }
    
    mutating func initYears() {
        
        for n in 1900...2100 {
            
            let number: String = String(n)
            
            self.years.append(number)
            
        }
        
    }
    
    func getDate(from yyyy: Int, mm: Int, dd: Int) -> Date {
        
        let calendar = Calendar.current
        
        var components = DateComponents()
        components.year = yyyy
        components.month = mm
        components.day = dd
        
        guard let newDate = calendar.date(from: components) else { return Date() }
        
        return newDate
    }

}

var pickerData = PickerData()

extension PickerData {
    
    var countriesList: [(name: String, population: Int)] {
    [("Afghanistan",37209007),("Albania",2938428),("Algeria",42679018),("Andorra",77072),("Angola",31787566),("Antigua and Barbuda",104084),("Argentina",45101781),("Armenia",2936706),("Australia",25088636),("Austria",8766201),("Azerbaijan",10014575),("Bahamas",403095),("Bahrain",1637896),("Bangladesh",168065920),("Barbados",28701),("Belarus",9433874),("Belgium",11562784),("Belize",390231),("Benin",11801595),("Bhutan",826229),("Bolivia",11379861),("Bosnia and Herzegovina",3501774),("Botswana",2374636),("Brazil",212392717),("Brunei",439336),("Bulgaria",6988739),("Burkina Faso",20321560),("Burundi",11575964),("Côte d Ivoire",25531083),("Cabo Verde",560349),("Cambodia",16482646),("Cameroon",25312993),("Canada",37279811),("Central African Republic",4825711),("Chad",15814345),("Chile",18336653),("China",1420062022),("Colombia",49849818),("Comoros",85091),("Congo (Congo-Brazzaville)",5542197),("Costa Rica",4999384),("Croatia",4140148),("Cuba",11492046),("Cyprus",1198427),("Czechia",10630589),("Democratic Republic of the Congo",86727573),("Denmark",5775224),("Djibouti",98569),("Dominica",74679),("Dominican Republic",10996774),("Ecuador",17100444),("Egypt",101168745),("El Salvador",6445405),("Equatorial Guinea",1360104),("Eritrea",5309659),("Estonia",1303798),("Ethiopia",110135635),("Fiji",918757),("Finland",5561389),("France",65480710),("Gabon",2109099),("Gambia",2228075),("Georgia",3904204),("Germany",82438639),("Ghana",30096970),("Greece",11124603),("Grenada",108825),("Guatemala",17577842),("Guinea",13398180),("Guinea-Bissau",1953723),("Guyana",786508),("Haiti",11242856),("Holy See",799),("Honduras",9568688),("Hungary",9655361),("Iceland",340566),("India",1368737513),("Indonesia",269536482),("Iran",82820766),("Iraq",40412299),("Ireland",40412299),("Israel",8583916),("Italy",18592970),("Jamaica",2906339),("Japan",126854745),("Jordan",10069794),("Kazakhstan",52214791),("Kenya",52214791),("Kiribati",120428),("Kuwait",4248974),("Kyrgyzstan",6218616),("Laos",7064242),("Latvia",1911108),("Lebanon",6065922),("Lesotho",2292682),("Liberia",4977720),("Libya",6569864),("Liechtenstein",38404),("Lithuania",2864459),("Luxembourg",596992),("Madagascar",26969642),("Malawi",19718743),("Malaysia",32454455),("Maldives",451738),("Mali",19689140),("Malta",433245),("Marshall Islands",53211),("Mauritania",4661149),("Mauritius",1271368),("Mexico",132328035),("Micronesia",536579),("Moldova",4029750),("Monaco",39102),("Mongolia",3166244),("Montenegro",629355),("Morocco",36635156),("Mozambique",31408823),("Myanmar (formerly Burma)",54336138),("Namibia",2641996),("Nauru",1126),("Nepal",29942018),("Netherlands",17132908),("New Zealand",4792409),("Nicaragua",6351157),("Niger",23176691),("Nigeria",200962417),("North Korea",25727408),("North Macedonia",2086720),("Norway",5400916),("Oman",5001875),("Pakistan",204596442),("Palau",22206),("Palestine State",5186790),("Panama",4226197),("Papua New Guinea",8586525),("Paraguay",6981981),("Peru",32933835),("Philippines",108106310),("Poland",38028278),("Portugal",10254666),("Qatar",2743901),("Romania",19483360),("Russia",143895551),("Rwanda",12794412),("Saint Kitts and Nevis",56345),("Saint Lucia",180454),("Saint Vincent and the Grenadines",110488),("Samoa",198909),("San Marino",33683),("Sao Tome and Principe",213379),("Saudi Arabia",34140662),("Senegal",16743859),("Serbia",8733407),("Seychelles",95702),("Sierra Leone",7883123),("Singapore",5868104),("Slovakia",5450987),("Slovenia",2081900),("Solomon Islands",635254),("Somalia",15636171),("South Africa",58065097),("South Korea",51339238),("South Sudan",13263184),("Spain",46441049),("Sri Lanka",21018859),("Sudan",42514094),("Suriname",573085),("Swaziland",1415414),("Sweden",10053135),("Switzerland",8608259),("Syria",18499181),("Tajikistan",9292000),("Tanzania",60913557),("Thailand",69306160),("Timor-Leste",1352360),("Togo",8186384),("Tonga",110041),("Trinidad and Tobago",1375443),("Tunisia",11783168),("Turkey",82961805),("Turkmenistan",5942561),("Tuvalu",11393),("Uganda",45711874),("Ukraine",43795220),("United Arab Emirates",9682088),("UK",66959016),("USA",329093110),("Uruguay",3482156),("Uzbekistan",32807368),("Vanuatu",288017),("Venezuela",32779868),("Vietnam",97429061),("Yemen",29579986),("Zambia",18137369),("Zimbabwe",17297495)]
        
    }

}
extension Date {
    
    func getCurrentYearString() -> String {
        
        let calendar = Calendar.current
        let year = calendar.component(.year, from: self as Date)
        
        return "\(year)"
        
    }
    
    
}

