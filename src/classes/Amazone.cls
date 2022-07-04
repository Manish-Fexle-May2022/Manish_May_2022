public with sharing class Amazone {
    public interface PurchaseOrder {
       
        Double discount();
    }

    public class CustomerPurchaseOrder implements PurchaseOrder {
        public Double discount() {
            return .5;  // Flat 5% discount
        }
    }
    public class EmployeePurchaseOrder implements PurchaseOrder {
        public Double discount() {
          return .10;  // It’s worth it being an employee! 10% discount
        } 
    }
    public class ProcessPurchaseOrder{
        public ProcessPurchaseOrder(){
            PurchaseOrder order1 = new CustomerPurchaseOrder();
            order1.discount();
            Processorder(order1);

            PurchaseOrder order2 = new EmployeePurchaseOrder();
            order2.discount();
            Processorder(order2);
        }

        public void processorder(PurchaseOrder order){
            System.debug('Check Discount:::'+ order.discount());
        }
        //Use Amazone.ProcessPurchaseOrder ac = new Amazone.ProcessPurchaseOrder(); For Execute!!!!
    }   
}