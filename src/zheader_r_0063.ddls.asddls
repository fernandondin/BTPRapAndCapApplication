@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Header - Root'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZHEADER_R_0063 as select from zheader_0063_a
composition [0..*] of ZITEM_R_0063          as _Item
{
    key header_uuid as HeaderUUID,
    id as Id,
    email as Email,
    fname as Fname,
    lname as Lname,
    country as Country,
    created_on as CreatedOn,
    delivery_date as DeliveryDate,
    order_status as OrderStatus,
    image_url as ImageUrl,
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    local_last_changed_at as LocalLastChangedAt,
    @Semantics.systemDateTime.lastChangedAt: true
    last_changed_at as LastChangedAt,
    _Item // Make association public
}
