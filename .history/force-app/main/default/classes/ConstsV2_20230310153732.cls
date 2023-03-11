// Consts.cls
public with sharing class ConstsV2 {


    public static  ContactConsts CONTACT {


       return ContactConsts.INSTANCE;
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