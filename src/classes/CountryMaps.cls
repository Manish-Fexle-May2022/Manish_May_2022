public with sharing class CountryMaps  {

    //*******Nested Map using Country with code to get the value countries,states,cites name*********!! 
    static Map<String,Map<String, Map<String, List<String>>>> countryWithCode = new Map<String,Map<String, Map<String, List<String>>>>();

    static Map<String, Map<String, List<String>>> countryMap= new Map<String, Map<String, List<String>>>();

    public static void mapCountry(String countrycode){
        
        //Nested Map using Country to get the states and city name
        Map<String, Map<String, List<String>>> countryMap= new Map<String, Map<String, List<String>>>();
        
        //we use nested dummy map to put all the countries into the countrywith code map
        Map<String, Map<String, List<String>>> countrydummyMap = new Map<String, Map<String, List<String>>>();


        countryWithCode.put('+91',new Map<String, Map<String, List<String>>>());
        countryWithCode.put('+1',new Map<String, Map<String, List<String>>>());

        //************COUNTRY INDIA MAP**************!!!!
        countrydummyMap.put('India', new  Map<String, List<String>>());

        Map<String, List<String>> stateMap1 = new Map<String, List<String>>();
        stateMap1.put('Rajasthan',new List<String>());
        stateMap1.put('MP',new List<String>());
        stateMap1.put('Uttar Pradesh',new List<String>());
        stateMap1.put('Haryana',new List<String>());
        stateMap1.put('UttraKhand',new List<String>());

        List<String> rajasthanDistrictList = new List<String>{'Jaipur','Udaipur','Jodhpur','Ajmer','Kota','Sikar','Pali','Alwar','Bharatpur', 'Kishangarh'};
        List<String> mpDistrictList = new List<String>{'Indore','Bhopal','Jabalpur','Gwalior','Katni'};
        List<String> upDistrictList = new List<String>{'Shamli','Lucknow','Agra','Kanpur','Merrut','Rampur','Jhansi','Lalitpur','Ayodhya','Basti','Jaunpur','Prayagraj'};
        List<String> haryanaDistrictList = new List<String>{'Gurugram','Rohtak','Karnal','Sonipat','Hisar'};
        List<String> uttrakhandDistrictList = new List<String>{'Dehradun','Haridwar','Nainital','Rishikesh','Almora'};


        stateMap1.get('Rajasthan').addAll(rajasthanDistrictList);
        stateMap1.get('MP').addAll(mpDistrictList);
        stateMap1.get('Uttar Pradesh').addAll(upDistrictList);
        stateMap1.get('Haryana').addAll(haryanaDistrictList);
        stateMap1.get('UttraKhand').addAll(uttrakhandDistrictList);
        countrydummyMap.get('India').putAll(stateMap1);
        
        countryMap.putAll(countrydummyMap);
        countryWithCode.get('+91').putAll(countryMap);
        //System.debug(countryWithCode.get('+91'));
        countrydummyMap.clear();

        //************COUNTRY UNITED STATES AMERICA MAP*************!!!
        countrydummyMap.put('USA',new  Map<String, List<String>>());
        
        Map<String, List<String>> stateMap2 = new Map<String, List<String>>();
        stateMap2.put('California',new List<String>());
        stateMap2.put('Texas',new List<String>());
        stateMap2.put('Florida',new List<String>());
        stateMap2.put('Alaska',new List<String>());
        stateMap2.put('Utah',new List<String>());
        
        
        List<String> californiaDistrictList = new List<String>{'Los Angeles','San Diego','San Francisco','Oakland','Santa Monica'};
        List<String> texasDistrictList = new List<String>{'Houstan','Dallas','Austin','San Antonio','McAllen'};
        List<String> floridaDistrictList = new List<String>{'Miami','Orlando','Tampa','Destin','Naples'};
        List<String> alaskaDistrictList = new List<String>{'Anchorage','Juneau','Fairbank','Sitka','North Pole'};
        List<String> utahDistrictList = new List<String>{'Salt Lake City','West Valley City','Urovo','West Jordan','Sandy'};


        stateMap2.get('California').addAll(californiaDistrictList);
        stateMap2.get('Texas').addAll(texasDistrictList);
        stateMap2.get('Florida').addAll(floridaDistrictList);
        stateMap2.get('Alaska').addAll(alaskaDistrictList);
        stateMap2.get('Utah').addAll(utahDistrictList);
        countrydummyMap.get('USA').putAll(stateMap2);
        
        countryMap.putAll(countrydummyMap);
        countryWithCode.get('+1').putAll(countrydummyMap);
        //System.debug(countryWithCode.get('+1'));
        countrydummyMap.clear();

        System.debug(countryWithCode.get(countrycode));
    }
    
    public static void getCountryWithLetter(String countryCode,Integer sizeOfLetter){
        // *******Map for getting coutries from the given code******!!!!
        Map<String, Map<String, List<String>>> cMap = new Map<String, Map<String, List<String>>>();
        // *******String for getting Country Name******!!!
		String countryStartLetter = '';
        for(String str : countryWithCode.keySet()){
            if(str.startsWith(countryCode)){
                cMap = countryWithCode.get(str);
            }
        }
        // ***********MAP FOR GETTING ALL STATES AND CITIES********!!
        Map<String, List<String>> sMap = new Map<String, List<String>>();
        for(String str : cMap.keyset()){
            System.debug('Country : '+str);
            sMap = cMap.get(str);
            countryStartLetter = str;
        }
        //******* LIST FOR GETTING LIST OF  CITIES FROM THE GIVEN COUNTRY****!!
        List<String> cList = new List<String>();
        for(String str : sMap.keyset()){
            if(str.charAt(0) == countryStartLetter.charAt(0) ){
                System.debug('State : '+str);
            }    
        } 
        for(List<String> str : sMap.values()){
            for(String st :str ){
                if(st.charAt(0) == countryStartLetter.charAt(0) ){
                    System.debug('District : '+st);
                }
            }
        }
        System.debug('District with Greater Integer : ');
        List<String> greaterDistrictFormInteger = new List<String>();
        for(List<String> str : sMap.values()){
            for(String st :str ){
                if( st.length() >= SizeOfLetter ){
                    greaterDistrictFormInteger.add(st);
                }
            }
        }
        System.debug(greaterDistrictFormInteger);
    }
}