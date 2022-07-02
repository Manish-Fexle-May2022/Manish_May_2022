public with sharing class ConstructorClass {
    // Non Parameterized Constructor**********
        
    String countryName;
    Integer countryPopulation;

    public ConstructorClass(){
          countryName='india';
          countryPopulation=138000000;
          System.debug(countryName);
          System.debug(countryPopulation);
    }
    //Parameterized Constructor**********
    //Constructor that takes a string argument and Integer argument
    public ConstructorClass(String countryName, Integer countryPopulation){
          this.countryName = countryName;
          this.countryPopulation = countryPopulation;
    }
       
    //* Method to print class variables
        
    public void printClassVariables(){
          System.debug('Country Name: ' + countryName);
          System.debug('Country Population: ' + countryPopulation);
    }
}
   
