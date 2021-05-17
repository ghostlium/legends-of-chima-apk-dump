.class abstract Lnet/minidev/json/parser/JSONParserMemory;
.super Lnet/minidev/json/parser/JSONParserBase;
.source "JSONParserMemory.java"


# instance fields
.field protected len:I


# direct methods
.method public constructor <init>(I)V
    .locals 0
    .param p1, "permissiveMode"    # I

    .prologue
    .line 35
    invoke-direct {p0, p1}, Lnet/minidev/json/parser/JSONParserBase;-><init>(I)V

    .line 36
    return-void
.end method


# virtual methods
.method protected abstract extractString(II)V
.end method

.method protected extractStringTrim(II)V
    .locals 1
    .param p1, "start"    # I
    .param p2, "stop"    # I

    .prologue
    .line 140
    invoke-virtual {p0, p1, p2}, Lnet/minidev/json/parser/JSONParserMemory;->extractString(II)V

    .line 141
    iget-object v0, p0, Lnet/minidev/json/parser/JSONParserMemory;->xs:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lnet/minidev/json/parser/JSONParserMemory;->xs:Ljava/lang/String;

    .line 142
    return-void
.end method

.method protected abstract indexOf(CI)I
.end method

.method protected readNQString([Z)V
    .locals 2
    .param p1, "stop"    # [Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 39
    iget v0, p0, Lnet/minidev/json/parser/JSONParserMemory;->pos:I

    .line 40
    .local v0, "start":I
    invoke-virtual {p0, p1}, Lnet/minidev/json/parser/JSONParserMemory;->skipNQString([Z)V

    .line 41
    iget v1, p0, Lnet/minidev/json/parser/JSONParserMemory;->pos:I

    invoke-virtual {p0, v0, v1}, Lnet/minidev/json/parser/JSONParserMemory;->extractStringTrim(II)V

    .line 42
    return-void
.end method

.method protected readNumber([Z)Ljava/lang/Object;
    .locals 8
    .param p1, "stop"    # [Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v7, 0x2e

    const/16 v6, 0x7e

    const/16 v5, 0x45

    const/16 v3, 0x1a

    const/4 v4, 0x1

    .line 45
    iget v0, p0, Lnet/minidev/json/parser/JSONParserMemory;->pos:I

    .line 47
    .local v0, "start":I
    invoke-virtual {p0}, Lnet/minidev/json/parser/JSONParserMemory;->read()V

    .line 48
    invoke-virtual {p0}, Lnet/minidev/json/parser/JSONParserMemory;->skipDigits()V

    .line 51
    iget-char v1, p0, Lnet/minidev/json/parser/JSONParserMemory;->c:C

    if-eq v1, v7, :cond_2

    iget-char v1, p0, Lnet/minidev/json/parser/JSONParserMemory;->c:C

    if-eq v1, v5, :cond_2

    iget-char v1, p0, Lnet/minidev/json/parser/JSONParserMemory;->c:C

    const/16 v2, 0x65

    if-eq v1, v2, :cond_2

    .line 52
    invoke-virtual {p0}, Lnet/minidev/json/parser/JSONParserMemory;->skipSpace()V

    .line 53
    iget-char v1, p0, Lnet/minidev/json/parser/JSONParserMemory;->c:C

    if-ltz v1, :cond_1

    iget-char v1, p0, Lnet/minidev/json/parser/JSONParserMemory;->c:C

    if-ge v1, v6, :cond_1

    iget-char v1, p0, Lnet/minidev/json/parser/JSONParserMemory;->c:C

    aget-boolean v1, p1, v1

    if-nez v1, :cond_1

    iget-char v1, p0, Lnet/minidev/json/parser/JSONParserMemory;->c:C

    if-eq v1, v3, :cond_1

    .line 55
    invoke-virtual {p0, p1}, Lnet/minidev/json/parser/JSONParserMemory;->skipNQString([Z)V

    .line 56
    iget v1, p0, Lnet/minidev/json/parser/JSONParserMemory;->pos:I

    invoke-virtual {p0, v0, v1}, Lnet/minidev/json/parser/JSONParserMemory;->extractStringTrim(II)V

    .line 57
    iget-boolean v1, p0, Lnet/minidev/json/parser/JSONParserMemory;->acceptNonQuote:Z

    if-nez v1, :cond_0

    .line 58
    new-instance v1, Lnet/minidev/json/parser/ParseException;

    iget v2, p0, Lnet/minidev/json/parser/JSONParserMemory;->pos:I

    iget-object v3, p0, Lnet/minidev/json/parser/JSONParserMemory;->xs:Ljava/lang/String;

    invoke-direct {v1, v2, v4, v3}, Lnet/minidev/json/parser/ParseException;-><init>(IILjava/lang/Object;)V

    throw v1

    .line 59
    :cond_0
    iget-object v1, p0, Lnet/minidev/json/parser/JSONParserMemory;->xs:Ljava/lang/String;

    .line 107
    :goto_0
    return-object v1

    .line 61
    :cond_1
    iget v1, p0, Lnet/minidev/json/parser/JSONParserMemory;->pos:I

    invoke-virtual {p0, v0, v1}, Lnet/minidev/json/parser/JSONParserMemory;->extractStringTrim(II)V

    .line 62
    iget-object v1, p0, Lnet/minidev/json/parser/JSONParserMemory;->xs:Ljava/lang/String;

    invoke-virtual {p0, v1}, Lnet/minidev/json/parser/JSONParserMemory;->parseNumber(Ljava/lang/String;)Ljava/lang/Number;

    move-result-object v1

    goto :goto_0

    .line 65
    :cond_2
    iget-char v1, p0, Lnet/minidev/json/parser/JSONParserMemory;->c:C

    if-ne v1, v7, :cond_3

    .line 67
    invoke-virtual {p0}, Lnet/minidev/json/parser/JSONParserMemory;->read()V

    .line 68
    invoke-virtual {p0}, Lnet/minidev/json/parser/JSONParserMemory;->skipDigits()V

    .line 70
    :cond_3
    iget-char v1, p0, Lnet/minidev/json/parser/JSONParserMemory;->c:C

    if-eq v1, v5, :cond_6

    iget-char v1, p0, Lnet/minidev/json/parser/JSONParserMemory;->c:C

    const/16 v2, 0x65

    if-eq v1, v2, :cond_6

    .line 71
    invoke-virtual {p0}, Lnet/minidev/json/parser/JSONParserMemory;->skipSpace()V

    .line 72
    iget-char v1, p0, Lnet/minidev/json/parser/JSONParserMemory;->c:C

    if-ltz v1, :cond_5

    iget-char v1, p0, Lnet/minidev/json/parser/JSONParserMemory;->c:C

    if-ge v1, v6, :cond_5

    iget-char v1, p0, Lnet/minidev/json/parser/JSONParserMemory;->c:C

    aget-boolean v1, p1, v1

    if-nez v1, :cond_5

    iget-char v1, p0, Lnet/minidev/json/parser/JSONParserMemory;->c:C

    if-eq v1, v3, :cond_5

    .line 74
    invoke-virtual {p0, p1}, Lnet/minidev/json/parser/JSONParserMemory;->skipNQString([Z)V

    .line 75
    iget v1, p0, Lnet/minidev/json/parser/JSONParserMemory;->pos:I

    invoke-virtual {p0, v0, v1}, Lnet/minidev/json/parser/JSONParserMemory;->extractStringTrim(II)V

    .line 76
    iget-boolean v1, p0, Lnet/minidev/json/parser/JSONParserMemory;->acceptNonQuote:Z

    if-nez v1, :cond_4

    .line 77
    new-instance v1, Lnet/minidev/json/parser/ParseException;

    iget v2, p0, Lnet/minidev/json/parser/JSONParserMemory;->pos:I

    iget-object v3, p0, Lnet/minidev/json/parser/JSONParserMemory;->xs:Ljava/lang/String;

    invoke-direct {v1, v2, v4, v3}, Lnet/minidev/json/parser/ParseException;-><init>(IILjava/lang/Object;)V

    throw v1

    .line 78
    :cond_4
    iget-object v1, p0, Lnet/minidev/json/parser/JSONParserMemory;->xs:Ljava/lang/String;

    goto :goto_0

    .line 80
    :cond_5
    iget v1, p0, Lnet/minidev/json/parser/JSONParserMemory;->pos:I

    invoke-virtual {p0, v0, v1}, Lnet/minidev/json/parser/JSONParserMemory;->extractStringTrim(II)V

    .line 81
    invoke-virtual {p0}, Lnet/minidev/json/parser/JSONParserMemory;->extractFloat()Ljava/lang/Number;

    move-result-object v1

    goto :goto_0

    .line 83
    :cond_6
    iget-object v1, p0, Lnet/minidev/json/parser/JSONParserMemory;->sb:Lnet/minidev/json/parser/JSONParserBase$MSB;

    invoke-virtual {v1, v5}, Lnet/minidev/json/parser/JSONParserBase$MSB;->append(C)V

    .line 84
    invoke-virtual {p0}, Lnet/minidev/json/parser/JSONParserMemory;->read()V

    .line 85
    iget-char v1, p0, Lnet/minidev/json/parser/JSONParserMemory;->c:C

    const/16 v2, 0x2b

    if-eq v1, v2, :cond_7

    iget-char v1, p0, Lnet/minidev/json/parser/JSONParserMemory;->c:C

    const/16 v2, 0x2d

    if-eq v1, v2, :cond_7

    iget-char v1, p0, Lnet/minidev/json/parser/JSONParserMemory;->c:C

    const/16 v2, 0x30

    if-lt v1, v2, :cond_a

    iget-char v1, p0, Lnet/minidev/json/parser/JSONParserMemory;->c:C

    const/16 v2, 0x39

    if-gt v1, v2, :cond_a

    .line 86
    :cond_7
    iget-object v1, p0, Lnet/minidev/json/parser/JSONParserMemory;->sb:Lnet/minidev/json/parser/JSONParserBase$MSB;

    iget-char v2, p0, Lnet/minidev/json/parser/JSONParserMemory;->c:C

    invoke-virtual {v1, v2}, Lnet/minidev/json/parser/JSONParserBase$MSB;->append(C)V

    .line 87
    invoke-virtual {p0}, Lnet/minidev/json/parser/JSONParserMemory;->read()V

    .line 88
    invoke-virtual {p0}, Lnet/minidev/json/parser/JSONParserMemory;->skipDigits()V

    .line 89
    invoke-virtual {p0}, Lnet/minidev/json/parser/JSONParserMemory;->skipSpace()V

    .line 90
    iget-char v1, p0, Lnet/minidev/json/parser/JSONParserMemory;->c:C

    if-ltz v1, :cond_9

    iget-char v1, p0, Lnet/minidev/json/parser/JSONParserMemory;->c:C

    if-ge v1, v6, :cond_9

    iget-char v1, p0, Lnet/minidev/json/parser/JSONParserMemory;->c:C

    aget-boolean v1, p1, v1

    if-nez v1, :cond_9

    iget-char v1, p0, Lnet/minidev/json/parser/JSONParserMemory;->c:C

    if-eq v1, v3, :cond_9

    .line 92
    invoke-virtual {p0, p1}, Lnet/minidev/json/parser/JSONParserMemory;->skipNQString([Z)V

    .line 93
    iget v1, p0, Lnet/minidev/json/parser/JSONParserMemory;->pos:I

    invoke-virtual {p0, v0, v1}, Lnet/minidev/json/parser/JSONParserMemory;->extractStringTrim(II)V

    .line 94
    iget-boolean v1, p0, Lnet/minidev/json/parser/JSONParserMemory;->acceptNonQuote:Z

    if-nez v1, :cond_8

    .line 95
    new-instance v1, Lnet/minidev/json/parser/ParseException;

    iget v2, p0, Lnet/minidev/json/parser/JSONParserMemory;->pos:I

    iget-object v3, p0, Lnet/minidev/json/parser/JSONParserMemory;->xs:Ljava/lang/String;

    invoke-direct {v1, v2, v4, v3}, Lnet/minidev/json/parser/ParseException;-><init>(IILjava/lang/Object;)V

    throw v1

    .line 96
    :cond_8
    iget-object v1, p0, Lnet/minidev/json/parser/JSONParserMemory;->xs:Ljava/lang/String;

    goto/16 :goto_0

    .line 98
    :cond_9
    iget v1, p0, Lnet/minidev/json/parser/JSONParserMemory;->pos:I

    invoke-virtual {p0, v0, v1}, Lnet/minidev/json/parser/JSONParserMemory;->extractStringTrim(II)V

    .line 99
    invoke-virtual {p0}, Lnet/minidev/json/parser/JSONParserMemory;->extractFloat()Ljava/lang/Number;

    move-result-object v1

    goto/16 :goto_0

    .line 101
    :cond_a
    invoke-virtual {p0, p1}, Lnet/minidev/json/parser/JSONParserMemory;->skipNQString([Z)V

    .line 102
    iget v1, p0, Lnet/minidev/json/parser/JSONParserMemory;->pos:I

    invoke-virtual {p0, v0, v1}, Lnet/minidev/json/parser/JSONParserMemory;->extractStringTrim(II)V

    .line 103
    iget-boolean v1, p0, Lnet/minidev/json/parser/JSONParserMemory;->acceptNonQuote:Z

    if-nez v1, :cond_b

    .line 104
    new-instance v1, Lnet/minidev/json/parser/ParseException;

    iget v2, p0, Lnet/minidev/json/parser/JSONParserMemory;->pos:I

    iget-object v3, p0, Lnet/minidev/json/parser/JSONParserMemory;->xs:Ljava/lang/String;

    invoke-direct {v1, v2, v4, v3}, Lnet/minidev/json/parser/ParseException;-><init>(IILjava/lang/Object;)V

    throw v1

    .line 105
    :cond_b
    iget-boolean v1, p0, Lnet/minidev/json/parser/JSONParserMemory;->acceptLeadinZero:Z

    if-nez v1, :cond_c

    .line 106
    invoke-virtual {p0}, Lnet/minidev/json/parser/JSONParserMemory;->checkLeadinZero()V

    .line 107
    :cond_c
    iget-object v1, p0, Lnet/minidev/json/parser/JSONParserMemory;->xs:Ljava/lang/String;

    goto/16 :goto_0
.end method

.method protected readString()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, -0x1

    .line 113
    iget-boolean v1, p0, Lnet/minidev/json/parser/JSONParserMemory;->acceptSimpleQuote:Z

    if-nez v1, :cond_1

    iget-char v1, p0, Lnet/minidev/json/parser/JSONParserMemory;->c:C

    const/16 v2, 0x27

    if-ne v1, v2, :cond_1

    .line 114
    iget-boolean v1, p0, Lnet/minidev/json/parser/JSONParserMemory;->acceptNonQuote:Z

    if-eqz v1, :cond_0

    .line 115
    sget-object v1, Lnet/minidev/json/parser/JSONParserMemory;->stopAll:[Z

    invoke-virtual {p0, v1}, Lnet/minidev/json/parser/JSONParserMemory;->readNQString([Z)V

    .line 133
    :goto_0
    return-void

    .line 118
    :cond_0
    new-instance v1, Lnet/minidev/json/parser/ParseException;

    iget v2, p0, Lnet/minidev/json/parser/JSONParserMemory;->pos:I

    const/4 v3, 0x0

    iget-char v4, p0, Lnet/minidev/json/parser/JSONParserMemory;->c:C

    invoke-static {v4}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v4

    invoke-direct {v1, v2, v3, v4}, Lnet/minidev/json/parser/ParseException;-><init>(IILjava/lang/Object;)V

    throw v1

    .line 120
    :cond_1
    iget-char v1, p0, Lnet/minidev/json/parser/JSONParserMemory;->c:C

    iget v2, p0, Lnet/minidev/json/parser/JSONParserMemory;->pos:I

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {p0, v1, v2}, Lnet/minidev/json/parser/JSONParserMemory;->indexOf(CI)I

    move-result v0

    .line 121
    .local v0, "tmpP":I
    if-ne v0, v3, :cond_2

    .line 122
    new-instance v1, Lnet/minidev/json/parser/ParseException;

    iget v2, p0, Lnet/minidev/json/parser/JSONParserMemory;->len:I

    const/4 v3, 0x3

    const/4 v4, 0x0

    invoke-direct {v1, v2, v3, v4}, Lnet/minidev/json/parser/ParseException;-><init>(IILjava/lang/Object;)V

    throw v1

    .line 123
    :cond_2
    iget v1, p0, Lnet/minidev/json/parser/JSONParserMemory;->pos:I

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {p0, v1, v0}, Lnet/minidev/json/parser/JSONParserMemory;->extractString(II)V

    .line 124
    iget-object v1, p0, Lnet/minidev/json/parser/JSONParserMemory;->xs:Ljava/lang/String;

    const/16 v2, 0x5c

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-ne v1, v3, :cond_3

    .line 125
    invoke-virtual {p0}, Lnet/minidev/json/parser/JSONParserMemory;->checkControleChar()V

    .line 126
    iput v0, p0, Lnet/minidev/json/parser/JSONParserMemory;->pos:I

    .line 127
    invoke-virtual {p0}, Lnet/minidev/json/parser/JSONParserMemory;->read()V

    goto :goto_0

    .line 131
    :cond_3
    iget-object v1, p0, Lnet/minidev/json/parser/JSONParserMemory;->sb:Lnet/minidev/json/parser/JSONParserBase$MSB;

    invoke-virtual {v1}, Lnet/minidev/json/parser/JSONParserBase$MSB;->clear()V

    .line 132
    invoke-virtual {p0}, Lnet/minidev/json/parser/JSONParserMemory;->readString2()V

    goto :goto_0
.end method
