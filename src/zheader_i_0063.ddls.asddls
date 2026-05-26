@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Header - Interface'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZHEADER_I_0063 
provider contract transactional_interface
as projection on ZHEADER_R_0063
{
    key HeaderUUID,
    HeaderID,
    Email,
    Fname,
    Lname,
    Country,
    CreatedOn,
    DeliveryDate,
    OrderStatus,
    ImageUrl,
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    LocalLastChangedAt,
    @Semantics.systemDateTime.lastChangedAt: true
    LastChangedAt,
    /* Associations */
    _Item: redirected to composition child ZITEM_I_0063
}
