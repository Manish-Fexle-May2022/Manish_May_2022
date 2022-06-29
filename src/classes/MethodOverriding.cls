public virtual class MethodOverriding {
    public virtual class Parent{
        private integer pvt;
        protected integer ptd;
        public integer pub;
	public virtual void getvalues (){
            system.debug ('Pvt Mem' +pvt);
            system.debug('ptd Mem' +ptd);
            system.debug ('pub mem'+ pub);
        }
    }
    public virtual class Child extends Parent {
        private integer pvt;
        public override void getvalues() {
            system.debug ('Pvt ch Mem' + pvt);
        }
    }
    public class Test {
        public void main() {
            Parent p1= new Parent ();
            p1.getvalues ();
            Child c1= new Child();    
            c1.getvalues ();
        }
    }    
}
