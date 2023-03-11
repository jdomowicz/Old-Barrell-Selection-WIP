// Consts.cls
public with sharing class ConstsV2 {


    public static final ContactConsts CONTACT {


    ContactConsts c = new ContactConsts();
       return c;
        /*
        get {
            return ContactConsts.INSTANCE;
        }
        */
    }

     public static final AccountConsts ACCOUNT {
        get {
          //  return AccountConsts.INSTANCE;
            return new AccountConsts();
        }
    }
}