public with sharing class passBysObj {
  public static void returnUpdateAcc(list<Account> accList) {
    for (Integer i = 0; i < accList.size(); i++) {
      accList[i].Name = 'Acc updated in class';
    }
  }

  // create new list
  public static void returnUpdateAccWithNewList(list<Account> accList) {
    list<Account> alist = accList;

    for (Account a : alist) {
      a.Name = 'Acc updated in class updated';
    }
  }
}