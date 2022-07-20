public with sharing class CountryStatesDistrictDynamicMap {
    // Main Map for CountryStateDistrict
    Map<String, Map<String, List<String>>> mapOfCountriesStatesDistricts = new Map<String, Map<String, List<String>>>();
    
    List<String> listOfStateDistricts = new List<String>(); 
    List<District__c> listOfDistricts = new List<District__c>();
    
    //Wrapper Classes
    public class Country {
        public String countryName{get; set;}
        public List<States> states{get; set;}
        public Decimal totalNumberOfStates{get; set;}
        public Decimal totalNumberOfDistricts{get; set;}
        public Decimal code{set;get;}
    }
    public class States {
        public string stateName{get; set;}
        public List<Districts> districts{get; set;}
        public Decimal totalNumberOfDistricts{get; set;}
    }
    
    public class Districts {
        public String districtName{get; set;}
    }
    Decimal stateDistrictCount;
    
    //Filling Map Dynamically *************!!
    public CountryStatesDistrictDynamicMap() 
    {
        try
        {
            for(District__c district :  [SELECT Name, State__r.Country__r.Name, State__r.Name FROM District__c]) 
            {
                if (!mapOfCountriesStatesDistricts.containskey(district.State__r.Country__r.Name))
                {
                    mapOfCountriesStatesDistricts.put(district.State__r.Country__r.Name, new Map<String,List<String>>());
                }
                
                if(mapOfCountriesStatesDistricts != null && mapOfCountriesStatesDistricts.get(district.State__r.Country__r.Name) != null)
                {
                    Map<String,List<String>> mapOfStateWithDistricts = mapOfCountriesStatesDistricts.get(district.State__r.Country__r.Name);
                    if(!mapOfStateWithDistricts.containskey(district.State__r.Name))
                    {
                        mapOfStateWithDistricts.put(district.State__r.Name, new List<String>());
                    }
                    
                    if(mapOfStateWithDistricts != null)
                    {
                        mapOfStateWithDistricts.get(district.State__r.Name).add(district.Name);
                        mapOfCountriesStatesDistricts.put(district.State__r.Country__r.Name, mapOfStateWithDistricts);
                    }
                }  
            }
            system.debug('MapOfCountry :' + mapOfCountriesStatesDistricts);
        }
        catch (DmlException e)
        {
            system.debug('An unexpected error has occurred: ' + e.getMessage());
        } 
    }
    
    //1. Find a combination of Country, state and districts where it starts with Same Letter!!
    public void findWithSpecialKeyword(String startWith){
        try{  
            //  Find out Country.State and District starts with a particular Keyword.         
            Map<String,Map<String,List<String>>> combinationOfCountryOfStateOfDistrict = new Map<String,Map<String,List<String>>>();
            
            List<District__c> listOfCombinations = [SELECT Name, State__r.Name, State__r.Country__r.Name
                                                   FROM District__c WHERE (Name LIKE :startWith + '%' AND State__r.Name LIKE :startWith + '%' AND 
                                                   State__r.Country__r.Name LIKE :startWith + '%')];
            if(listOfCombinations.size()>0){
                for(District__c district : listOfCombinations)
                {
                    if (!combinationOfCountryOfStateOfDistrict.containsKey(district.State__r.Country__r.Name))
                    {
                        combinationOfCountryOfStateOfDistrict.put(district.State__r.Country__r.Name, new Map<String,List<String>>());
                    }
                    Map<String,List<String>> mapOfCountryStateAndDistrict = combinationOfCountryOfStateOfDistrict.get(district.State__r.Country__r.Name);
                    if (!mapOfCountryStateAndDistrict.containsKey(district.State__r.Name))
                    {
                        mapOfCountryStateAndDistrict.put(district.State__r.Name, new List<String>());
                    }
                    mapOfCountryStateAndDistrict.get(district.State__r.Name).add(district.Name);
                    combinationOfCountryOfStateOfDistrict.put(district.State__r.Country__r.Name, mapOfCountryStateAndDistrict);
                }
            }
            System.debug('Combination Of Country, States and District by Given Letter:'+combinationOfCountryOfStateOfDistrict);
        }
        catch(Exception e)
        {
            System.debug('An unexpected error has occurred: ' + e.getMessage());
        }
    }              
    
    //2.Find such a District which length is more or equal to Given Letter!!!!
    public void lengthOfDistrict(Integer maxLength){
        List<String> districtSize = new List<String>();
        for(String countryName : mapOfCountriesStatesDistricts.keySet()){
            for(String stateName : mapOfCountriesStatesDistricts.get(countryName).keySet()){
                for(String districtName : mapOfCountriesStatesDistricts.get(countryName).get(stateName) ){
                    if( districtName.length() >= maxLength){
                        districtSize.add(districtName); 
                    }
                }  	  
            }
        } 
        if(!districtSize.isEmpty()){
            System.debug('District with Greater Interger : '+ districtSize);
            
        }
    }
    
   
    //JSON Generator Start For Country State District*********!
    public void countryStateJSonGenerator(String countryName, String stName) {
        Country wrapCountry = new Country();
        wrapCountry.countryName = countryName;
        wrapCountry.states = new List<States>();
        List<AggregateResult> listOfAggrStates = [SELECT COUNT(Name)	Total_States__c FROM State__c Where Country__r.Name like :countryName  Group By Country__r.Name];  
        
        wrapCountry.totalNumberOfStates =  (Decimal)listOfAggrStates[0].get('Total_States__c');
        
        List<AggregateResult> listOfAggrDistricts = [SELECT COUNT(Name)Total_Districts__c FROM District__c Where State__r.Country__r.Name like :countryName Group By State__r.Country__r.Name];    
        
        wrapCountry.totalNumberOfDistricts = (Decimal)listOfAggrDistricts[0].get('Total_Districts__c');
        
        for(String state : mapOfCountriesStatesDistricts.get(countryName).keyset()) {
            if(state == stName) {
                States wrapSt = new States();
                wrapSt.stateName = state;
                wrapSt.districts = new list<Districts>();
                
                List<AggregateResult> listOfAggrDistrictState = [SELECT COUNT(Name)Total_Districts__c FROM District__c Where State__r.Country__r.Name like :countryName  Group By State__r.Name];
                
                wrapSt.totalNumberOfDistricts =(Decimal)listOfAggrDistrictState[0].get('Total_Districts__c');
                
                stateDistrictCount = wrapSt.totalNumberOfDistricts;
                
                for(String district : mapOfCountriesStatesDistricts.get(countryName).get(state)) {
                    Districts wrapDst = new Districts();
                    wrapDst.districtName = district;
                    wrapSt.districts.add(wrapDst);
                }
                // country's states
                wrapCountry.states.add(wrapSt);
            }        
        }
        String json = JSON.serialize(wrapCountry);
        // Passing JSON Data to Country UI
        List<Country__c> jsonData = [SELECT Id, Name, Country_JSON_Data__c, Total_Districts__c, Total_States__c FROM Country__c WHERE Name = :countryName LIMIT 1];
        jsonData[0].Total_States__c = wrapCountry.totalNumberOfStates;
        jsonData[0].Total_Districts__c = wrapCountry.totalNumberOfDistricts;
        jsonData[0].Country_JSON_Data__c = json;
        update jsonData;
        
        List<State__c> stateData = [SELECT Id, Name, Total_Districts__c FROM State__c WHERE Name =:stName];
        
        for(State__c state : stateData) {
            state.Total_Districts__c = stateDistrictCount;
        }
        update stateData;
        //stateData[0].Total_Districts__c = stateDistrictCount;
        
        System.debug('Check This JSON DATA in JSON Beautify:'+json);
    } 
} 
/* For Execute This Code*****************!!
CountryStatesDistrictDynamicMap m1 = new CountryStatesDistrictDynamicMap();
m1.findWithSpecialKeyword('U');
m1.lengthOfDistrict(6);
m1.CountryStateJSonGenerator('India','Haryana');

output*************************!!
18:51:10:688 USER_DEBUG [52]|DEBUG|MapOfCountry :{Bangladesh={Barishal=(Bhola, Patuakhali, Jhalokati), Dhaka=(Tangail, Faridpur, Rajbari)}, India={Haryana=(Ambala, Karnal, Panipat), Rajathan=(Kota, Jaipur, Udaipur), Uttar Pradesh=(Gaziabad, Merrut, Shamli)}, USA={Texas=(Houstan, Austin, McAllen), Utah=(Salt Lake City, Sandy, Urovo)}}
18:51:11:369 USER_DEBUG [83]|DEBUG|Combination Of Country, States and District by Given Letter:{USA={Utah=(Urovo)}}
18:51:11:373 USER_DEBUG [104]|DEBUG|District with Greater Interger : (Tangail, Faridpur, Rajbari, Patuakhali, Jhalokati, Salt Lake City, Houstan, Austin, McAllen, Ambala, ...)
18:51:14:756 USER_DEBUG [159]|DEBUG|Check This JSON DATA in JSON Beautify:{"totalNumberOfStates":3,"totalNumberOfDistricts":9,"states":[{"totalNumberOfDistricts":3,"stateName":"Haryana","districts":[{"districtName":"Ambala"},{"districtName":"Karnal"},{"districtName":"Panipat"}]}],"countryName":"India"}
*/
