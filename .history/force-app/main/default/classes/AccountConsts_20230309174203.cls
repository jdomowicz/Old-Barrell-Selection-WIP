// AccountConstsConsts.cls
public class AccountConsts {
   // public static final AccountConsts INSTANCE = new AccountConsts();

    public final String API_NAME = Account.sObjectType.getDescribe().getName();

    public final LeadSource LEAD_SOURCE = new LeadSource();

    private class LeadSource {
        public final String OTHER = 'Other';
        public final String PARTNER_REFERRAL = 'Partner Referral';
        public final String PHONE_INQUIRY = 'Phone Inquiry';
        public final String PURCHASED_LIST = 'Purchased List';
        public final String WEB = 'Web';
    }
}