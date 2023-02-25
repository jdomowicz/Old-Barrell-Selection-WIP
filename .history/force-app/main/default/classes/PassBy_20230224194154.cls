public with sharing class PassBy {

    public static void timestwo(Integer value) {

        value = value *2;

    }

    public static Integer timestwoInt(Integer value) {

       return value = value *2;

    }


    public static void timestwoList(list<Integer> valueList) {

        for(Integer i: valueList){
                i = i *2;
        }

    }

    public static void timestwoListArray(list<Integer> valueList) {

        for(i =0 i: valueList){
                i = i *2;
        }

    }
}