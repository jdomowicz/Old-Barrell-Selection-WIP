public with sharing class Item {

    private final Double UnitPrice;
    private final Integer Quantiity;

        public Item() {

            system.debug();

    }

    public Item(Double unitPrice,Integer quantity) {

        this.UnitPrice = unitPrice;
        this.Quantiity = quantiity;

    }

    public Double getUnitPrice(){
        return UnitPrice;
    }
}