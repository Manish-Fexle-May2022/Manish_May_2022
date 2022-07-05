public virtual class SuperClass {

    public String mySalutation;
    public String myFirstName;
    public String myLastName;

    public SuperClass() {

        mySalutation = 'Mr.';
        myFirstName = 'Manish';
        myLastName = 'Prajapati';
    }

    public SuperClass(String salutation, String firstName, String lastName) {

        mySalutation = salutation;
        myFirstName = firstName;
        myLastName = lastName;
    }

    public virtual void printName() {
        System.debug('My name is ' + mySalutation +myFirstName+ myLastName);
    }

    public virtual String getFirstName() {
        return myFirstName;
    }
    public class Subclass extends Superclass {
        public override void printName() {
            super.printName();
            System.debug('But you can call me ' + super.getFirstName());
        }
        public Subclass() {
            super('mr', 'Prajapati', 'mani');
        }
        /*For Exicute this code Use SuperClass.Subclass mp = new SuperClass.Subclass();
        mp.printName();*/
    }
}