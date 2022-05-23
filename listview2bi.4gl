IMPORT util
MAIN
    DEFINE arr DYNAMIC ARRAY OF RECORD
        field1 STRING,
        field2 STRING,
        img STRING
    END RECORD
    DEFINE i INTEGER

    CALL ui.Interface.loadStyles("listview2bi.4st")
    FOR i = 1 TO 100
        LET arr[i].field1 = random_text()

        LET arr[i].field2 = random_text()

        LET arr[i].img = "smiley"
    END FOR
    CLOSE WINDOW SCREEN
    OPEN WINDOW w WITH FORM "listview2bi"
    DISPLAY ARRAY arr TO scr.*
END MAIN

FUNCTION random_text()
    DEFINE
        word_count INTEGER,
        letter_count INTEGER
    DEFINE
        word_idx INTEGER,
        letter_idx INTEGER
    DEFINE sb base.StringBuffer

    LET sb = base.StringBuffer.create()
    LET word_count = util.Math.rand(3) + 1
    FOR word_idx = 1 TO word_count
        IF word_idx > 1 THEN
            CALL sb.append(" ")
        END IF
        LET letter_count = util.Math.rand(8) + 3
        FOR letter_idx = 1 TO letter_count
            IF letter_idx = 1 THEN
                CALL sb.append(ASCII (util.Math.rand(26) + 65))
            ELSE
                CALL sb.append(ASCII (util.Math.rand(26) + 97))
            END IF
        END FOR
    END FOR
    RETURN sb.toString()

END FUNCTION
