public with sharing class CountryMaps {
    //Map of continent code for country map with states anfd states map wih districts
    Map<String, Map<String, Map<String, List<String>>>> mapOfCountryWithCode = new Map<String, Map<String, Map<String, List<String>>>>();
    
    boolean notfound=true;
    public CountryMaps(){
        countryDataInitializing();   
    }

    public void countryDataInitializing(){
        List<String> listCountry = new List<String>{'India', 'Bangladesh', 'Switzerland','Usa'};
            
        //****************Create List of District with State Of Country India
        
        List<String> rajthanDistrictList = new List<String>{'Jaipur','Udaipur','Jodhpur','Ajmer','Kota','Sikar','Pali','Alwar','Bharatpur', 'Kishangarh'};
        
        List<String> upDistrictList = new List<String>{'Sultan', 'Lucknow', 'Agra', 'Mathura','Shamli','Lucknow','Agra','Kanpur','Merrut','Rampur','Jhansi','Lalitpur','Ayodhya','Basti','Jaunpur','Prayagraj'};
         
            
        //*****************Create List of District with State Of Country Switzerland***********
        
        List<String> schwyzDistrictList = new List <String>{'Riemenstalden','Illgau','Steinen','Unteriberg','Rothenthurm','Alpthal','Muotathal'};
         
        //*****************Create List of District with State Of Country Usa************
        
        List<String> utahDistrictList = new List<String>{'Salt Lake City','West Valley City','Urovo','West Jordan','Sandy'};
        
        List<String> texasDistrictList = new List<String>{'Houstan','Dallas','Austin','San Antonio','McAllen'};
            
        //******************Create List of District with State Of Bangladesh***************
        
        List<String> dhakaDistrictList = new List<String>{'Tangail','Faridpur','Rajbari'};
        
        List<String> barishalDistrictList = new List<String>{'Bhola','Jhalokati','Patuakhali'};    
                
        //***************Map For District with State Of Country India*****************************
        
        Map<String,List<String>> mapOfDistrictwithStateForIndia=new  Map<String,List<String>>();
        
        mapOfDistrictwithStateForIndia.put('UttarPradesh',upDistrictList);
        mapOfDistrictwithStateForIndia.put('Rajasthan',rajthanDistrictList);
         
        //***************Map For District with State Of Country Switzerland
        
        Map<String,List<String>> mapOfDistrictwithStateForSwitzerland=new  Map<String,List<String>>();
        mapOfDistrictwithStateForSwitzerland.put('Schwyz',schwyzDistrictList);
            
        //***************Map For District with State Of Country Usa
        
        Map<String,List<String>> mapOfDistrictwithStateForUsa=new  Map<String,List<String>>();
        
        mapOfDistrictwithStateForUsa.put('Utah',utahDistrictList);
        mapOfDistrictwithStateForUsa.put('Texas',texasDistrictList);    
            
        //***************Map For District with State Of Country Bangladesh
        
        Map<String,List<String>> mapOfDistrictwithStateForBangladesh=new  Map<String,List<String>>();
        
        mapOfDistrictwithStateForBangladesh.put('Dhaka',dhakaDistrictList);
        mapOfDistrictwithStateForBangladesh.put('Barisha',barishalDistrictList);
        

        Map<String,Map<String,List<String>>> mapOfStatewithCountryAsia=new Map<String,Map<String,List<String>>>();
        
        mapOfStatewithCountryAsia.put('India',mapOfDistrictwithStateForIndia);
        mapOfStatewithCountryAsia.put('Bangladesh',mapOfDistrictwithStateForBangladesh);

        Map<String,Map<string,List<String>>> mapOfStatewithCountryEurope=new Map<String,Map<String,List<String>>>();
        
        mapOfStatewithCountryEurope.put('Switzerland',mapOfDistrictwithStateForSwitzerland);
        mapOfStatewithCountryEurope.put('Usa',mapOfDistrictwithStateForUsa);
        
        //***************Assigning List With Country Code
        
        mapOfCountryWithCode.put('+91,+880',mapOfStatewithCountryAsia);
        mapOfCountryWithCode.put('+41,+1',mapOfStatewithCountryEurope);
    }
    
    //Find a combination of Country, state and districts where it starts with Same Letter
    public void getCountryWithLetter(String letterStartWith){
        for(String countrycode: mapOfCountryWithCode.keySet()){

            Map<String,Map<String,List<String>>> mapOfStatewithCountry= new Map<String,Map<String,List<String>>>();

            mapOfStatewithCountry=mapOfCountryWithCode.get(countrycode);
            for(String country: mapOfStatewithCountry.keySet()){
                if(country.startsWith(letterStartWith)){

                    Map<String,List<String>> mapOfDistrictsWithState= new Map<String,List<String>>();

                    mapOfDistrictsWithState=mapOfStatewithCountry.get(country);
                    for(String states: mapOfDistrictsWithState.keySet()){
                        if(states.startsWith(letterStartWith)){
                            List<String> districts=new List<String>();
                            districts=mapOfDistrictsWithState.get(states);
                            for(String districtsname: districts){
                                if(districtsname.startsWith(letterStartWith))
                                {
                                   System.System.debug('CountryName =>'+country);
                                   System.debug ('StateName =>'+states);
                                   System.debug('DistrictName =>'+districtsname);
                                   notfound=false;
                                }
                            }
                        }
                    }
                }
            }
        }
         if(notfound){
            System.debug('Start with Enter letter'+letterStartWith+'combination OF Country,State & District is not found');  
        }
    }
    
    //Find such a District which length is more or equal to some number
    public void searchDistrictWithLength(integer sizeOfLetter){
        System.debug('Districts which length is more or equal to some number:::');
        for(String countrycode : mapOfCountryWithCode.keySet()){

            Map<String,Map<String,List<String>>> mapOfStatewithCountry= new Map<String,Map<String,List<String>>>();
              
            mapOfStatewithCountry=mapOfCountryWithCode.get(countrycode);
            for(String country : mapOfStatewithCountry.keySet()){

                Map<String,List<String>> mapOfDistrictsWithState= new Map<String,List<String>>();

                mapOfDistrictsWithState=mapOfStatewithCountry.get(country);
                for(String states : mapOfDistrictsWithState.keySet()){
                    List<String> districts=new List<String>();
                    districts=mapOfDistrictsWithState.get(states);
                    for(String districtsname: districts){
                        if(sizeOfLetter<=districtsname.length() ){
                            System.debug(districtsname);
                        }
                    }
                }
            }
        }
    }
}

/*For Excicute This Code Use  => CountryMaps n = new CountryMaps();
                                 n.getCountryWithLetter('U');
                                 n.searchDistrictWithLength(5);             */
