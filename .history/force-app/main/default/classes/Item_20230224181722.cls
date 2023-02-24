public with sharing class Item {

    private final Double UnitPrice;
    private final Integer Quantiity;

        public Item() {

        this.UnitPrice = unitPrice;
        this.Quantiity = quantiity;

    }

    public Item(Double unitPrice,Integer quantity) {

        this.UnitPrice = unitPrice;
        this.Quantiity = quantiity;

    }

    public Double getUnitPrice(){
        return UnitPrice;
    }
}