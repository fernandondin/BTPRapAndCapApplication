@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Header - Consumption entity'
@Metadata.ignorePropagatedAnnotations: true

@Metadata.allowExtensions: true
@Search.searchable: true
@ObjectModel.semanticKey: [ 'HeaderID' ]
define root view entity ZHEADER_C_0063 
provider contract transactional_query
as projection on ZHEADER_R_0063
{
    key HeaderUUID,
    @Search.defaultSearchElement: true
    HeaderID,
    Email,
    Fname,
    Lname,
    Country,
    CreatedOn,
    DeliveryDate,
    OrderStatus,
    ImageUrl,
    LocalLastChangedAt,
    LastChangedAt,
    /* Associations */
    _Item: redirected to composition child ZITEM_C_0063
}
