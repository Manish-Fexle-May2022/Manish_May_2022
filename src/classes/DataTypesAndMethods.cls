public with sharing class DataTypesAndMethods {   
        // *********APEX DATA TYPES ****************
    
        // Boolean
        public static void bolleanExample(){
            Boolean isWinner = True;
            System.debug(isWinner);
        }
       
        // Double
        public static void doubleExample(){
            Double d = 4.5689;
            System.debug(d);
        }
    
        // Decimal
       
        // ID
        public static void idExample(){
            Id i = '0012354TRF12543';
            System.debug(i);
        }
       
        // Integer
        public static void integerExample(){
            Integer i = 10;
            System.debug(i);
        }
       
        // Object
        public static void objectExample(){
            Object obj = 10;
            Integer i = (Integer)obj;
            System.debug(obj);
            System.assertEquals(10, i);
        }
    
        // String
        public static void stringExample(){
            String str1 = 'I am learning apex.';
            System.debug(str1);
        }
        //Long
        public static void longExample(){
            Long l = 2147483648L;
            System.debug(l);
        }
        // ********APEX COLLECTIONS ***************
    
        // Set Method
        public static void setMethod(){
            Set<Integer> setInt = new Set<Integer>();
            setInt.add(5);
            setInt.add(45);
            setInt.add(78);
            setInt.add(21);
            System.debug(setInt);      
        }
        // Map method
        public static void mapMethod(){
            Map<Integer,String> rollNoName = new Map<Integer,String>();
            rollNoName.put(45,'Nikhil kumawat');
            rollNoName.put(02,'Nukul kataria');
            System.debug(rollNoName);
        }  
        // *******************Date methods :-->>
        // 1.->addDays(additionalDays)  
            public static void addDays(){
            Date myDate = Date.newInstance(1960, 2, 17);    
            Date newDate = mydate.addDays(2);
            System.debug(newDate);
        }
        // 2.->addMonths(additionalMonths)  
            public static void addMonths(){
            date myDate = date.newInstance(1990, 11, 21);
            date newDate = myDate.addMonths(3);
            System.debug(newDate);
        }
        // 3.->addYears(additionalYears)
            public static void addYears(){
            date myDate = date.newInstance(1983, 7, 15);
            date newDate = myDate.addYears(2);
            System.debug(newDate);
        }
        // 4.->day()
            public static void day(){
            date myDate = date.newInstance(1989, 4, 21);
            Integer day = myDate.day();
            System.debug(day);
        }
        // *****************String Methods:->
        // 1.-> abbreviate(maxWidth)
            public static void abbreviate(){
            String s = 'Hello Maximillian';
            String s2 = s.abbreviate(8);
            System.assertEquals('Hello...', s2);
            System.assertEquals(8, s2.length());
        }
        // 2.->charAt(index)
            public static void charAt(){
            String str = 'Ω is Omega.';
            System.debug(str.charAt(0));
        }
        // 3.->compareTo(secondString)
            public static void compareTo(){
            String myString1 = 'abcde';
            String myString2 = 'abcd';
            Integer result = myString1.compareTo(myString2);
            System.debug(result);
        }
        // 4.->contains(substring)  
            public static void contains(){
            String myString1 = 'abcde';
            String myString2 = 'abcd';
            Boolean result = myString1.contains(myString2);
            System.debug(result);
        }
        // 5.->indexOf(substring)   
            public static void substring(){
            String myString1 = 'abcde';
            String myString2 = 'cd';
            Integer result = myString1.indexOf(mystring2);
            System.debug(result);
        }
        // 6.-> trim() 
            public static void trim(){
            String s1 = '   Hello!   ';
            String trimmed = s1.trim();
            System.debug(trimmed);
        }
        // 7.->endsWith(suffix) 
            public static void endsWith(){
            String s = 'Hello Jason';
            System.debug(s.endsWith('Jason'));
        }
        // 8.->isAllLowerCase()
            public static void isAllLowerCase(){
            String allLower = 'abcde';
            System.debug(allLower.isAllLowerCase());
        }    
        // 9.-> toUpperCase()
            public static void toUpperCase(){
            String myString1 = 'abcd';
            String myString2 = 'ABCD';
            myString1 = myString1.toUpperCase();
            Boolean result = myString1.equals(myString2);
            System.debug(result);
        }
        // 11.->isAllUpperCase()
            public static void isAllUpperCase(){
            String allUpper = 'ABCDE';
            System.debug(allUpper.isAllUpperCase());
        }
        // ***************DateTime methods:->
        // 1.->timeGmt()
            public static void timeGMT(){
            DateTime dt = DateTime.newInstance(2004, 1, 27, 4, 1, 2);
            Time expected = Time.newInstance(12, 1, 2, 0);
            System.debug(dt.timeGMT());
        }
        // 2.->format(dateFormatString)
            public static void format(){     
            Datetime myDT = DateTime.newInstance(2022, 5, 4, 19, 37, 55);
            String myDate = myDT.format('yyyy-MM-dd h:mm a');
            String expected = '2022-05-04 7:37 PM';
            System.assertEquals(expected, myDate);
        }
        // 3.->newInstance(year, month, day, hour, minute, second)
            public static void newInstance(){ 
            Datetime myDate = Datetime.newInstance(2008, 12, 1, 12, 30, 2);
        }
        // 4.->valueOf(dateTimeString)
            public static void valueOf(){
            string year = '2008';
            string month = '10';
            string day = '5';
            string hour = '12';
            string minute = '20';
            string second = '20';
            string stringDate = year + '-' + month + '-' + day + ' ' + hour + ':' + minute +  ':' + second;
            Datetime myDate = Datetime.valueOf(stringDate);
            System.debug(stringDate);
        }
        // 5.->isSameDay(dateToCompare) 
            public static void isSameDay(){
            datetime myDate = datetime.now();
            datetime dueDate = datetime.newInstance(2008, 1, 30);
            boolean dueNow = myDate.isSameDay(dueDate);
            System.debug(dueNow);
        }
        // 6.->now()
            public static void now(){
            datetime myDateTime = datetime.now();
            System.debug(myDateTime);
    }

    
}