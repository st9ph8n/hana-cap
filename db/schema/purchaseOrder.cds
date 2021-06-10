using {
    Currency,
    managed,
    sap,
    cuid
} from '@sap/cds/common';

using {opensap.common} from './common';
using {opensap.MD} from './masterData';

namespace opensap.PurchaseOrder;

entity Headers : managed, cuid, common.Amount {
    @cascade : {all}
    item                         : Composition of many Items
                                       on item.poHeader = $self;
    noteId                       : common.BusinessKey null;
    partner                      : Association to one MD.BusinessPartners; // in sap sold to part and ship to can be different
    lifecycleSatus               : common.StatusT default 'N';
    approvalStatus               : common.StatusT;
    confirmStatus                : common.StatusT;
    orderingStatus               : common.StatusT;
    invoicingStatus              : common.StatusT;
    @readonly createdByEmployee  : Association to one MD.Employees
                                       on createdByEmployee.email = createdBy;
    @readonly modifiedByEmployee : Association to one MD.Employees
                                       on modifiedByEmployee.email = modifiedBy;
}

annotate Headers with @(
    title       : '{i18n>poService}',
    description : '{i18n>poService}'
) {
    ID    @(
        title       : '{i18>po_id}',
        description : '{i18>po_id}',
    );

    items @(
        title       : '{i18n>po_items}',
        description : '{i18n>po_items}',
        Common      : {Text : {
            $value                 : ITEMS.PRODUCT,
            ![@UI.TextArrangement] : #TextOnly
        }}
    );

    noteId @(
        title : '{i18n>notes}',
        description: '{i18n>notes}'
    );

    partner @(
        tite : '{i18n>partener_id}',
        
    )

}

entity Items : cuid, common.Amount, common.Quantity {
    poHeader : Association to Headers;

}
