public with sharing class Item {

    private final double UnitPrice;
    private final double Quantiity;

    public Item( Double unitPrice,Integer quantity) {

        this.unitPrice = unitPrice;
        this.Quantiity = quantiity;

    }

    public double getUnitPrice(){
        return UnitPrice;
    }
}