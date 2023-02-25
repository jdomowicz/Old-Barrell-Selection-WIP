public with sharing class Item {
  private final Double UnitPrice;
  private final Integer Quantiity;

  public Item() {
    system.debug('Constructor with no argument called');
  }

  public Item(Double unitPrice, Integer quantity) {
    this.UnitPrice = unitPrice;
    this.Quantiity = quantity;
  }

  public Double getUnitPrice() {
    return UnitPrice;
  }

    public Double getQuantity() {
        return UnitPrice*Quantiity;
  }

    public Double getItemValue() {
    return UnitPrice*Quantiity;
  }
}
