using from './schema/common';

entity Base{
    Key ID: Integer;
}

aspect managedobject{
    created { at: Timestamp; }
}

extend Base with managedobject;