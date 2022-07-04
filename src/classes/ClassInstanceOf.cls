public virtual class ClassInstanceOf {

    public virtual class House extends ClassInstanceOf {
        public void instOf(ClassInstanceOf a){
            if(a InstanceOf House){
                House h=(House)a;//downcasting
                System.debug('Downcasting performed');
            }else {
                System.debug('Upcasting performed');
            }
            /*For Execute this Code ClassInstanceOf.House mp = new ClassInstanceOf.House();
             mp.instOf(mp);*/
        }
    }
}