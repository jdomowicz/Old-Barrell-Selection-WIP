public with sharing class passBysObj {


        public static void returnUpdateAcc(list<Account> accList) {

        for(Integer i=0 ; i < accList.size(); i++){

                accList[i].Name = 'Acc updated in class';

    }

}

    public static void returnUpdateAccWithListLoop(list<Account> accList) {

        for(Account a : accList){

                a.Name = 'Acc updated in class';

        }
}

 public static void returnUpdateAccWithListLoop(list<Account> accList) {

        for(Account a : accList){

                a.Name = 'Acc updated in class';

    }
    
}