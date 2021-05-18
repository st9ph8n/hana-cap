using from './schema/common';
using from './schema/conversions';
using from './schema/log';
using from './schema/masterData';

entity Base{
    Key ID: Integer;
}

aspect managedobject{
    created { at: Timestamp; }
}

extend Base with managedobject;