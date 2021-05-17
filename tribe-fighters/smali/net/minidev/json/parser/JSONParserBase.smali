.class abstract Lnet/minidev/json/parser/JSONParserBase;
.super Ljava/lang/Object;
.source "JSONParserBase.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnet/minidev/json/parser/JSONParserBase$MSB;
    }
.end annotation


# static fields
.field public static final EOI:B = 0x1at

.field protected static final MAX_STOP:C = '~'

.field protected static stopAll:[Z

.field protected static stopArray:[Z

.field protected static stopKey:[Z

.field protected static stopValue:[Z

.field protected static stopX:[Z


# instance fields
.field protected final acceptLeadinZero:Z

.field protected final acceptNaN:Z

.field protected final acceptNonQuote:Z

.field protected final acceptSimpleQuote:Z

.field protected final acceptUselessComma:Z

.field protected c:C

.field protected final checkTaillingData:Z

.field protected containerFactory:Lnet/minidev/json/parser/ContainerFactory;

.field protected handler:Lnet/minidev/json/parser/ContentHandler;

.field protected final ignoreControlChar:Z

.field protected pos:I

.field protected final sb:Lnet/minidev/json/parser/JSONParserBase$MSB;

.field protected final useHiPrecisionFloat:Z

.field protected final useIntegerStorage:Z

.field protected xo:Ljava/lang/Object;

.field protected xs:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/16 v7, 0x3a

    const/16 v4, 0x2c

    const/16 v1, 0x7e

    const/16 v6, 0x1a

    const/4 v5, 0x1

    .line 46
    new-array v0, v1, [Z

    sput-object v0, Lnet/minidev/json/parser/JSONParserBase;->stopAll:[Z

    .line 47
    new-array v0, v1, [Z

    sput-object v0, Lnet/minidev/json/parser/JSONParserBase;->stopArray:[Z

    .line 48
    new-array v0, v1, [Z

    sput-object v0, Lnet/minidev/json/parser/JSONParserBase;->stopKey:[Z

    .line 49
    new-array v0, v1, [Z

    sput-object v0, Lnet/minidev/json/parser/JSONParserBase;->stopValue:[Z

    .line 50
    new-array v0, v1, [Z

    sput-object v0, Lnet/minidev/json/parser/JSONParserBase;->stopX:[Z

    .line 53
    sget-object v0, Lnet/minidev/json/parser/JSONParserBase;->stopKey:[Z

    sget-object v1, Lnet/minidev/json/parser/JSONParserBase;->stopKey:[Z

    aput-boolean v5, v1, v6

    aput-boolean v5, v0, v7

    .line 54
    sget-object v0, Lnet/minidev/json/parser/JSONParserBase;->stopValue:[Z

    sget-object v1, Lnet/minidev/json/parser/JSONParserBase;->stopValue:[Z

    const/16 v2, 0x7d

    sget-object v3, Lnet/minidev/json/parser/JSONParserBase;->stopValue:[Z

    aput-boolean v5, v3, v6

    aput-boolean v5, v1, v2

    aput-boolean v5, v0, v4

    .line 55
    sget-object v0, Lnet/minidev/json/parser/JSONParserBase;->stopArray:[Z

    sget-object v1, Lnet/minidev/json/parser/JSONParserBase;->stopArray:[Z

    const/16 v2, 0x5d

    sget-object v3, Lnet/minidev/json/parser/JSONParserBase;->stopArray:[Z

    aput-boolean v5, v3, v6

    aput-boolean v5, v1, v2

    aput-boolean v5, v0, v4

    .line 56
    sget-object v0, Lnet/minidev/json/parser/JSONParserBase;->stopX:[Z

    aput-boolean v5, v0, v6

    .line 57
    sget-object v0, Lnet/minidev/json/parser/JSONParserBase;->stopAll:[Z

    sget-object v1, Lnet/minidev/json/parser/JSONParserBase;->stopAll:[Z

    aput-boolean v5, v1, v7

    aput-boolean v5, v0, v4

    .line 58
    sget-object v0, Lnet/minidev/json/parser/JSONParserBase;->stopAll:[Z

    const/16 v1, 0x5d

    sget-object v2, Lnet/minidev/json/parser/JSONParserBase;->stopAll:[Z

    const/16 v3, 0x7d

    sget-object v4, Lnet/minidev/json/parser/JSONParserBase;->stopAll:[Z

    aput-boolean v5, v4, v6

    aput-boolean v5, v2, v3

    aput-boolean v5, v0, v1

    .line 59
    return-void
.end method

.method public constructor <init>(I)V
    .locals 4
    .param p1, "permissiveMode"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 84
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    new-instance v0, Lnet/minidev/json/parser/JSONParserBase$MSB;

    const/16 v3, 0xf

    invoke-direct {v0, v3}, Lnet/minidev/json/parser/JSONParserBase$MSB;-><init>(I)V

    iput-object v0, p0, Lnet/minidev/json/parser/JSONParserBase;->sb:Lnet/minidev/json/parser/JSONParserBase$MSB;

    .line 85
    and-int/lit8 v0, p1, 0x4

    if-lez v0, :cond_0

    move v0, v1

    :goto_0
    iput-boolean v0, p0, Lnet/minidev/json/parser/JSONParserBase;->acceptNaN:Z

    .line 86
    and-int/lit8 v0, p1, 0x2

    if-lez v0, :cond_1

    move v0, v1

    :goto_1
    iput-boolean v0, p0, Lnet/minidev/json/parser/JSONParserBase;->acceptNonQuote:Z

    .line 87
    and-int/lit8 v0, p1, 0x1

    if-lez v0, :cond_2

    move v0, v1

    :goto_2
    iput-boolean v0, p0, Lnet/minidev/json/parser/JSONParserBase;->acceptSimpleQuote:Z

    .line 88
    and-int/lit8 v0, p1, 0x8

    if-lez v0, :cond_3

    move v0, v1

    :goto_3
    iput-boolean v0, p0, Lnet/minidev/json/parser/JSONParserBase;->ignoreControlChar:Z

    .line 89
    and-int/lit8 v0, p1, 0x10

    if-lez v0, :cond_4

    move v0, v1

    :goto_4
    iput-boolean v0, p0, Lnet/minidev/json/parser/JSONParserBase;->useIntegerStorage:Z

    .line 90
    and-int/lit8 v0, p1, 0x20

    if-lez v0, :cond_5

    move v0, v1

    :goto_5
    iput-boolean v0, p0, Lnet/minidev/json/parser/JSONParserBase;->acceptLeadinZero:Z

    .line 91
    and-int/lit8 v0, p1, 0x40

    if-lez v0, :cond_6

    move v0, v1

    :goto_6
    iput-boolean v0, p0, Lnet/minidev/json/parser/JSONParserBase;->acceptUselessComma:Z

    .line 92
    and-int/lit16 v0, p1, 0x80

    if-lez v0, :cond_7

    move v0, v1

    :goto_7
    iput-boolean v0, p0, Lnet/minidev/json/parser/JSONParserBase;->useHiPrecisionFloat:Z

    .line 93
    and-int/lit16 v0, p1, 0x100

    if-nez v0, :cond_8

    :goto_8
    iput-boolean v1, p0, Lnet/minidev/json/parser/JSONParserBase;->checkTaillingData:Z

    .line 94
    return-void

    :cond_0
    move v0, v2

    .line 85
    goto :goto_0

    :cond_1
    move v0, v2

    .line 86
    goto :goto_1

    :cond_2
    move v0, v2

    .line 87
    goto :goto_2

    :cond_3
    move v0, v2

    .line 88
    goto :goto_3

    :cond_4
    move v0, v2

    .line 89
    goto :goto_4

    :cond_5
    move v0, v2

    .line 90
    goto :goto_5

    :cond_6
    move v0, v2

    .line 91
    goto :goto_6

    :cond_7
    move v0, v2

    .line 92
    goto :goto_7

    :cond_8
    move v1, v2

    .line 93
    goto :goto_8
.end method


# virtual methods
.method public checkControleChar()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 97
    iget-boolean v3, p0, Lnet/minidev/json/parser/JSONParserBase;->ignoreControlChar:Z

    if-eqz v3, :cond_1

    .line 109
    :cond_0
    return-void

    .line 99
    :cond_1
    iget-object v3, p0, Lnet/minidev/json/parser/JSONParserBase;->xs:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v2

    .line 100
    .local v2, "l":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v2, :cond_0

    .line 101
    iget-object v3, p0, Lnet/minidev/json/parser/JSONParserBase;->xs:Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 102
    .local v0, "c":C
    if-gez v0, :cond_3

    .line 100
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 104
    :cond_3
    const/16 v3, 0x1f

    if-gt v0, v3, :cond_4

    .line 105
    new-instance v3, Lnet/minidev/json/parser/ParseException;

    iget v4, p0, Lnet/minidev/json/parser/JSONParserBase;->pos:I

    add-int/2addr v4, v1

    invoke-static {v0}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v5

    invoke-direct {v3, v4, v6, v5}, Lnet/minidev/json/parser/ParseException;-><init>(IILjava/lang/Object;)V

    throw v3

    .line 106
    :cond_4
    const/16 v3, 0x7f

    if-ne v0, v3, :cond_2

    .line 107
    new-instance v3, Lnet/minidev/json/parser/ParseException;

    iget v4, p0, Lnet/minidev/json/parser/JSONParserBase;->pos:I

    add-int/2addr v4, v1

    invoke-static {v0}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v5

    invoke-direct {v3, v4, v6, v5}, Lnet/minidev/json/parser/ParseException;-><init>(IILjava/lang/Object;)V

    throw v3
.end method

.method public checkLeadinZero()V
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;
        }
    .end annotation

    .prologue
    const/16 v10, 0x39

    const/4 v9, 0x2

    const/4 v8, 0x1

    const/4 v7, 0x6

    const/16 v6, 0x30

    .line 112
    iget-object v4, p0, Lnet/minidev/json/parser/JSONParserBase;->xs:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v3

    .line 113
    .local v3, "len":I
    if-ne v3, v8, :cond_1

    .line 130
    :cond_0
    return-void

    .line 115
    :cond_1
    if-ne v3, v9, :cond_2

    .line 116
    iget-object v4, p0, Lnet/minidev/json/parser/JSONParserBase;->xs:Ljava/lang/String;

    const-string v5, "00"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 117
    new-instance v4, Lnet/minidev/json/parser/ParseException;

    iget v5, p0, Lnet/minidev/json/parser/JSONParserBase;->pos:I

    iget-object v6, p0, Lnet/minidev/json/parser/JSONParserBase;->xs:Ljava/lang/String;

    invoke-direct {v4, v5, v7, v6}, Lnet/minidev/json/parser/ParseException;-><init>(IILjava/lang/Object;)V

    throw v4

    .line 120
    :cond_2
    iget-object v4, p0, Lnet/minidev/json/parser/JSONParserBase;->xs:Ljava/lang/String;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 121
    .local v0, "c1":C
    iget-object v4, p0, Lnet/minidev/json/parser/JSONParserBase;->xs:Ljava/lang/String;

    invoke-virtual {v4, v8}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 122
    .local v1, "c2":C
    const/16 v4, 0x2d

    if-ne v0, v4, :cond_3

    .line 123
    iget-object v4, p0, Lnet/minidev/json/parser/JSONParserBase;->xs:Ljava/lang/String;

    invoke-virtual {v4, v9}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 124
    .local v2, "c3":C
    if-ne v1, v6, :cond_0

    if-lt v2, v6, :cond_0

    if-gt v2, v10, :cond_0

    .line 125
    new-instance v4, Lnet/minidev/json/parser/ParseException;

    iget v5, p0, Lnet/minidev/json/parser/JSONParserBase;->pos:I

    iget-object v6, p0, Lnet/minidev/json/parser/JSONParserBase;->xs:Ljava/lang/String;

    invoke-direct {v4, v5, v7, v6}, Lnet/minidev/json/parser/ParseException;-><init>(IILjava/lang/Object;)V

    throw v4

    .line 128
    .end local v2    # "c3":C
    :cond_3
    if-ne v0, v6, :cond_0

    if-lt v1, v6, :cond_0

    if-gt v1, v10, :cond_0

    .line 129
    new-instance v4, Lnet/minidev/json/parser/ParseException;

    iget v5, p0, Lnet/minidev/json/parser/JSONParserBase;->pos:I

    iget-object v6, p0, Lnet/minidev/json/parser/JSONParserBase;->xs:Ljava/lang/String;

    invoke-direct {v4, v5, v7, v6}, Lnet/minidev/json/parser/ParseException;-><init>(IILjava/lang/Object;)V

    throw v4
.end method

.method protected extractFloat()Ljava/lang/Number;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;
        }
    .end annotation

    .prologue
    .line 133
    iget-boolean v0, p0, Lnet/minidev/json/parser/JSONParserBase;->acceptLeadinZero:Z

    if-nez v0, :cond_0

    .line 134
    invoke-virtual {p0}, Lnet/minidev/json/parser/JSONParserBase;->checkLeadinZero()V

    .line 135
    :cond_0
    iget-boolean v0, p0, Lnet/minidev/json/parser/JSONParserBase;->useHiPrecisionFloat:Z

    if-nez v0, :cond_1

    .line 136
    iget-object v0, p0, Lnet/minidev/json/parser/JSONParserBase;->xs:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    .line 139
    :goto_0
    return-object v0

    .line 137
    :cond_1
    iget-object v0, p0, Lnet/minidev/json/parser/JSONParserBase;->xs:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x12

    if-le v0, v1, :cond_2

    .line 138
    new-instance v0, Ljava/math/BigDecimal;

    iget-object v1, p0, Lnet/minidev/json/parser/JSONParserBase;->xs:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    goto :goto_0

    .line 139
    :cond_2
    iget-object v0, p0, Lnet/minidev/json/parser/JSONParserBase;->xs:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    goto :goto_0
.end method

.method public parse(Lnet/minidev/json/parser/ContainerFactory;Lnet/minidev/json/parser/ContentHandler;)Ljava/lang/Object;
    .locals 6
    .param p1, "containerFactory"    # Lnet/minidev/json/parser/ContainerFactory;
    .param p2, "handler"    # Lnet/minidev/json/parser/ContentHandler;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 147
    iput-object p1, p0, Lnet/minidev/json/parser/JSONParserBase;->containerFactory:Lnet/minidev/json/parser/ContainerFactory;

    .line 148
    iput-object p2, p0, Lnet/minidev/json/parser/JSONParserBase;->handler:Lnet/minidev/json/parser/ContentHandler;

    .line 149
    const/4 v2, -0x1

    iput v2, p0, Lnet/minidev/json/parser/JSONParserBase;->pos:I

    .line 152
    :try_start_0
    invoke-virtual {p0}, Lnet/minidev/json/parser/JSONParserBase;->read()V

    .line 153
    invoke-interface {p2}, Lnet/minidev/json/parser/ContentHandler;->startJSON()V

    .line 154
    sget-object v2, Lnet/minidev/json/parser/JSONParserBase;->stopX:[Z

    invoke-virtual {p0, v2}, Lnet/minidev/json/parser/JSONParserBase;->readMain([Z)Ljava/lang/Object;

    move-result-object v1

    .line 155
    .local v1, "result":Ljava/lang/Object;
    invoke-interface {p2}, Lnet/minidev/json/parser/ContentHandler;->endJSON()V

    .line 156
    iget-boolean v2, p0, Lnet/minidev/json/parser/JSONParserBase;->checkTaillingData:Z

    if-eqz v2, :cond_0

    .line 157
    invoke-virtual {p0}, Lnet/minidev/json/parser/JSONParserBase;->skipSpace()V

    .line 158
    iget-char v2, p0, Lnet/minidev/json/parser/JSONParserBase;->c:C

    const/16 v3, 0x1a

    if-eq v2, v3, :cond_0

    .line 159
    new-instance v2, Lnet/minidev/json/parser/ParseException;

    iget v3, p0, Lnet/minidev/json/parser/JSONParserBase;->pos:I

    add-int/lit8 v3, v3, -0x1

    const/4 v4, 0x1

    iget-char v5, p0, Lnet/minidev/json/parser/JSONParserBase;->c:C

    invoke-static {v5}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v5

    invoke-direct {v2, v3, v4, v5}, Lnet/minidev/json/parser/ParseException;-><init>(IILjava/lang/Object;)V

    throw v2
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 161
    .end local v1    # "result":Ljava/lang/Object;
    :catch_0
    move-exception v0

    .line 162
    .local v0, "e":Ljava/io/IOException;
    new-instance v2, Lnet/minidev/json/parser/ParseException;

    iget v3, p0, Lnet/minidev/json/parser/JSONParserBase;->pos:I

    invoke-direct {v2, v3, v0}, Lnet/minidev/json/parser/ParseException;-><init>(ILjava/lang/Throwable;)V

    throw v2

    .line 164
    .end local v0    # "e":Ljava/io/IOException;
    .restart local v1    # "result":Ljava/lang/Object;
    :cond_0
    iput-object v4, p0, Lnet/minidev/json/parser/JSONParserBase;->xs:Ljava/lang/String;

    .line 165
    iput-object v4, p0, Lnet/minidev/json/parser/JSONParserBase;->xo:Ljava/lang/Object;

    .line 166
    return-object v1
.end method

.method protected parseNumber(Ljava/lang/String;)Ljava/lang/Number;
    .locals 13
    .param p1, "s"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;
        }
    .end annotation

    .prologue
    .line 171
    const/4 v5, 0x0

    .line 173
    .local v5, "p":I
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    .line 175
    .local v1, "l":I
    const/16 v2, 0x13

    .line 178
    .local v2, "max":I
    const/4 v9, 0x0

    invoke-virtual {p1, v9}, Ljava/lang/String;->charAt(I)C

    move-result v9

    const/16 v10, 0x2d

    if-ne v9, v10, :cond_0

    .line 179
    add-int/lit8 v5, v5, 0x1

    .line 180
    add-int/lit8 v2, v2, 0x1

    .line 181
    const/4 v4, 0x1

    .line 182
    .local v4, "neg":Z
    iget-boolean v9, p0, Lnet/minidev/json/parser/JSONParserBase;->acceptLeadinZero:Z

    if-nez v9, :cond_1

    const/4 v9, 0x3

    if-lt v1, v9, :cond_1

    const/4 v9, 0x1

    invoke-virtual {p1, v9}, Ljava/lang/String;->charAt(I)C

    move-result v9

    const/16 v10, 0x30

    if-ne v9, v10, :cond_1

    .line 183
    new-instance v9, Lnet/minidev/json/parser/ParseException;

    iget v10, p0, Lnet/minidev/json/parser/JSONParserBase;->pos:I

    const/4 v11, 0x6

    invoke-direct {v9, v10, v11, p1}, Lnet/minidev/json/parser/ParseException;-><init>(IILjava/lang/Object;)V

    throw v9

    .line 185
    .end local v4    # "neg":Z
    :cond_0
    const/4 v4, 0x0

    .line 186
    .restart local v4    # "neg":Z
    iget-boolean v9, p0, Lnet/minidev/json/parser/JSONParserBase;->acceptLeadinZero:Z

    if-nez v9, :cond_1

    const/4 v9, 0x2

    if-lt v1, v9, :cond_1

    const/4 v9, 0x0

    invoke-virtual {p1, v9}, Ljava/lang/String;->charAt(I)C

    move-result v9

    const/16 v10, 0x30

    if-ne v9, v10, :cond_1

    .line 187
    new-instance v9, Lnet/minidev/json/parser/ParseException;

    iget v10, p0, Lnet/minidev/json/parser/JSONParserBase;->pos:I

    const/4 v11, 0x6

    invoke-direct {v9, v10, v11, p1}, Lnet/minidev/json/parser/ParseException;-><init>(IILjava/lang/Object;)V

    throw v9

    .line 191
    :cond_1
    if-ge v1, v2, :cond_2

    .line 192
    move v2, v1

    .line 193
    const/4 v3, 0x0

    .line 201
    .local v3, "mustCheck":Z
    :goto_0
    const-wide/16 v7, 0x0

    .local v7, "r":J
    move v6, v5

    .line 202
    .end local v5    # "p":I
    .local v6, "p":I
    :goto_1
    if-ge v6, v2, :cond_4

    .line 203
    const-wide/16 v9, 0xa

    mul-long/2addr v9, v7

    add-int/lit8 v5, v6, 0x1

    .end local v6    # "p":I
    .restart local v5    # "p":I
    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v11

    rsub-int/lit8 v11, v11, 0x30

    int-to-long v11, v11

    add-long v7, v9, v11

    move v6, v5

    .end local v5    # "p":I
    .restart local v6    # "p":I
    goto :goto_1

    .line 194
    .end local v3    # "mustCheck":Z
    .end local v6    # "p":I
    .end local v7    # "r":J
    .restart local v5    # "p":I
    :cond_2
    if-le v1, v2, :cond_3

    .line 195
    new-instance v9, Ljava/math/BigInteger;

    const/16 v10, 0xa

    invoke-direct {v9, p1, v10}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    .line 229
    :goto_2
    return-object v9

    .line 197
    :cond_3
    add-int/lit8 v2, v1, -0x1

    .line 198
    const/4 v3, 0x1

    .restart local v3    # "mustCheck":Z
    goto :goto_0

    .line 205
    .end local v5    # "p":I
    .restart local v6    # "p":I
    .restart local v7    # "r":J
    :cond_4
    if-eqz v3, :cond_b

    .line 207
    const-wide v9, -0xcccccccccccccccL

    cmp-long v9, v7, v9

    if-lez v9, :cond_5

    .line 208
    const/4 v0, 0x0

    .line 217
    .local v0, "isBig":Z
    :goto_3
    if-eqz v0, :cond_a

    .line 218
    new-instance v9, Ljava/math/BigInteger;

    const/16 v10, 0xa

    invoke-direct {v9, p1, v10}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    move v5, v6

    .end local v6    # "p":I
    .restart local v5    # "p":I
    goto :goto_2

    .line 209
    .end local v0    # "isBig":Z
    .end local v5    # "p":I
    .restart local v6    # "p":I
    :cond_5
    const-wide v9, -0xcccccccccccccccL

    cmp-long v9, v7, v9

    if-gez v9, :cond_6

    .line 210
    const/4 v0, 0x1

    .restart local v0    # "isBig":Z
    goto :goto_3

    .line 212
    .end local v0    # "isBig":Z
    :cond_6
    if-eqz v4, :cond_8

    .line 213
    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v9

    const/16 v10, 0x38

    if-le v9, v10, :cond_7

    const/4 v0, 0x1

    .restart local v0    # "isBig":Z
    :goto_4
    goto :goto_3

    .end local v0    # "isBig":Z
    :cond_7
    const/4 v0, 0x0

    goto :goto_4

    .line 215
    :cond_8
    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v9

    const/16 v10, 0x37

    if-le v9, v10, :cond_9

    const/4 v0, 0x1

    .restart local v0    # "isBig":Z
    :goto_5
    goto :goto_3

    .end local v0    # "isBig":Z
    :cond_9
    const/4 v0, 0x0

    goto :goto_5

    .line 219
    .restart local v0    # "isBig":Z
    :cond_a
    const-wide/16 v9, 0xa

    mul-long/2addr v9, v7

    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v11

    rsub-int/lit8 v11, v11, 0x30

    int-to-long v11, v11

    add-long v7, v9, v11

    .line 221
    .end local v0    # "isBig":Z
    :cond_b
    if-eqz v4, :cond_d

    .line 222
    iget-boolean v9, p0, Lnet/minidev/json/parser/JSONParserBase;->useIntegerStorage:Z

    if-eqz v9, :cond_c

    const-wide/32 v9, -0x80000000

    cmp-long v9, v7, v9

    if-ltz v9, :cond_c

    .line 223
    long-to-int v9, v7

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    move v5, v6

    .end local v6    # "p":I
    .restart local v5    # "p":I
    goto :goto_2

    .line 224
    .end local v5    # "p":I
    .restart local v6    # "p":I
    :cond_c
    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    move v5, v6

    .end local v6    # "p":I
    .restart local v5    # "p":I
    goto :goto_2

    .line 226
    .end local v5    # "p":I
    .restart local v6    # "p":I
    :cond_d
    neg-long v7, v7

    .line 227
    iget-boolean v9, p0, Lnet/minidev/json/parser/JSONParserBase;->useIntegerStorage:Z

    if-eqz v9, :cond_e

    const-wide/32 v9, 0x7fffffff

    cmp-long v9, v7, v9

    if-gtz v9, :cond_e

    .line 228
    long-to-int v9, v7

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    move v5, v6

    .end local v6    # "p":I
    .restart local v5    # "p":I
    goto :goto_2

    .line 229
    .end local v5    # "p":I
    .restart local v6    # "p":I
    :cond_e
    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    move v5, v6

    .end local v6    # "p":I
    .restart local v5    # "p":I
    goto :goto_2
.end method

.method protected abstract read()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected readArray()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 235
    iget-object v2, p0, Lnet/minidev/json/parser/JSONParserBase;->containerFactory:Lnet/minidev/json/parser/ContainerFactory;

    invoke-interface {v2}, Lnet/minidev/json/parser/ContainerFactory;->createArrayContainer()Ljava/util/List;

    move-result-object v1

    .line 236
    .local v1, "obj":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    iget-char v2, p0, Lnet/minidev/json/parser/JSONParserBase;->c:C

    const/16 v3, 0x5b

    if-eq v2, v3, :cond_0

    .line 237
    new-instance v2, Ljava/lang/RuntimeException;

    const-string v3, "Internal Error"

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 238
    :cond_0
    invoke-virtual {p0}, Lnet/minidev/json/parser/JSONParserBase;->read()V

    .line 239
    const/4 v0, 0x0

    .line 240
    .local v0, "needData":Z
    iget-object v2, p0, Lnet/minidev/json/parser/JSONParserBase;->handler:Lnet/minidev/json/parser/ContentHandler;

    invoke-interface {v2}, Lnet/minidev/json/parser/ContentHandler;->startArray()Z

    .line 242
    :goto_0
    iget-char v2, p0, Lnet/minidev/json/parser/JSONParserBase;->c:C

    sparse-switch v2, :sswitch_data_0

    .line 267
    sget-object v2, Lnet/minidev/json/parser/JSONParserBase;->stopArray:[Z

    invoke-virtual {p0, v2}, Lnet/minidev/json/parser/JSONParserBase;->readMain([Z)Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 268
    const/4 v0, 0x0

    .line 269
    goto :goto_0

    .line 247
    :sswitch_0
    invoke-virtual {p0}, Lnet/minidev/json/parser/JSONParserBase;->read()V

    goto :goto_0

    .line 250
    :sswitch_1
    if-eqz v0, :cond_1

    iget-boolean v2, p0, Lnet/minidev/json/parser/JSONParserBase;->acceptUselessComma:Z

    if-nez v2, :cond_1

    .line 251
    new-instance v2, Lnet/minidev/json/parser/ParseException;

    iget v3, p0, Lnet/minidev/json/parser/JSONParserBase;->pos:I

    iget-char v4, p0, Lnet/minidev/json/parser/JSONParserBase;->c:C

    invoke-static {v4}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v4

    invoke-direct {v2, v3, v5, v4}, Lnet/minidev/json/parser/ParseException;-><init>(IILjava/lang/Object;)V

    throw v2

    .line 252
    :cond_1
    invoke-virtual {p0}, Lnet/minidev/json/parser/JSONParserBase;->read()V

    .line 253
    iget-object v2, p0, Lnet/minidev/json/parser/JSONParserBase;->handler:Lnet/minidev/json/parser/ContentHandler;

    invoke-interface {v2}, Lnet/minidev/json/parser/ContentHandler;->endArray()Z

    .line 254
    return-object v1

    .line 257
    :sswitch_2
    new-instance v2, Lnet/minidev/json/parser/ParseException;

    iget v3, p0, Lnet/minidev/json/parser/JSONParserBase;->pos:I

    iget-char v4, p0, Lnet/minidev/json/parser/JSONParserBase;->c:C

    invoke-static {v4}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v4

    invoke-direct {v2, v3, v5, v4}, Lnet/minidev/json/parser/ParseException;-><init>(IILjava/lang/Object;)V

    throw v2

    .line 259
    :sswitch_3
    if-eqz v0, :cond_2

    iget-boolean v2, p0, Lnet/minidev/json/parser/JSONParserBase;->acceptUselessComma:Z

    if-nez v2, :cond_2

    .line 260
    new-instance v2, Lnet/minidev/json/parser/ParseException;

    iget v3, p0, Lnet/minidev/json/parser/JSONParserBase;->pos:I

    iget-char v4, p0, Lnet/minidev/json/parser/JSONParserBase;->c:C

    invoke-static {v4}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v4

    invoke-direct {v2, v3, v5, v4}, Lnet/minidev/json/parser/ParseException;-><init>(IILjava/lang/Object;)V

    throw v2

    .line 261
    :cond_2
    invoke-virtual {p0}, Lnet/minidev/json/parser/JSONParserBase;->read()V

    .line 262
    const/4 v0, 0x1

    .line 263
    goto :goto_0

    .line 265
    :sswitch_4
    new-instance v2, Lnet/minidev/json/parser/ParseException;

    iget v3, p0, Lnet/minidev/json/parser/JSONParserBase;->pos:I

    add-int/lit8 v3, v3, -0x1

    const/4 v4, 0x3

    const-string v5, "EOF"

    invoke-direct {v2, v3, v4, v5}, Lnet/minidev/json/parser/ParseException;-><init>(IILjava/lang/Object;)V

    throw v2

    .line 242
    nop

    :sswitch_data_0
    .sparse-switch
        0x9 -> :sswitch_0
        0xa -> :sswitch_0
        0xd -> :sswitch_0
        0x1a -> :sswitch_4
        0x20 -> :sswitch_0
        0x2c -> :sswitch_3
        0x3a -> :sswitch_2
        0x5d -> :sswitch_1
        0x7d -> :sswitch_2
    .end sparse-switch
.end method

.method protected readMain([Z)Ljava/lang/Object;
    .locals 4
    .param p1, "stop"    # [Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    const/high16 v2, 0x7fc00000    # Float.NaN

    const/4 v3, 0x1

    .line 288
    :goto_0
    iget-char v1, p0, Lnet/minidev/json/parser/JSONParserBase;->c:C

    sparse-switch v1, :sswitch_data_0

    .line 375
    invoke-virtual {p0, p1}, Lnet/minidev/json/parser/JSONParserBase;->readNQString([Z)V

    .line 376
    iget-boolean v0, p0, Lnet/minidev/json/parser/JSONParserBase;->acceptNonQuote:Z

    if-nez v0, :cond_9

    .line 377
    new-instance v0, Lnet/minidev/json/parser/ParseException;

    iget v1, p0, Lnet/minidev/json/parser/JSONParserBase;->pos:I

    iget-object v2, p0, Lnet/minidev/json/parser/JSONParserBase;->xs:Ljava/lang/String;

    invoke-direct {v0, v1, v3, v2}, Lnet/minidev/json/parser/ParseException;-><init>(IILjava/lang/Object;)V

    throw v0

    .line 294
    :sswitch_0
    invoke-virtual {p0}, Lnet/minidev/json/parser/JSONParserBase;->read()V

    goto :goto_0

    .line 300
    :sswitch_1
    new-instance v0, Lnet/minidev/json/parser/ParseException;

    iget v1, p0, Lnet/minidev/json/parser/JSONParserBase;->pos:I

    const/4 v2, 0x0

    iget-char v3, p0, Lnet/minidev/json/parser/JSONParserBase;->c:C

    invoke-static {v3}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lnet/minidev/json/parser/ParseException;-><init>(IILjava/lang/Object;)V

    throw v0

    .line 303
    :sswitch_2
    invoke-virtual {p0}, Lnet/minidev/json/parser/JSONParserBase;->readObject()Ljava/util/Map;

    move-result-object v0

    .line 379
    :goto_1
    return-object v0

    .line 306
    :sswitch_3
    invoke-virtual {p0}, Lnet/minidev/json/parser/JSONParserBase;->readArray()Ljava/util/List;

    move-result-object v0

    goto :goto_1

    .line 310
    :sswitch_4
    invoke-virtual {p0}, Lnet/minidev/json/parser/JSONParserBase;->readString()V

    .line 311
    iget-object v0, p0, Lnet/minidev/json/parser/JSONParserBase;->handler:Lnet/minidev/json/parser/ContentHandler;

    iget-object v1, p0, Lnet/minidev/json/parser/JSONParserBase;->xs:Ljava/lang/String;

    invoke-interface {v0, v1}, Lnet/minidev/json/parser/ContentHandler;->primitive(Ljava/lang/Object;)Z

    .line 312
    iget-object v0, p0, Lnet/minidev/json/parser/JSONParserBase;->xs:Ljava/lang/String;

    goto :goto_1

    .line 315
    :sswitch_5
    invoke-virtual {p0, p1}, Lnet/minidev/json/parser/JSONParserBase;->readNQString([Z)V

    .line 316
    const-string v1, "null"

    iget-object v2, p0, Lnet/minidev/json/parser/JSONParserBase;->xs:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 317
    iget-object v1, p0, Lnet/minidev/json/parser/JSONParserBase;->handler:Lnet/minidev/json/parser/ContentHandler;

    invoke-interface {v1, v0}, Lnet/minidev/json/parser/ContentHandler;->primitive(Ljava/lang/Object;)Z

    goto :goto_1

    .line 320
    :cond_0
    iget-boolean v0, p0, Lnet/minidev/json/parser/JSONParserBase;->acceptNonQuote:Z

    if-nez v0, :cond_1

    .line 321
    new-instance v0, Lnet/minidev/json/parser/ParseException;

    iget v1, p0, Lnet/minidev/json/parser/JSONParserBase;->pos:I

    iget-object v2, p0, Lnet/minidev/json/parser/JSONParserBase;->xs:Ljava/lang/String;

    invoke-direct {v0, v1, v3, v2}, Lnet/minidev/json/parser/ParseException;-><init>(IILjava/lang/Object;)V

    throw v0

    .line 322
    :cond_1
    iget-object v0, p0, Lnet/minidev/json/parser/JSONParserBase;->handler:Lnet/minidev/json/parser/ContentHandler;

    iget-object v1, p0, Lnet/minidev/json/parser/JSONParserBase;->xs:Ljava/lang/String;

    invoke-interface {v0, v1}, Lnet/minidev/json/parser/ContentHandler;->primitive(Ljava/lang/Object;)Z

    .line 323
    iget-object v0, p0, Lnet/minidev/json/parser/JSONParserBase;->xs:Ljava/lang/String;

    goto :goto_1

    .line 326
    :sswitch_6
    invoke-virtual {p0, p1}, Lnet/minidev/json/parser/JSONParserBase;->readNQString([Z)V

    .line 327
    const-string v0, "false"

    iget-object v1, p0, Lnet/minidev/json/parser/JSONParserBase;->xs:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 328
    iget-object v0, p0, Lnet/minidev/json/parser/JSONParserBase;->handler:Lnet/minidev/json/parser/ContentHandler;

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-interface {v0, v1}, Lnet/minidev/json/parser/ContentHandler;->primitive(Ljava/lang/Object;)Z

    .line 329
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_1

    .line 331
    :cond_2
    iget-boolean v0, p0, Lnet/minidev/json/parser/JSONParserBase;->acceptNonQuote:Z

    if-nez v0, :cond_3

    .line 332
    new-instance v0, Lnet/minidev/json/parser/ParseException;

    iget v1, p0, Lnet/minidev/json/parser/JSONParserBase;->pos:I

    iget-object v2, p0, Lnet/minidev/json/parser/JSONParserBase;->xs:Ljava/lang/String;

    invoke-direct {v0, v1, v3, v2}, Lnet/minidev/json/parser/ParseException;-><init>(IILjava/lang/Object;)V

    throw v0

    .line 333
    :cond_3
    iget-object v0, p0, Lnet/minidev/json/parser/JSONParserBase;->handler:Lnet/minidev/json/parser/ContentHandler;

    iget-object v1, p0, Lnet/minidev/json/parser/JSONParserBase;->xs:Ljava/lang/String;

    invoke-interface {v0, v1}, Lnet/minidev/json/parser/ContentHandler;->primitive(Ljava/lang/Object;)Z

    .line 334
    iget-object v0, p0, Lnet/minidev/json/parser/JSONParserBase;->xs:Ljava/lang/String;

    goto :goto_1

    .line 337
    :sswitch_7
    invoke-virtual {p0, p1}, Lnet/minidev/json/parser/JSONParserBase;->readNQString([Z)V

    .line 338
    const-string v0, "true"

    iget-object v1, p0, Lnet/minidev/json/parser/JSONParserBase;->xs:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 339
    iget-object v0, p0, Lnet/minidev/json/parser/JSONParserBase;->handler:Lnet/minidev/json/parser/ContentHandler;

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {v0, v1}, Lnet/minidev/json/parser/ContentHandler;->primitive(Ljava/lang/Object;)Z

    .line 340
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto/16 :goto_1

    .line 342
    :cond_4
    iget-boolean v0, p0, Lnet/minidev/json/parser/JSONParserBase;->acceptNonQuote:Z

    if-nez v0, :cond_5

    .line 343
    new-instance v0, Lnet/minidev/json/parser/ParseException;

    iget v1, p0, Lnet/minidev/json/parser/JSONParserBase;->pos:I

    iget-object v2, p0, Lnet/minidev/json/parser/JSONParserBase;->xs:Ljava/lang/String;

    invoke-direct {v0, v1, v3, v2}, Lnet/minidev/json/parser/ParseException;-><init>(IILjava/lang/Object;)V

    throw v0

    .line 344
    :cond_5
    iget-object v0, p0, Lnet/minidev/json/parser/JSONParserBase;->handler:Lnet/minidev/json/parser/ContentHandler;

    iget-object v1, p0, Lnet/minidev/json/parser/JSONParserBase;->xs:Ljava/lang/String;

    invoke-interface {v0, v1}, Lnet/minidev/json/parser/ContentHandler;->primitive(Ljava/lang/Object;)Z

    .line 345
    iget-object v0, p0, Lnet/minidev/json/parser/JSONParserBase;->xs:Ljava/lang/String;

    goto/16 :goto_1

    .line 348
    :sswitch_8
    invoke-virtual {p0, p1}, Lnet/minidev/json/parser/JSONParserBase;->readNQString([Z)V

    .line 349
    iget-boolean v0, p0, Lnet/minidev/json/parser/JSONParserBase;->acceptNaN:Z

    if-nez v0, :cond_6

    .line 350
    new-instance v0, Lnet/minidev/json/parser/ParseException;

    iget v1, p0, Lnet/minidev/json/parser/JSONParserBase;->pos:I

    iget-object v2, p0, Lnet/minidev/json/parser/JSONParserBase;->xs:Ljava/lang/String;

    invoke-direct {v0, v1, v3, v2}, Lnet/minidev/json/parser/ParseException;-><init>(IILjava/lang/Object;)V

    throw v0

    .line 351
    :cond_6
    const-string v0, "NaN"

    iget-object v1, p0, Lnet/minidev/json/parser/JSONParserBase;->xs:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 352
    iget-object v0, p0, Lnet/minidev/json/parser/JSONParserBase;->handler:Lnet/minidev/json/parser/ContentHandler;

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-interface {v0, v1}, Lnet/minidev/json/parser/ContentHandler;->primitive(Ljava/lang/Object;)Z

    .line 353
    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    goto/16 :goto_1

    .line 355
    :cond_7
    iget-boolean v0, p0, Lnet/minidev/json/parser/JSONParserBase;->acceptNonQuote:Z

    if-nez v0, :cond_8

    .line 356
    new-instance v0, Lnet/minidev/json/parser/ParseException;

    iget v1, p0, Lnet/minidev/json/parser/JSONParserBase;->pos:I

    iget-object v2, p0, Lnet/minidev/json/parser/JSONParserBase;->xs:Ljava/lang/String;

    invoke-direct {v0, v1, v3, v2}, Lnet/minidev/json/parser/ParseException;-><init>(IILjava/lang/Object;)V

    throw v0

    .line 357
    :cond_8
    iget-object v0, p0, Lnet/minidev/json/parser/JSONParserBase;->handler:Lnet/minidev/json/parser/ContentHandler;

    iget-object v1, p0, Lnet/minidev/json/parser/JSONParserBase;->xs:Ljava/lang/String;

    invoke-interface {v0, v1}, Lnet/minidev/json/parser/ContentHandler;->primitive(Ljava/lang/Object;)Z

    .line 358
    iget-object v0, p0, Lnet/minidev/json/parser/JSONParserBase;->xs:Ljava/lang/String;

    goto/16 :goto_1

    .line 371
    :sswitch_9
    invoke-virtual {p0, p1}, Lnet/minidev/json/parser/JSONParserBase;->readNumber([Z)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lnet/minidev/json/parser/JSONParserBase;->xo:Ljava/lang/Object;

    .line 372
    iget-object v0, p0, Lnet/minidev/json/parser/JSONParserBase;->handler:Lnet/minidev/json/parser/ContentHandler;

    iget-object v1, p0, Lnet/minidev/json/parser/JSONParserBase;->xo:Ljava/lang/Object;

    invoke-interface {v0, v1}, Lnet/minidev/json/parser/ContentHandler;->primitive(Ljava/lang/Object;)Z

    .line 373
    iget-object v0, p0, Lnet/minidev/json/parser/JSONParserBase;->xo:Ljava/lang/Object;

    goto/16 :goto_1

    .line 378
    :cond_9
    iget-object v0, p0, Lnet/minidev/json/parser/JSONParserBase;->handler:Lnet/minidev/json/parser/ContentHandler;

    iget-object v1, p0, Lnet/minidev/json/parser/JSONParserBase;->xs:Ljava/lang/String;

    invoke-interface {v0, v1}, Lnet/minidev/json/parser/ContentHandler;->primitive(Ljava/lang/Object;)Z

    .line 379
    iget-object v0, p0, Lnet/minidev/json/parser/JSONParserBase;->xs:Ljava/lang/String;

    goto/16 :goto_1

    .line 288
    :sswitch_data_0
    .sparse-switch
        0x9 -> :sswitch_0
        0xa -> :sswitch_0
        0xd -> :sswitch_0
        0x20 -> :sswitch_0
        0x22 -> :sswitch_4
        0x27 -> :sswitch_4
        0x2d -> :sswitch_9
        0x30 -> :sswitch_9
        0x31 -> :sswitch_9
        0x32 -> :sswitch_9
        0x33 -> :sswitch_9
        0x34 -> :sswitch_9
        0x35 -> :sswitch_9
        0x36 -> :sswitch_9
        0x37 -> :sswitch_9
        0x38 -> :sswitch_9
        0x39 -> :sswitch_9
        0x3a -> :sswitch_1
        0x4e -> :sswitch_8
        0x5b -> :sswitch_3
        0x5d -> :sswitch_1
        0x66 -> :sswitch_6
        0x6e -> :sswitch_5
        0x74 -> :sswitch_7
        0x7b -> :sswitch_2
        0x7d -> :sswitch_1
    .end sparse-switch
.end method

.method protected abstract readNQString([Z)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected abstract readNoEnd()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;,
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected abstract readNumber([Z)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;,
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected readObject()Ljava/util/Map;
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v12, 0x0

    const/4 v11, 0x3

    const/4 v10, 0x1

    const/16 v8, 0x1a

    const/4 v9, 0x0

    .line 391
    iget-object v6, p0, Lnet/minidev/json/parser/JSONParserBase;->containerFactory:Lnet/minidev/json/parser/ContainerFactory;

    invoke-interface {v6}, Lnet/minidev/json/parser/ContainerFactory;->createObjectContainer()Ljava/util/Map;

    move-result-object v5

    .line 392
    .local v5, "obj":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    iget-char v6, p0, Lnet/minidev/json/parser/JSONParserBase;->c:C

    const/16 v7, 0x7b

    if-eq v6, v7, :cond_0

    .line 393
    new-instance v6, Ljava/lang/RuntimeException;

    const-string v7, "Internal Error"

    invoke-direct {v6, v7}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 394
    :cond_0
    iget-object v6, p0, Lnet/minidev/json/parser/JSONParserBase;->handler:Lnet/minidev/json/parser/ContentHandler;

    invoke-interface {v6}, Lnet/minidev/json/parser/ContentHandler;->startObject()Z

    .line 395
    const/4 v4, 0x0

    .line 396
    .local v4, "needData":Z
    const/4 v0, 0x1

    .line 398
    :goto_0
    :sswitch_0
    invoke-virtual {p0}, Lnet/minidev/json/parser/JSONParserBase;->read()V

    .line 399
    iget-char v6, p0, Lnet/minidev/json/parser/JSONParserBase;->c:C

    sparse-switch v6, :sswitch_data_0

    .line 424
    iget v3, p0, Lnet/minidev/json/parser/JSONParserBase;->pos:I

    .line 425
    .local v3, "keyStart":I
    iget-char v6, p0, Lnet/minidev/json/parser/JSONParserBase;->c:C

    const/16 v7, 0x22

    if-eq v6, v7, :cond_1

    iget-char v6, p0, Lnet/minidev/json/parser/JSONParserBase;->c:C

    const/16 v7, 0x27

    if-ne v6, v7, :cond_5

    .line 426
    :cond_1
    invoke-virtual {p0}, Lnet/minidev/json/parser/JSONParserBase;->readString()V

    .line 432
    :cond_2
    iget-object v2, p0, Lnet/minidev/json/parser/JSONParserBase;->xs:Ljava/lang/String;

    .line 433
    .local v2, "key":Ljava/lang/String;
    if-nez v0, :cond_6

    .line 434
    new-instance v6, Lnet/minidev/json/parser/ParseException;

    iget v7, p0, Lnet/minidev/json/parser/JSONParserBase;->pos:I

    invoke-direct {v6, v7, v10, v2}, Lnet/minidev/json/parser/ParseException;-><init>(IILjava/lang/Object;)V

    throw v6

    .line 409
    .end local v2    # "key":Ljava/lang/String;
    .end local v3    # "keyStart":I
    :sswitch_1
    new-instance v6, Lnet/minidev/json/parser/ParseException;

    iget v7, p0, Lnet/minidev/json/parser/JSONParserBase;->pos:I

    iget-char v8, p0, Lnet/minidev/json/parser/JSONParserBase;->c:C

    invoke-static {v8}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v8

    invoke-direct {v6, v7, v9, v8}, Lnet/minidev/json/parser/ParseException;-><init>(IILjava/lang/Object;)V

    throw v6

    .line 411
    :sswitch_2
    if-eqz v4, :cond_3

    iget-boolean v6, p0, Lnet/minidev/json/parser/JSONParserBase;->acceptUselessComma:Z

    if-nez v6, :cond_3

    .line 412
    new-instance v6, Lnet/minidev/json/parser/ParseException;

    iget v7, p0, Lnet/minidev/json/parser/JSONParserBase;->pos:I

    iget-char v8, p0, Lnet/minidev/json/parser/JSONParserBase;->c:C

    invoke-static {v8}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v8

    invoke-direct {v6, v7, v9, v8}, Lnet/minidev/json/parser/ParseException;-><init>(IILjava/lang/Object;)V

    throw v6

    .line 413
    :cond_3
    invoke-virtual {p0}, Lnet/minidev/json/parser/JSONParserBase;->read()V

    .line 414
    iget-object v6, p0, Lnet/minidev/json/parser/JSONParserBase;->handler:Lnet/minidev/json/parser/ContentHandler;

    invoke-interface {v6}, Lnet/minidev/json/parser/ContentHandler;->endObject()Z

    .line 455
    :goto_1
    return-object v5

    .line 417
    :sswitch_3
    if-eqz v4, :cond_4

    iget-boolean v6, p0, Lnet/minidev/json/parser/JSONParserBase;->acceptUselessComma:Z

    if-nez v6, :cond_4

    .line 418
    new-instance v6, Lnet/minidev/json/parser/ParseException;

    iget v7, p0, Lnet/minidev/json/parser/JSONParserBase;->pos:I

    iget-char v8, p0, Lnet/minidev/json/parser/JSONParserBase;->c:C

    invoke-static {v8}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v8

    invoke-direct {v6, v7, v9, v8}, Lnet/minidev/json/parser/ParseException;-><init>(IILjava/lang/Object;)V

    throw v6

    .line 419
    :cond_4
    const/4 v4, 0x1

    move v0, v4

    .line 420
    .local v0, "acceptData":I
    goto :goto_0

    .line 428
    .end local v0    # "acceptData":I
    .restart local v3    # "keyStart":I
    :cond_5
    sget-object v6, Lnet/minidev/json/parser/JSONParserBase;->stopKey:[Z

    invoke-virtual {p0, v6}, Lnet/minidev/json/parser/JSONParserBase;->readNQString([Z)V

    .line 429
    iget-boolean v6, p0, Lnet/minidev/json/parser/JSONParserBase;->acceptNonQuote:Z

    if-nez v6, :cond_2

    .line 430
    new-instance v6, Lnet/minidev/json/parser/ParseException;

    iget v7, p0, Lnet/minidev/json/parser/JSONParserBase;->pos:I

    iget-object v8, p0, Lnet/minidev/json/parser/JSONParserBase;->xs:Ljava/lang/String;

    invoke-direct {v6, v7, v10, v8}, Lnet/minidev/json/parser/ParseException;-><init>(IILjava/lang/Object;)V

    throw v6

    .line 435
    .restart local v2    # "key":Ljava/lang/String;
    :cond_6
    iget-object v6, p0, Lnet/minidev/json/parser/JSONParserBase;->handler:Lnet/minidev/json/parser/ContentHandler;

    invoke-interface {v6, v2}, Lnet/minidev/json/parser/ContentHandler;->startObjectEntry(Ljava/lang/String;)Z

    .line 436
    :goto_2
    iget-char v6, p0, Lnet/minidev/json/parser/JSONParserBase;->c:C

    const/16 v7, 0x3a

    if-eq v6, v7, :cond_7

    iget-char v6, p0, Lnet/minidev/json/parser/JSONParserBase;->c:C

    if-eq v6, v8, :cond_7

    .line 437
    invoke-virtual {p0}, Lnet/minidev/json/parser/JSONParserBase;->read()V

    goto :goto_2

    .line 439
    :cond_7
    iget-char v6, p0, Lnet/minidev/json/parser/JSONParserBase;->c:C

    if-ne v6, v8, :cond_8

    .line 440
    new-instance v6, Lnet/minidev/json/parser/ParseException;

    iget v7, p0, Lnet/minidev/json/parser/JSONParserBase;->pos:I

    add-int/lit8 v7, v7, -0x1

    invoke-direct {v6, v7, v11, v12}, Lnet/minidev/json/parser/ParseException;-><init>(IILjava/lang/Object;)V

    throw v6

    .line 441
    :cond_8
    invoke-virtual {p0}, Lnet/minidev/json/parser/JSONParserBase;->readNoEnd()V

    .line 442
    sget-object v6, Lnet/minidev/json/parser/JSONParserBase;->stopValue:[Z

    invoke-virtual {p0, v6}, Lnet/minidev/json/parser/JSONParserBase;->readMain([Z)Ljava/lang/Object;

    move-result-object v6

    invoke-interface {v5, v2, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 443
    .local v1, "duplicate":Ljava/lang/Object;
    if-eqz v1, :cond_9

    .line 444
    new-instance v6, Lnet/minidev/json/parser/ParseException;

    const/4 v7, 0x5

    invoke-direct {v6, v3, v7, v2}, Lnet/minidev/json/parser/ParseException;-><init>(IILjava/lang/Object;)V

    throw v6

    .line 445
    :cond_9
    iget-object v6, p0, Lnet/minidev/json/parser/JSONParserBase;->handler:Lnet/minidev/json/parser/ContentHandler;

    invoke-interface {v6}, Lnet/minidev/json/parser/ContentHandler;->endObjectEntry()Z

    .line 452
    iget-char v6, p0, Lnet/minidev/json/parser/JSONParserBase;->c:C

    const/16 v7, 0x7d

    if-ne v6, v7, :cond_a

    .line 453
    invoke-virtual {p0}, Lnet/minidev/json/parser/JSONParserBase;->read()V

    .line 454
    iget-object v6, p0, Lnet/minidev/json/parser/JSONParserBase;->handler:Lnet/minidev/json/parser/ContentHandler;

    invoke-interface {v6}, Lnet/minidev/json/parser/ContentHandler;->endObject()Z

    goto :goto_1

    .line 457
    :cond_a
    iget-char v6, p0, Lnet/minidev/json/parser/JSONParserBase;->c:C

    if-ne v6, v8, :cond_b

    .line 458
    new-instance v6, Lnet/minidev/json/parser/ParseException;

    iget v7, p0, Lnet/minidev/json/parser/JSONParserBase;->pos:I

    add-int/lit8 v7, v7, -0x1

    invoke-direct {v6, v7, v11, v12}, Lnet/minidev/json/parser/ParseException;-><init>(IILjava/lang/Object;)V

    throw v6

    .line 460
    :cond_b
    iget-char v6, p0, Lnet/minidev/json/parser/JSONParserBase;->c:C

    const/16 v7, 0x2c

    if-ne v6, v7, :cond_c

    .line 461
    const/4 v4, 0x1

    move v0, v4

    .restart local v0    # "acceptData":I
    goto/16 :goto_0

    .line 463
    .end local v0    # "acceptData":I
    :cond_c
    const/4 v4, 0x0

    move v0, v4

    .line 464
    .restart local v0    # "acceptData":I
    goto/16 :goto_0

    .line 399
    :sswitch_data_0
    .sparse-switch
        0x9 -> :sswitch_0
        0xa -> :sswitch_0
        0xd -> :sswitch_0
        0x20 -> :sswitch_0
        0x2c -> :sswitch_3
        0x3a -> :sswitch_1
        0x5b -> :sswitch_1
        0x5d -> :sswitch_1
        0x7b -> :sswitch_1
        0x7d -> :sswitch_2
    .end sparse-switch
.end method

.method abstract readS()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected abstract readString()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;,
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected readString2()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 478
    iget-char v0, p0, Lnet/minidev/json/parser/JSONParserBase;->c:C

    .line 480
    .local v0, "sep":C
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lnet/minidev/json/parser/JSONParserBase;->read()V

    .line 481
    iget-char v1, p0, Lnet/minidev/json/parser/JSONParserBase;->c:C

    sparse-switch v1, :sswitch_data_0

    .line 567
    iget-object v1, p0, Lnet/minidev/json/parser/JSONParserBase;->sb:Lnet/minidev/json/parser/JSONParserBase$MSB;

    iget-char v2, p0, Lnet/minidev/json/parser/JSONParserBase;->c:C

    invoke-virtual {v1, v2}, Lnet/minidev/json/parser/JSONParserBase$MSB;->append(C)V

    goto :goto_0

    .line 483
    :sswitch_0
    new-instance v1, Lnet/minidev/json/parser/ParseException;

    iget v2, p0, Lnet/minidev/json/parser/JSONParserBase;->pos:I

    add-int/lit8 v2, v2, -0x1

    const/4 v3, 0x3

    const/4 v4, 0x0

    invoke-direct {v1, v2, v3, v4}, Lnet/minidev/json/parser/ParseException;-><init>(IILjava/lang/Object;)V

    throw v1

    .line 486
    :sswitch_1
    iget-char v1, p0, Lnet/minidev/json/parser/JSONParserBase;->c:C

    if-ne v0, v1, :cond_1

    .line 487
    invoke-virtual {p0}, Lnet/minidev/json/parser/JSONParserBase;->read()V

    .line 488
    iget-object v1, p0, Lnet/minidev/json/parser/JSONParserBase;->sb:Lnet/minidev/json/parser/JSONParserBase$MSB;

    invoke-virtual {v1}, Lnet/minidev/json/parser/JSONParserBase$MSB;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lnet/minidev/json/parser/JSONParserBase;->xs:Ljava/lang/String;

    .line 489
    return-void

    .line 491
    :cond_1
    iget-object v1, p0, Lnet/minidev/json/parser/JSONParserBase;->sb:Lnet/minidev/json/parser/JSONParserBase$MSB;

    iget-char v2, p0, Lnet/minidev/json/parser/JSONParserBase;->c:C

    invoke-virtual {v1, v2}, Lnet/minidev/json/parser/JSONParserBase$MSB;->append(C)V

    goto :goto_0

    .line 494
    :sswitch_2
    invoke-virtual {p0}, Lnet/minidev/json/parser/JSONParserBase;->read()V

    .line 495
    iget-char v1, p0, Lnet/minidev/json/parser/JSONParserBase;->c:C

    sparse-switch v1, :sswitch_data_1

    goto :goto_0

    .line 521
    :sswitch_3
    iget-object v1, p0, Lnet/minidev/json/parser/JSONParserBase;->sb:Lnet/minidev/json/parser/JSONParserBase$MSB;

    const/16 v2, 0x22

    invoke-virtual {v1, v2}, Lnet/minidev/json/parser/JSONParserBase$MSB;->append(C)V

    goto :goto_0

    .line 497
    :sswitch_4
    iget-object v1, p0, Lnet/minidev/json/parser/JSONParserBase;->sb:Lnet/minidev/json/parser/JSONParserBase$MSB;

    const/16 v2, 0x9

    invoke-virtual {v1, v2}, Lnet/minidev/json/parser/JSONParserBase$MSB;->append(C)V

    goto :goto_0

    .line 500
    :sswitch_5
    iget-object v1, p0, Lnet/minidev/json/parser/JSONParserBase;->sb:Lnet/minidev/json/parser/JSONParserBase$MSB;

    const/16 v2, 0xa

    invoke-virtual {v1, v2}, Lnet/minidev/json/parser/JSONParserBase$MSB;->append(C)V

    goto :goto_0

    .line 503
    :sswitch_6
    iget-object v1, p0, Lnet/minidev/json/parser/JSONParserBase;->sb:Lnet/minidev/json/parser/JSONParserBase$MSB;

    const/16 v2, 0xd

    invoke-virtual {v1, v2}, Lnet/minidev/json/parser/JSONParserBase$MSB;->append(C)V

    goto :goto_0

    .line 506
    :sswitch_7
    iget-object v1, p0, Lnet/minidev/json/parser/JSONParserBase;->sb:Lnet/minidev/json/parser/JSONParserBase$MSB;

    const/16 v2, 0xc

    invoke-virtual {v1, v2}, Lnet/minidev/json/parser/JSONParserBase$MSB;->append(C)V

    goto :goto_0

    .line 509
    :sswitch_8
    iget-object v1, p0, Lnet/minidev/json/parser/JSONParserBase;->sb:Lnet/minidev/json/parser/JSONParserBase$MSB;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Lnet/minidev/json/parser/JSONParserBase$MSB;->append(C)V

    goto :goto_0

    .line 512
    :sswitch_9
    iget-object v1, p0, Lnet/minidev/json/parser/JSONParserBase;->sb:Lnet/minidev/json/parser/JSONParserBase$MSB;

    const/16 v2, 0x5c

    invoke-virtual {v1, v2}, Lnet/minidev/json/parser/JSONParserBase$MSB;->append(C)V

    goto :goto_0

    .line 515
    :sswitch_a
    iget-object v1, p0, Lnet/minidev/json/parser/JSONParserBase;->sb:Lnet/minidev/json/parser/JSONParserBase$MSB;

    const/16 v2, 0x2f

    invoke-virtual {v1, v2}, Lnet/minidev/json/parser/JSONParserBase$MSB;->append(C)V

    goto :goto_0

    .line 518
    :sswitch_b
    iget-object v1, p0, Lnet/minidev/json/parser/JSONParserBase;->sb:Lnet/minidev/json/parser/JSONParserBase$MSB;

    const/16 v2, 0x27

    invoke-virtual {v1, v2}, Lnet/minidev/json/parser/JSONParserBase$MSB;->append(C)V

    goto/16 :goto_0

    .line 524
    :sswitch_c
    iget-object v1, p0, Lnet/minidev/json/parser/JSONParserBase;->sb:Lnet/minidev/json/parser/JSONParserBase$MSB;

    invoke-virtual {p0}, Lnet/minidev/json/parser/JSONParserBase;->readUnicode()C

    move-result v2

    invoke-virtual {v1, v2}, Lnet/minidev/json/parser/JSONParserBase$MSB;->append(C)V

    goto/16 :goto_0

    .line 563
    :sswitch_d
    iget-boolean v1, p0, Lnet/minidev/json/parser/JSONParserBase;->ignoreControlChar:Z

    if-nez v1, :cond_0

    .line 565
    new-instance v1, Lnet/minidev/json/parser/ParseException;

    iget v2, p0, Lnet/minidev/json/parser/JSONParserBase;->pos:I

    const/4 v3, 0x0

    iget-char v4, p0, Lnet/minidev/json/parser/JSONParserBase;->c:C

    invoke-static {v4}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v4

    invoke-direct {v1, v2, v3, v4}, Lnet/minidev/json/parser/ParseException;-><init>(IILjava/lang/Object;)V

    throw v1

    .line 481
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_d
        0x1 -> :sswitch_d
        0x2 -> :sswitch_d
        0x3 -> :sswitch_d
        0x4 -> :sswitch_d
        0x5 -> :sswitch_d
        0x6 -> :sswitch_d
        0x7 -> :sswitch_d
        0x8 -> :sswitch_d
        0x9 -> :sswitch_d
        0xa -> :sswitch_d
        0xb -> :sswitch_d
        0xc -> :sswitch_d
        0xd -> :sswitch_d
        0xe -> :sswitch_d
        0xf -> :sswitch_d
        0x10 -> :sswitch_d
        0x11 -> :sswitch_d
        0x12 -> :sswitch_d
        0x13 -> :sswitch_d
        0x14 -> :sswitch_d
        0x15 -> :sswitch_d
        0x16 -> :sswitch_d
        0x17 -> :sswitch_d
        0x18 -> :sswitch_d
        0x19 -> :sswitch_d
        0x1a -> :sswitch_0
        0x1b -> :sswitch_d
        0x1c -> :sswitch_d
        0x1d -> :sswitch_d
        0x1e -> :sswitch_d
        0x1f -> :sswitch_d
        0x22 -> :sswitch_1
        0x27 -> :sswitch_1
        0x5c -> :sswitch_2
        0x7f -> :sswitch_d
    .end sparse-switch

    .line 495
    :sswitch_data_1
    .sparse-switch
        0x22 -> :sswitch_3
        0x27 -> :sswitch_b
        0x2f -> :sswitch_a
        0x5c -> :sswitch_9
        0x62 -> :sswitch_8
        0x66 -> :sswitch_7
        0x6e -> :sswitch_5
        0x72 -> :sswitch_6
        0x74 -> :sswitch_4
        0x75 -> :sswitch_c
    .end sparse-switch
.end method

.method protected readUnicode()C
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x4

    .line 573
    const/4 v1, 0x0

    .line 574
    .local v1, "value":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v5, :cond_4

    .line 575
    mul-int/lit8 v1, v1, 0x10

    .line 576
    invoke-virtual {p0}, Lnet/minidev/json/parser/JSONParserBase;->read()V

    .line 577
    iget-char v2, p0, Lnet/minidev/json/parser/JSONParserBase;->c:C

    const/16 v3, 0x39

    if-gt v2, v3, :cond_0

    iget-char v2, p0, Lnet/minidev/json/parser/JSONParserBase;->c:C

    const/16 v3, 0x30

    if-lt v2, v3, :cond_0

    .line 578
    iget-char v2, p0, Lnet/minidev/json/parser/JSONParserBase;->c:C

    add-int/lit8 v2, v2, -0x30

    add-int/2addr v1, v2

    .line 574
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 579
    :cond_0
    iget-char v2, p0, Lnet/minidev/json/parser/JSONParserBase;->c:C

    const/16 v3, 0x46

    if-gt v2, v3, :cond_1

    iget-char v2, p0, Lnet/minidev/json/parser/JSONParserBase;->c:C

    const/16 v3, 0x41

    if-lt v2, v3, :cond_1

    .line 580
    iget-char v2, p0, Lnet/minidev/json/parser/JSONParserBase;->c:C

    add-int/lit8 v2, v2, -0x41

    add-int/lit8 v2, v2, 0xa

    add-int/2addr v1, v2

    goto :goto_1

    .line 581
    :cond_1
    iget-char v2, p0, Lnet/minidev/json/parser/JSONParserBase;->c:C

    const/16 v3, 0x61

    if-lt v2, v3, :cond_2

    iget-char v2, p0, Lnet/minidev/json/parser/JSONParserBase;->c:C

    const/16 v3, 0x66

    if-gt v2, v3, :cond_2

    .line 582
    iget-char v2, p0, Lnet/minidev/json/parser/JSONParserBase;->c:C

    add-int/lit8 v2, v2, -0x61

    add-int/lit8 v2, v2, 0xa

    add-int/2addr v1, v2

    goto :goto_1

    .line 583
    :cond_2
    iget-char v2, p0, Lnet/minidev/json/parser/JSONParserBase;->c:C

    const/16 v3, 0x1a

    if-ne v2, v3, :cond_3

    .line 584
    new-instance v2, Lnet/minidev/json/parser/ParseException;

    iget v3, p0, Lnet/minidev/json/parser/JSONParserBase;->pos:I

    const/4 v4, 0x3

    const-string v5, "EOF"

    invoke-direct {v2, v3, v4, v5}, Lnet/minidev/json/parser/ParseException;-><init>(IILjava/lang/Object;)V

    throw v2

    .line 586
    :cond_3
    new-instance v2, Lnet/minidev/json/parser/ParseException;

    iget v3, p0, Lnet/minidev/json/parser/JSONParserBase;->pos:I

    iget-char v4, p0, Lnet/minidev/json/parser/JSONParserBase;->c:C

    invoke-static {v4}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v4

    invoke-direct {v2, v3, v5, v4}, Lnet/minidev/json/parser/ParseException;-><init>(IILjava/lang/Object;)V

    throw v2

    .line 588
    :cond_4
    int-to-char v2, v1

    return v2
.end method

.method protected skipDigits()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 593
    :goto_0
    iget-char v0, p0, Lnet/minidev/json/parser/JSONParserBase;->c:C

    const/16 v1, 0x30

    if-lt v0, v1, :cond_0

    iget-char v0, p0, Lnet/minidev/json/parser/JSONParserBase;->c:C

    const/16 v1, 0x39

    if-le v0, v1, :cond_1

    .line 594
    :cond_0
    return-void

    .line 595
    :cond_1
    invoke-virtual {p0}, Lnet/minidev/json/parser/JSONParserBase;->readS()V

    goto :goto_0
.end method

.method protected skipNQString([Z)V
    .locals 2
    .param p1, "stop"    # [Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 601
    :goto_0
    iget-char v0, p0, Lnet/minidev/json/parser/JSONParserBase;->c:C

    const/16 v1, 0x1a

    if-eq v0, v1, :cond_0

    iget-char v0, p0, Lnet/minidev/json/parser/JSONParserBase;->c:C

    if-ltz v0, :cond_1

    iget-char v0, p0, Lnet/minidev/json/parser/JSONParserBase;->c:C

    const/16 v1, 0x7e

    if-ge v0, v1, :cond_1

    iget-char v0, p0, Lnet/minidev/json/parser/JSONParserBase;->c:C

    aget-boolean v0, p1, v0

    if-eqz v0, :cond_1

    .line 602
    :cond_0
    return-void

    .line 603
    :cond_1
    invoke-virtual {p0}, Lnet/minidev/json/parser/JSONParserBase;->readS()V

    goto :goto_0
.end method

.method protected skipSpace()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 609
    :goto_0
    iget-char v0, p0, Lnet/minidev/json/parser/JSONParserBase;->c:C

    const/16 v1, 0x20

    if-gt v0, v1, :cond_0

    iget-char v0, p0, Lnet/minidev/json/parser/JSONParserBase;->c:C

    const/16 v1, 0x1a

    if-ne v0, v1, :cond_1

    .line 610
    :cond_0
    return-void

    .line 611
    :cond_1
    invoke-virtual {p0}, Lnet/minidev/json/parser/JSONParserBase;->readS()V

    goto :goto_0
.end method
