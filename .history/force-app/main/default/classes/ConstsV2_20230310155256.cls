// Consts.cls
public with sharing class ConstsV2 {


    // this is a property not a function
    public static final ContactConsts CONTACT {

        get {
            return ContactConsts.INSTANCE;
        }
    }

     public static final AccountConsts ACCOUNT {
        get {
          //  return AccountConsts.INSTANCE;
            return new AccountConsts();
        }
    }

    //this is a function and its called as function 
    public static ContactConsts cclass() {

         ContactConsts  c = ContactConsts.INSTANCE;
         return c;


    }

}