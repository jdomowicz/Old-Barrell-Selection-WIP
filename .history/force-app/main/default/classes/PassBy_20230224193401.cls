public with sharing class PassBy {

    public void timestwo(Integer value) {

        value = value *2;

    }


    public void timestwoList(list<Integer> valueList) {

        for(Integer i: valueList){
        i = value *2;
        }

    }
}