public with sharing class PassBy {

    public void timestwo(Integer value) {

        value = value *2;

    }


    public void timestwoList(list<Integer> value) {

        for(Integer i:value){
        value = value *2;
        }

    }
}