// Consts.cls
public with sharing class ConstsV2 {



    public ContactConsts CONTACT2{

    };

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
}