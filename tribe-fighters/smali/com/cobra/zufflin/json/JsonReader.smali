.class public final Lcom/cobra/zufflin/json/JsonReader;
.super Ljava/lang/Object;
.source "JsonReader.java"

# interfaces
.implements Ljava/io/Closeable;


# static fields
.field private static synthetic $SWITCH_TABLE$com$cobra$zufflin$json$JsonScope:[I = null

.field private static final FALSE:Ljava/lang/String; = "false"

.field private static final TRUE:Ljava/lang/String; = "true"


# instance fields
.field private final buffer:[C

.field private bufferStartColumn:I

.field private bufferStartLine:I

.field private final in:Ljava/io/Reader;

.field private lenient:Z

.field private limit:I

.field private name:Ljava/lang/String;

.field private pos:I

.field private skipping:Z

.field private final stack:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/cobra/zufflin/json/JsonScope;",
            ">;"
        }
    .end annotation
.end field

.field private final stringPool:Lcom/cobra/zufflin/json/StringPool;

.field private token:Lcom/cobra/zufflin/json/JsonToken;

.field private value:Ljava/lang/String;

.field private valueLength:I

.field private valuePos:I


# direct methods
.method static synthetic $SWITCH_TABLE$com$cobra$zufflin$json$JsonScope()[I
    .locals 3

    .prologue
    .line 175
    sget-object v0, Lcom/cobra/zufflin/json/JsonReader;->$SWITCH_TABLE$com$cobra$zufflin$json$JsonScope:[I

    if-eqz v0, :cond_0

    :goto_0
    return-object v0

    :cond_0
    invoke-static {}, Lcom/cobra/zufflin/json/JsonScope;->values()[Lcom/cobra/zufflin/json/JsonScope;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/cobra/zufflin/json/JsonScope;->CLOSED:Lcom/cobra/zufflin/json/JsonScope;

    invoke-virtual {v1}, Lcom/cobra/zufflin/json/JsonScope;->ordinal()I

    move-result v1

    const/16 v2, 0x8

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_7

    :goto_1
    :try_start_1
    sget-object v1, Lcom/cobra/zufflin/json/JsonScope;->DANGLING_NAME:Lcom/cobra/zufflin/json/JsonScope;

    invoke-virtual {v1}, Lcom/cobra/zufflin/json/JsonScope;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_6

    :goto_2
    :try_start_2
    sget-object v1, Lcom/cobra/zufflin/json/JsonScope;->EMPTY_ARRAY:Lcom/cobra/zufflin/json/JsonScope;

    invoke-virtual {v1}, Lcom/cobra/zufflin/json/JsonScope;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_5

    :goto_3
    :try_start_3
    sget-object v1, Lcom/cobra/zufflin/json/JsonScope;->EMPTY_DOCUMENT:Lcom/cobra/zufflin/json/JsonScope;

    invoke-virtual {v1}, Lcom/cobra/zufflin/json/JsonScope;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_4

    :goto_4
    :try_start_4
    sget-object v1, Lcom/cobra/zufflin/json/JsonScope;->EMPTY_OBJECT:Lcom/cobra/zufflin/json/JsonScope;

    invoke-virtual {v1}, Lcom/cobra/zufflin/json/JsonScope;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_3

    :goto_5
    :try_start_5
    sget-object v1, Lcom/cobra/zufflin/json/JsonScope;->NONEMPTY_ARRAY:Lcom/cobra/zufflin/json/JsonScope;

    invoke-virtual {v1}, Lcom/cobra/zufflin/json/JsonScope;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_2

    :goto_6
    :try_start_6
    sget-object v1, Lcom/cobra/zufflin/json/JsonScope;->NONEMPTY_DOCUMENT:Lcom/cobra/zufflin/json/JsonScope;

    invoke-virtual {v1}, Lcom/cobra/zufflin/json/JsonScope;->ordinal()I

    move-result v1

    const/4 v2, 0x7

    aput v2, v0, v1
    :try_end_6
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6 .. :try_end_6} :catch_1

    :goto_7
    :try_start_7
    sget-object v1, Lcom/cobra/zufflin/json/JsonScope;->NONEMPTY_OBJECT:Lcom/cobra/zufflin/json/JsonScope;

    invoke-virtual {v1}, Lcom/cobra/zufflin/json/JsonScope;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_7
    .catch Ljava/lang/NoSuchFieldError; {:try_start_7 .. :try_end_7} :catch_0

    :goto_8
    sput-object v0, Lcom/cobra/zufflin/json/JsonReader;->$SWITCH_TABLE$com$cobra$zufflin$json$JsonScope:[I

    goto :goto_0

    :catch_0
    move-exception v1

    goto :goto_8

    :catch_1
    move-exception v1

    goto :goto_7

    :catch_2
    move-exception v1

    goto :goto_6

    :catch_3
    move-exception v1

    goto :goto_5

    :catch_4
    move-exception v1

    goto :goto_4

    :catch_5
    move-exception v1

    goto :goto_3

    :catch_6
    move-exception v1

    goto :goto_2

    :catch_7
    move-exception v1

    goto :goto_1
.end method

.method public constructor <init>(Ljava/io/Reader;)V
    .locals 3
    .param p1, "in"    # Ljava/io/Reader;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 232
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 180
    new-instance v0, Lcom/cobra/zufflin/json/StringPool;

    invoke-direct {v0}, Lcom/cobra/zufflin/json/StringPool;-><init>()V

    iput-object v0, p0, Lcom/cobra/zufflin/json/JsonReader;->stringPool:Lcom/cobra/zufflin/json/StringPool;

    .line 186
    iput-boolean v1, p0, Lcom/cobra/zufflin/json/JsonReader;->lenient:Z

    .line 194
    const/16 v0, 0x400

    new-array v0, v0, [C

    iput-object v0, p0, Lcom/cobra/zufflin/json/JsonReader;->buffer:[C

    .line 195
    iput v1, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    .line 196
    iput v1, p0, Lcom/cobra/zufflin/json/JsonReader;->limit:I

    .line 201
    iput v2, p0, Lcom/cobra/zufflin/json/JsonReader;->bufferStartLine:I

    .line 202
    iput v2, p0, Lcom/cobra/zufflin/json/JsonReader;->bufferStartColumn:I

    .line 204
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/cobra/zufflin/json/JsonReader;->stack:Ljava/util/List;

    .line 206
    sget-object v0, Lcom/cobra/zufflin/json/JsonScope;->EMPTY_DOCUMENT:Lcom/cobra/zufflin/json/JsonScope;

    invoke-direct {p0, v0}, Lcom/cobra/zufflin/json/JsonReader;->push(Lcom/cobra/zufflin/json/JsonScope;)V

    .line 227
    iput-boolean v1, p0, Lcom/cobra/zufflin/json/JsonReader;->skipping:Z

    .line 233
    if-nez p1, :cond_0

    .line 234
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "in == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 236
    :cond_0
    iput-object p1, p0, Lcom/cobra/zufflin/json/JsonReader;->in:Ljava/io/Reader;

    .line 237
    return-void
.end method

.method private advance()Lcom/cobra/zufflin/json/JsonToken;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 370
    invoke-virtual {p0}, Lcom/cobra/zufflin/json/JsonReader;->peek()Lcom/cobra/zufflin/json/JsonToken;

    .line 372
    iget-object v0, p0, Lcom/cobra/zufflin/json/JsonReader;->token:Lcom/cobra/zufflin/json/JsonToken;

    .line 373
    .local v0, "result":Lcom/cobra/zufflin/json/JsonToken;
    iput-object v1, p0, Lcom/cobra/zufflin/json/JsonReader;->token:Lcom/cobra/zufflin/json/JsonToken;

    .line 374
    iput-object v1, p0, Lcom/cobra/zufflin/json/JsonReader;->value:Ljava/lang/String;

    .line 375
    iput-object v1, p0, Lcom/cobra/zufflin/json/JsonReader;->name:Ljava/lang/String;

    .line 376
    return-object v0
.end method

.method private checkLenient()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 833
    iget-boolean v0, p0, Lcom/cobra/zufflin/json/JsonReader;->lenient:Z

    if-nez v0, :cond_0

    .line 834
    const-string v0, "Use JsonReader.setLenient(true) to accept malformed JSON"

    invoke-direct {p0, v0}, Lcom/cobra/zufflin/json/JsonReader;->syntaxError(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    .line 836
    :cond_0
    return-void
.end method

.method private decodeLiteral()Lcom/cobra/zufflin/json/JsonToken;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v7, 0x55

    const/16 v6, 0x45

    const/4 v5, 0x4

    const/16 v4, 0x6c

    const/16 v3, 0x4c

    .line 1065
    iget v0, p0, Lcom/cobra/zufflin/json/JsonReader;->valuePos:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 1067
    sget-object v0, Lcom/cobra/zufflin/json/JsonToken;->STRING:Lcom/cobra/zufflin/json/JsonToken;

    .line 1092
    :goto_0
    return-object v0

    .line 1068
    :cond_0
    iget v0, p0, Lcom/cobra/zufflin/json/JsonReader;->valueLength:I

    if-ne v0, v5, :cond_5

    .line 1069
    const/16 v0, 0x6e

    iget-object v1, p0, Lcom/cobra/zufflin/json/JsonReader;->buffer:[C

    iget v2, p0, Lcom/cobra/zufflin/json/JsonReader;->valuePos:I

    aget-char v1, v1, v2

    if-eq v0, v1, :cond_1

    const/16 v0, 0x4e

    iget-object v1, p0, Lcom/cobra/zufflin/json/JsonReader;->buffer:[C

    iget v2, p0, Lcom/cobra/zufflin/json/JsonReader;->valuePos:I

    aget-char v1, v1, v2

    if-ne v0, v1, :cond_5

    .line 1070
    :cond_1
    const/16 v0, 0x75

    iget-object v1, p0, Lcom/cobra/zufflin/json/JsonReader;->buffer:[C

    iget v2, p0, Lcom/cobra/zufflin/json/JsonReader;->valuePos:I

    add-int/lit8 v2, v2, 0x1

    aget-char v1, v1, v2

    if-eq v0, v1, :cond_2

    iget-object v0, p0, Lcom/cobra/zufflin/json/JsonReader;->buffer:[C

    iget v1, p0, Lcom/cobra/zufflin/json/JsonReader;->valuePos:I

    add-int/lit8 v1, v1, 0x1

    aget-char v0, v0, v1

    if-ne v7, v0, :cond_5

    .line 1071
    :cond_2
    iget-object v0, p0, Lcom/cobra/zufflin/json/JsonReader;->buffer:[C

    iget v1, p0, Lcom/cobra/zufflin/json/JsonReader;->valuePos:I

    add-int/lit8 v1, v1, 0x2

    aget-char v0, v0, v1

    if-eq v4, v0, :cond_3

    iget-object v0, p0, Lcom/cobra/zufflin/json/JsonReader;->buffer:[C

    iget v1, p0, Lcom/cobra/zufflin/json/JsonReader;->valuePos:I

    add-int/lit8 v1, v1, 0x2

    aget-char v0, v0, v1

    if-ne v3, v0, :cond_5

    .line 1072
    :cond_3
    iget-object v0, p0, Lcom/cobra/zufflin/json/JsonReader;->buffer:[C

    iget v1, p0, Lcom/cobra/zufflin/json/JsonReader;->valuePos:I

    add-int/lit8 v1, v1, 0x3

    aget-char v0, v0, v1

    if-eq v4, v0, :cond_4

    iget-object v0, p0, Lcom/cobra/zufflin/json/JsonReader;->buffer:[C

    iget v1, p0, Lcom/cobra/zufflin/json/JsonReader;->valuePos:I

    add-int/lit8 v1, v1, 0x3

    aget-char v0, v0, v1

    if-ne v3, v0, :cond_5

    .line 1073
    :cond_4
    const-string v0, "null"

    iput-object v0, p0, Lcom/cobra/zufflin/json/JsonReader;->value:Ljava/lang/String;

    .line 1074
    sget-object v0, Lcom/cobra/zufflin/json/JsonToken;->NULL:Lcom/cobra/zufflin/json/JsonToken;

    goto :goto_0

    .line 1075
    :cond_5
    iget v0, p0, Lcom/cobra/zufflin/json/JsonReader;->valueLength:I

    if-ne v0, v5, :cond_a

    .line 1076
    const/16 v0, 0x74

    iget-object v1, p0, Lcom/cobra/zufflin/json/JsonReader;->buffer:[C

    iget v2, p0, Lcom/cobra/zufflin/json/JsonReader;->valuePos:I

    aget-char v1, v1, v2

    if-eq v0, v1, :cond_6

    const/16 v0, 0x54

    iget-object v1, p0, Lcom/cobra/zufflin/json/JsonReader;->buffer:[C

    iget v2, p0, Lcom/cobra/zufflin/json/JsonReader;->valuePos:I

    aget-char v1, v1, v2

    if-ne v0, v1, :cond_a

    .line 1077
    :cond_6
    const/16 v0, 0x72

    iget-object v1, p0, Lcom/cobra/zufflin/json/JsonReader;->buffer:[C

    iget v2, p0, Lcom/cobra/zufflin/json/JsonReader;->valuePos:I

    add-int/lit8 v2, v2, 0x1

    aget-char v1, v1, v2

    if-eq v0, v1, :cond_7

    const/16 v0, 0x52

    iget-object v1, p0, Lcom/cobra/zufflin/json/JsonReader;->buffer:[C

    iget v2, p0, Lcom/cobra/zufflin/json/JsonReader;->valuePos:I

    add-int/lit8 v2, v2, 0x1

    aget-char v1, v1, v2

    if-ne v0, v1, :cond_a

    .line 1078
    :cond_7
    const/16 v0, 0x75

    iget-object v1, p0, Lcom/cobra/zufflin/json/JsonReader;->buffer:[C

    iget v2, p0, Lcom/cobra/zufflin/json/JsonReader;->valuePos:I

    add-int/lit8 v2, v2, 0x2

    aget-char v1, v1, v2

    if-eq v0, v1, :cond_8

    iget-object v0, p0, Lcom/cobra/zufflin/json/JsonReader;->buffer:[C

    iget v1, p0, Lcom/cobra/zufflin/json/JsonReader;->valuePos:I

    add-int/lit8 v1, v1, 0x2

    aget-char v0, v0, v1

    if-ne v7, v0, :cond_a

    .line 1079
    :cond_8
    const/16 v0, 0x65

    iget-object v1, p0, Lcom/cobra/zufflin/json/JsonReader;->buffer:[C

    iget v2, p0, Lcom/cobra/zufflin/json/JsonReader;->valuePos:I

    add-int/lit8 v2, v2, 0x3

    aget-char v1, v1, v2

    if-eq v0, v1, :cond_9

    iget-object v0, p0, Lcom/cobra/zufflin/json/JsonReader;->buffer:[C

    iget v1, p0, Lcom/cobra/zufflin/json/JsonReader;->valuePos:I

    add-int/lit8 v1, v1, 0x3

    aget-char v0, v0, v1

    if-ne v6, v0, :cond_a

    .line 1080
    :cond_9
    const-string v0, "true"

    iput-object v0, p0, Lcom/cobra/zufflin/json/JsonReader;->value:Ljava/lang/String;

    .line 1081
    sget-object v0, Lcom/cobra/zufflin/json/JsonToken;->BOOLEAN:Lcom/cobra/zufflin/json/JsonToken;

    goto/16 :goto_0

    .line 1082
    :cond_a
    iget v0, p0, Lcom/cobra/zufflin/json/JsonReader;->valueLength:I

    const/4 v1, 0x5

    if-ne v0, v1, :cond_10

    .line 1083
    const/16 v0, 0x66

    iget-object v1, p0, Lcom/cobra/zufflin/json/JsonReader;->buffer:[C

    iget v2, p0, Lcom/cobra/zufflin/json/JsonReader;->valuePos:I

    aget-char v1, v1, v2

    if-eq v0, v1, :cond_b

    const/16 v0, 0x46

    iget-object v1, p0, Lcom/cobra/zufflin/json/JsonReader;->buffer:[C

    iget v2, p0, Lcom/cobra/zufflin/json/JsonReader;->valuePos:I

    aget-char v1, v1, v2

    if-ne v0, v1, :cond_10

    .line 1084
    :cond_b
    const/16 v0, 0x61

    iget-object v1, p0, Lcom/cobra/zufflin/json/JsonReader;->buffer:[C

    iget v2, p0, Lcom/cobra/zufflin/json/JsonReader;->valuePos:I

    add-int/lit8 v2, v2, 0x1

    aget-char v1, v1, v2

    if-eq v0, v1, :cond_c

    const/16 v0, 0x41

    iget-object v1, p0, Lcom/cobra/zufflin/json/JsonReader;->buffer:[C

    iget v2, p0, Lcom/cobra/zufflin/json/JsonReader;->valuePos:I

    add-int/lit8 v2, v2, 0x1

    aget-char v1, v1, v2

    if-ne v0, v1, :cond_10

    .line 1085
    :cond_c
    iget-object v0, p0, Lcom/cobra/zufflin/json/JsonReader;->buffer:[C

    iget v1, p0, Lcom/cobra/zufflin/json/JsonReader;->valuePos:I

    add-int/lit8 v1, v1, 0x2

    aget-char v0, v0, v1

    if-eq v4, v0, :cond_d

    iget-object v0, p0, Lcom/cobra/zufflin/json/JsonReader;->buffer:[C

    iget v1, p0, Lcom/cobra/zufflin/json/JsonReader;->valuePos:I

    add-int/lit8 v1, v1, 0x2

    aget-char v0, v0, v1

    if-ne v3, v0, :cond_10

    .line 1086
    :cond_d
    const/16 v0, 0x73

    iget-object v1, p0, Lcom/cobra/zufflin/json/JsonReader;->buffer:[C

    iget v2, p0, Lcom/cobra/zufflin/json/JsonReader;->valuePos:I

    add-int/lit8 v2, v2, 0x3

    aget-char v1, v1, v2

    if-eq v0, v1, :cond_e

    const/16 v0, 0x53

    iget-object v1, p0, Lcom/cobra/zufflin/json/JsonReader;->buffer:[C

    iget v2, p0, Lcom/cobra/zufflin/json/JsonReader;->valuePos:I

    add-int/lit8 v2, v2, 0x3

    aget-char v1, v1, v2

    if-ne v0, v1, :cond_10

    .line 1087
    :cond_e
    const/16 v0, 0x65

    iget-object v1, p0, Lcom/cobra/zufflin/json/JsonReader;->buffer:[C

    iget v2, p0, Lcom/cobra/zufflin/json/JsonReader;->valuePos:I

    add-int/lit8 v2, v2, 0x4

    aget-char v1, v1, v2

    if-eq v0, v1, :cond_f

    iget-object v0, p0, Lcom/cobra/zufflin/json/JsonReader;->buffer:[C

    iget v1, p0, Lcom/cobra/zufflin/json/JsonReader;->valuePos:I

    add-int/lit8 v1, v1, 0x4

    aget-char v0, v0, v1

    if-ne v6, v0, :cond_10

    .line 1088
    :cond_f
    const-string v0, "false"

    iput-object v0, p0, Lcom/cobra/zufflin/json/JsonReader;->value:Ljava/lang/String;

    .line 1089
    sget-object v0, Lcom/cobra/zufflin/json/JsonToken;->BOOLEAN:Lcom/cobra/zufflin/json/JsonToken;

    goto/16 :goto_0

    .line 1091
    :cond_10
    iget-object v0, p0, Lcom/cobra/zufflin/json/JsonReader;->stringPool:Lcom/cobra/zufflin/json/StringPool;

    iget-object v1, p0, Lcom/cobra/zufflin/json/JsonReader;->buffer:[C

    iget v2, p0, Lcom/cobra/zufflin/json/JsonReader;->valuePos:I

    iget v3, p0, Lcom/cobra/zufflin/json/JsonReader;->valueLength:I

    invoke-virtual {v0, v1, v2, v3}, Lcom/cobra/zufflin/json/StringPool;->get([CII)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/cobra/zufflin/json/JsonReader;->value:Ljava/lang/String;

    .line 1092
    iget-object v0, p0, Lcom/cobra/zufflin/json/JsonReader;->buffer:[C

    iget v1, p0, Lcom/cobra/zufflin/json/JsonReader;->valuePos:I

    iget v2, p0, Lcom/cobra/zufflin/json/JsonReader;->valueLength:I

    invoke-direct {p0, v0, v1, v2}, Lcom/cobra/zufflin/json/JsonReader;->decodeNumber([CII)Lcom/cobra/zufflin/json/JsonToken;

    move-result-object v0

    goto/16 :goto_0
.end method

.method private decodeNumber([CII)Lcom/cobra/zufflin/json/JsonToken;
    .locals 6
    .param p1, "chars"    # [C
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .prologue
    const/16 v5, 0x2d

    const/16 v4, 0x39

    const/16 v3, 0x30

    .line 1103
    move v1, p2

    .line 1104
    .local v1, "i":I
    aget-char v0, p1, v1

    .line 1106
    .local v0, "c":I
    if-ne v0, v5, :cond_0

    .line 1107
    add-int/lit8 v1, v1, 0x1

    aget-char v0, p1, v1

    .line 1110
    :cond_0
    if-ne v0, v3, :cond_7

    .line 1111
    add-int/lit8 v1, v1, 0x1

    aget-char v0, p1, v1

    .line 1121
    :cond_1
    const/16 v2, 0x2e

    if-ne v0, v2, :cond_2

    .line 1122
    add-int/lit8 v1, v1, 0x1

    aget-char v0, p1, v1

    .line 1123
    :goto_0
    if-lt v0, v3, :cond_2

    if-le v0, v4, :cond_9

    .line 1128
    :cond_2
    const/16 v2, 0x65

    if-eq v0, v2, :cond_3

    const/16 v2, 0x45

    if-ne v0, v2, :cond_6

    .line 1129
    :cond_3
    add-int/lit8 v1, v1, 0x1

    aget-char v0, p1, v1

    .line 1130
    const/16 v2, 0x2b

    if-eq v0, v2, :cond_4

    if-ne v0, v5, :cond_5

    .line 1131
    :cond_4
    add-int/lit8 v1, v1, 0x1

    aget-char v0, p1, v1

    .line 1133
    :cond_5
    if-lt v0, v3, :cond_b

    if-gt v0, v4, :cond_b

    .line 1134
    add-int/lit8 v1, v1, 0x1

    aget-char v0, p1, v1

    .line 1135
    :goto_1
    if-lt v0, v3, :cond_6

    if-le v0, v4, :cond_a

    .line 1143
    :cond_6
    add-int v2, p2, p3

    if-ne v1, v2, :cond_c

    .line 1144
    sget-object v2, Lcom/cobra/zufflin/json/JsonToken;->NUMBER:Lcom/cobra/zufflin/json/JsonToken;

    .line 1146
    :goto_2
    return-object v2

    .line 1112
    :cond_7
    const/16 v2, 0x31

    if-lt v0, v2, :cond_8

    if-gt v0, v4, :cond_8

    .line 1113
    add-int/lit8 v1, v1, 0x1

    aget-char v0, p1, v1

    .line 1114
    :goto_3
    if-lt v0, v3, :cond_1

    if-gt v0, v4, :cond_1

    .line 1115
    add-int/lit8 v1, v1, 0x1

    aget-char v0, p1, v1

    goto :goto_3

    .line 1118
    :cond_8
    sget-object v2, Lcom/cobra/zufflin/json/JsonToken;->STRING:Lcom/cobra/zufflin/json/JsonToken;

    goto :goto_2

    .line 1124
    :cond_9
    add-int/lit8 v1, v1, 0x1

    aget-char v0, p1, v1

    goto :goto_0

    .line 1136
    :cond_a
    add-int/lit8 v1, v1, 0x1

    aget-char v0, p1, v1

    goto :goto_1

    .line 1139
    :cond_b
    sget-object v2, Lcom/cobra/zufflin/json/JsonToken;->STRING:Lcom/cobra/zufflin/json/JsonToken;

    goto :goto_2

    .line 1146
    :cond_c
    sget-object v2, Lcom/cobra/zufflin/json/JsonToken;->STRING:Lcom/cobra/zufflin/json/JsonToken;

    goto :goto_2
.end method

.method private expect(Lcom/cobra/zufflin/json/JsonToken;)V
    .locals 3
    .param p1, "expected"    # Lcom/cobra/zufflin/json/JsonToken;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 307
    invoke-virtual {p0}, Lcom/cobra/zufflin/json/JsonReader;->peek()Lcom/cobra/zufflin/json/JsonToken;

    .line 308
    iget-object v0, p0, Lcom/cobra/zufflin/json/JsonReader;->token:Lcom/cobra/zufflin/json/JsonToken;

    if-eq v0, p1, :cond_0

    .line 309
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Expected "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " but was "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/cobra/zufflin/json/JsonReader;->peek()Lcom/cobra/zufflin/json/JsonToken;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 311
    :cond_0
    invoke-direct {p0}, Lcom/cobra/zufflin/json/JsonReader;->advance()Lcom/cobra/zufflin/json/JsonToken;

    .line 312
    return-void
.end method

.method private fillBuffer(I)Z
    .locals 9
    .param p1, "minimum"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 720
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget v4, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    if-lt v0, v4, :cond_1

    .line 729
    iget v4, p0, Lcom/cobra/zufflin/json/JsonReader;->limit:I

    iget v5, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    if-eq v4, v5, :cond_3

    .line 730
    iget v4, p0, Lcom/cobra/zufflin/json/JsonReader;->limit:I

    iget v5, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    sub-int/2addr v4, v5

    iput v4, p0, Lcom/cobra/zufflin/json/JsonReader;->limit:I

    .line 731
    iget-object v4, p0, Lcom/cobra/zufflin/json/JsonReader;->buffer:[C

    iget v5, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    iget-object v6, p0, Lcom/cobra/zufflin/json/JsonReader;->buffer:[C

    iget v7, p0, Lcom/cobra/zufflin/json/JsonReader;->limit:I

    invoke-static {v4, v5, v6, v3, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 736
    :goto_1
    iput v3, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    .line 738
    :cond_0
    iget-object v4, p0, Lcom/cobra/zufflin/json/JsonReader;->in:Ljava/io/Reader;

    iget-object v5, p0, Lcom/cobra/zufflin/json/JsonReader;->buffer:[C

    iget v6, p0, Lcom/cobra/zufflin/json/JsonReader;->limit:I

    iget-object v7, p0, Lcom/cobra/zufflin/json/JsonReader;->buffer:[C

    array-length v7, v7

    iget v8, p0, Lcom/cobra/zufflin/json/JsonReader;->limit:I

    sub-int/2addr v7, v8

    invoke-virtual {v4, v5, v6, v7}, Ljava/io/Reader;->read([CII)I

    move-result v1

    .local v1, "total":I
    const/4 v4, -0x1

    if-ne v1, v4, :cond_4

    move v2, v3

    .line 752
    :goto_2
    return v2

    .line 721
    .end local v1    # "total":I
    :cond_1
    iget-object v4, p0, Lcom/cobra/zufflin/json/JsonReader;->buffer:[C

    aget-char v4, v4, v0

    const/16 v5, 0xa

    if-ne v4, v5, :cond_2

    .line 722
    iget v4, p0, Lcom/cobra/zufflin/json/JsonReader;->bufferStartLine:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lcom/cobra/zufflin/json/JsonReader;->bufferStartLine:I

    .line 723
    iput v2, p0, Lcom/cobra/zufflin/json/JsonReader;->bufferStartColumn:I

    .line 720
    :goto_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 725
    :cond_2
    iget v4, p0, Lcom/cobra/zufflin/json/JsonReader;->bufferStartColumn:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lcom/cobra/zufflin/json/JsonReader;->bufferStartColumn:I

    goto :goto_3

    .line 733
    :cond_3
    iput v3, p0, Lcom/cobra/zufflin/json/JsonReader;->limit:I

    goto :goto_1

    .line 739
    .restart local v1    # "total":I
    :cond_4
    iget v4, p0, Lcom/cobra/zufflin/json/JsonReader;->limit:I

    add-int/2addr v4, v1

    iput v4, p0, Lcom/cobra/zufflin/json/JsonReader;->limit:I

    .line 742
    iget v4, p0, Lcom/cobra/zufflin/json/JsonReader;->bufferStartLine:I

    if-ne v4, v2, :cond_5

    iget v4, p0, Lcom/cobra/zufflin/json/JsonReader;->bufferStartColumn:I

    if-ne v4, v2, :cond_5

    .line 743
    iget v4, p0, Lcom/cobra/zufflin/json/JsonReader;->limit:I

    if-lez v4, :cond_5

    iget-object v4, p0, Lcom/cobra/zufflin/json/JsonReader;->buffer:[C

    aget-char v4, v4, v3

    const v5, 0xfeff

    if-ne v4, v5, :cond_5

    .line 744
    iget v4, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    .line 745
    iget v4, p0, Lcom/cobra/zufflin/json/JsonReader;->bufferStartColumn:I

    add-int/lit8 v4, v4, -0x1

    iput v4, p0, Lcom/cobra/zufflin/json/JsonReader;->bufferStartColumn:I

    .line 748
    :cond_5
    iget v4, p0, Lcom/cobra/zufflin/json/JsonReader;->limit:I

    if-lt v4, p1, :cond_0

    goto :goto_2
.end method

.method private getColumnNumber()I
    .locals 4

    .prologue
    .line 766
    iget v1, p0, Lcom/cobra/zufflin/json/JsonReader;->bufferStartColumn:I

    .line 767
    .local v1, "result":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget v2, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    if-lt v0, v2, :cond_0

    .line 774
    return v1

    .line 768
    :cond_0
    iget-object v2, p0, Lcom/cobra/zufflin/json/JsonReader;->buffer:[C

    aget-char v2, v2, v0

    const/16 v3, 0xa

    if-ne v2, v3, :cond_1

    .line 769
    const/4 v1, 0x1

    .line 767
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 771
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method

.method private getLineNumber()I
    .locals 4

    .prologue
    .line 756
    iget v1, p0, Lcom/cobra/zufflin/json/JsonReader;->bufferStartLine:I

    .line 757
    .local v1, "result":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget v2, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    if-lt v0, v2, :cond_0

    .line 762
    return v1

    .line 758
    :cond_0
    iget-object v2, p0, Lcom/cobra/zufflin/json/JsonReader;->buffer:[C

    aget-char v2, v2, v0

    const/16 v3, 0xa

    if-ne v2, v3, :cond_1

    .line 759
    add-int/lit8 v1, v1, 0x1

    .line 757
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private getSnippet()Ljava/lang/CharSequence;
    .locals 6

    .prologue
    const/16 v5, 0x14

    .line 1160
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 1161
    .local v2, "snippet":Ljava/lang/StringBuilder;
    iget v3, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    invoke-static {v3, v5}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 1162
    .local v1, "beforePos":I
    iget-object v3, p0, Lcom/cobra/zufflin/json/JsonReader;->buffer:[C

    iget v4, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    sub-int/2addr v4, v1

    invoke-virtual {v2, v3, v4, v1}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 1163
    iget v3, p0, Lcom/cobra/zufflin/json/JsonReader;->limit:I

    iget v4, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    sub-int/2addr v3, v4

    invoke-static {v3, v5}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 1164
    .local v0, "afterPos":I
    iget-object v3, p0, Lcom/cobra/zufflin/json/JsonReader;->buffer:[C

    iget v4, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    invoke-virtual {v2, v3, v4, v0}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 1165
    return-object v2
.end method

.method private nextInArray(Z)Lcom/cobra/zufflin/json/JsonToken;
    .locals 1
    .param p1, "firstElement"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 582
    if-eqz p1, :cond_0

    .line 583
    sget-object v0, Lcom/cobra/zufflin/json/JsonScope;->NONEMPTY_ARRAY:Lcom/cobra/zufflin/json/JsonScope;

    invoke-direct {p0, v0}, Lcom/cobra/zufflin/json/JsonReader;->replaceTop(Lcom/cobra/zufflin/json/JsonScope;)V

    .line 599
    :goto_0
    :sswitch_0
    invoke-direct {p0}, Lcom/cobra/zufflin/json/JsonReader;->nextNonWhitespace()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    .line 614
    iget v0, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    .line 615
    invoke-direct {p0}, Lcom/cobra/zufflin/json/JsonReader;->nextValue()Lcom/cobra/zufflin/json/JsonToken;

    move-result-object v0

    :goto_1
    return-object v0

    .line 586
    :cond_0
    invoke-direct {p0}, Lcom/cobra/zufflin/json/JsonReader;->nextNonWhitespace()I

    move-result v0

    sparse-switch v0, :sswitch_data_1

    .line 595
    const-string v0, "Unterminated array"

    invoke-direct {p0, v0}, Lcom/cobra/zufflin/json/JsonReader;->syntaxError(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    .line 588
    :sswitch_1
    invoke-direct {p0}, Lcom/cobra/zufflin/json/JsonReader;->pop()Lcom/cobra/zufflin/json/JsonScope;

    .line 589
    sget-object v0, Lcom/cobra/zufflin/json/JsonToken;->END_ARRAY:Lcom/cobra/zufflin/json/JsonToken;

    iput-object v0, p0, Lcom/cobra/zufflin/json/JsonReader;->token:Lcom/cobra/zufflin/json/JsonToken;

    goto :goto_1

    .line 591
    :sswitch_2
    invoke-direct {p0}, Lcom/cobra/zufflin/json/JsonReader;->checkLenient()V

    goto :goto_0

    .line 601
    :sswitch_3
    if-eqz p1, :cond_1

    .line 602
    invoke-direct {p0}, Lcom/cobra/zufflin/json/JsonReader;->pop()Lcom/cobra/zufflin/json/JsonScope;

    .line 603
    sget-object v0, Lcom/cobra/zufflin/json/JsonToken;->END_ARRAY:Lcom/cobra/zufflin/json/JsonToken;

    iput-object v0, p0, Lcom/cobra/zufflin/json/JsonReader;->token:Lcom/cobra/zufflin/json/JsonToken;

    goto :goto_1

    .line 609
    :cond_1
    :sswitch_4
    invoke-direct {p0}, Lcom/cobra/zufflin/json/JsonReader;->checkLenient()V

    .line 610
    iget v0, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    .line 611
    const-string v0, "null"

    iput-object v0, p0, Lcom/cobra/zufflin/json/JsonReader;->value:Ljava/lang/String;

    .line 612
    sget-object v0, Lcom/cobra/zufflin/json/JsonToken;->NULL:Lcom/cobra/zufflin/json/JsonToken;

    iput-object v0, p0, Lcom/cobra/zufflin/json/JsonReader;->token:Lcom/cobra/zufflin/json/JsonToken;

    goto :goto_1

    .line 599
    nop

    :sswitch_data_0
    .sparse-switch
        0x2c -> :sswitch_4
        0x3b -> :sswitch_4
        0x5d -> :sswitch_3
    .end sparse-switch

    .line 586
    :sswitch_data_1
    .sparse-switch
        0x2c -> :sswitch_0
        0x3b -> :sswitch_2
        0x5d -> :sswitch_1
    .end sparse-switch
.end method

.method private nextInObject(Z)Lcom/cobra/zufflin/json/JsonToken;
    .locals 2
    .param p1, "firstElement"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 625
    if-eqz p1, :cond_0

    .line 627
    invoke-direct {p0}, Lcom/cobra/zufflin/json/JsonReader;->nextNonWhitespace()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 632
    iget v1, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    .line 648
    :sswitch_0
    invoke-direct {p0}, Lcom/cobra/zufflin/json/JsonReader;->nextNonWhitespace()I

    move-result v0

    .line 649
    .local v0, "quote":I
    sparse-switch v0, :sswitch_data_0

    .line 656
    invoke-direct {p0}, Lcom/cobra/zufflin/json/JsonReader;->checkLenient()V

    .line 657
    iget v1, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    .line 658
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/cobra/zufflin/json/JsonReader;->nextLiteral(Z)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/cobra/zufflin/json/JsonReader;->name:Ljava/lang/String;

    .line 659
    iget-object v1, p0, Lcom/cobra/zufflin/json/JsonReader;->name:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 660
    const-string v1, "Expected name"

    invoke-direct {p0, v1}, Lcom/cobra/zufflin/json/JsonReader;->syntaxError(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v1

    throw v1

    .line 629
    .end local v0    # "quote":I
    :pswitch_0
    invoke-direct {p0}, Lcom/cobra/zufflin/json/JsonReader;->pop()Lcom/cobra/zufflin/json/JsonScope;

    .line 630
    sget-object v1, Lcom/cobra/zufflin/json/JsonToken;->END_OBJECT:Lcom/cobra/zufflin/json/JsonToken;

    iput-object v1, p0, Lcom/cobra/zufflin/json/JsonReader;->token:Lcom/cobra/zufflin/json/JsonToken;

    .line 665
    :goto_0
    return-object v1

    .line 635
    :cond_0
    invoke-direct {p0}, Lcom/cobra/zufflin/json/JsonReader;->nextNonWhitespace()I

    move-result v1

    sparse-switch v1, :sswitch_data_1

    .line 643
    const-string v1, "Unterminated object"

    invoke-direct {p0, v1}, Lcom/cobra/zufflin/json/JsonReader;->syntaxError(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v1

    throw v1

    .line 637
    :sswitch_1
    invoke-direct {p0}, Lcom/cobra/zufflin/json/JsonReader;->pop()Lcom/cobra/zufflin/json/JsonScope;

    .line 638
    sget-object v1, Lcom/cobra/zufflin/json/JsonToken;->END_OBJECT:Lcom/cobra/zufflin/json/JsonToken;

    iput-object v1, p0, Lcom/cobra/zufflin/json/JsonReader;->token:Lcom/cobra/zufflin/json/JsonToken;

    goto :goto_0

    .line 651
    .restart local v0    # "quote":I
    :sswitch_2
    invoke-direct {p0}, Lcom/cobra/zufflin/json/JsonReader;->checkLenient()V

    .line 653
    :sswitch_3
    int-to-char v1, v0

    invoke-direct {p0, v1}, Lcom/cobra/zufflin/json/JsonReader;->nextString(C)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/cobra/zufflin/json/JsonReader;->name:Ljava/lang/String;

    .line 664
    :cond_1
    sget-object v1, Lcom/cobra/zufflin/json/JsonScope;->DANGLING_NAME:Lcom/cobra/zufflin/json/JsonScope;

    invoke-direct {p0, v1}, Lcom/cobra/zufflin/json/JsonReader;->replaceTop(Lcom/cobra/zufflin/json/JsonScope;)V

    .line 665
    sget-object v1, Lcom/cobra/zufflin/json/JsonToken;->NAME:Lcom/cobra/zufflin/json/JsonToken;

    iput-object v1, p0, Lcom/cobra/zufflin/json/JsonReader;->token:Lcom/cobra/zufflin/json/JsonToken;

    goto :goto_0

    .line 627
    nop

    :pswitch_data_0
    .packed-switch 0x7d
        :pswitch_0
    .end packed-switch

    .line 649
    :sswitch_data_0
    .sparse-switch
        0x22 -> :sswitch_3
        0x27 -> :sswitch_2
    .end sparse-switch

    .line 635
    :sswitch_data_1
    .sparse-switch
        0x2c -> :sswitch_0
        0x3b -> :sswitch_0
        0x7d -> :sswitch_1
    .end sparse-switch
.end method

.method private nextLiteral(Z)Ljava/lang/String;
    .locals 6
    .param p1, "assignOffsetsOnly"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 921
    const/4 v0, 0x0

    .line 922
    .local v0, "builder":Ljava/lang/StringBuilder;
    const/4 v3, -0x1

    iput v3, p0, Lcom/cobra/zufflin/json/JsonReader;->valuePos:I

    .line 923
    iput v5, p0, Lcom/cobra/zufflin/json/JsonReader;->valueLength:I

    .line 924
    const/4 v1, 0x0

    .line 928
    .local v1, "i":I
    :cond_0
    :goto_0
    iget v3, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    add-int/2addr v3, v1

    iget v4, p0, Lcom/cobra/zufflin/json/JsonReader;->limit:I

    if-lt v3, v4, :cond_1

    .line 956
    iget-object v3, p0, Lcom/cobra/zufflin/json/JsonReader;->buffer:[C

    array-length v3, v3

    if-ge v1, v3, :cond_2

    .line 957
    add-int/lit8 v3, v1, 0x1

    invoke-direct {p0, v3}, Lcom/cobra/zufflin/json/JsonReader;->fillBuffer(I)Z

    move-result v3

    if-nez v3, :cond_0

    .line 960
    iget-object v3, p0, Lcom/cobra/zufflin/json/JsonReader;->buffer:[C

    iget v4, p0, Lcom/cobra/zufflin/json/JsonReader;->limit:I

    aput-char v5, v3, v4

    .line 979
    :goto_1
    :sswitch_0
    if-eqz p1, :cond_4

    if-nez v0, :cond_4

    .line 980
    iget v3, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    iput v3, p0, Lcom/cobra/zufflin/json/JsonReader;->valuePos:I

    .line 981
    const/4 v2, 0x0

    .line 990
    .local v2, "result":Ljava/lang/String;
    :goto_2
    iget v3, p0, Lcom/cobra/zufflin/json/JsonReader;->valueLength:I

    add-int/2addr v3, v1

    iput v3, p0, Lcom/cobra/zufflin/json/JsonReader;->valueLength:I

    .line 991
    iget v3, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    add-int/2addr v3, v1

    iput v3, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    .line 992
    return-object v2

    .line 929
    .end local v2    # "result":Ljava/lang/String;
    :cond_1
    iget-object v3, p0, Lcom/cobra/zufflin/json/JsonReader;->buffer:[C

    iget v4, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    add-int/2addr v4, v1

    aget-char v3, v3, v4

    sparse-switch v3, :sswitch_data_0

    .line 928
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 935
    :sswitch_1
    invoke-direct {p0}, Lcom/cobra/zufflin/json/JsonReader;->checkLenient()V

    goto :goto_1

    .line 966
    :cond_2
    if-nez v0, :cond_3

    .line 967
    new-instance v0, Ljava/lang/StringBuilder;

    .end local v0    # "builder":Ljava/lang/StringBuilder;
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 969
    .restart local v0    # "builder":Ljava/lang/StringBuilder;
    :cond_3
    iget-object v3, p0, Lcom/cobra/zufflin/json/JsonReader;->buffer:[C

    iget v4, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    invoke-virtual {v0, v3, v4, v1}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 970
    iget v3, p0, Lcom/cobra/zufflin/json/JsonReader;->valueLength:I

    add-int/2addr v3, v1

    iput v3, p0, Lcom/cobra/zufflin/json/JsonReader;->valueLength:I

    .line 971
    iget v3, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    add-int/2addr v3, v1

    iput v3, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    .line 972
    const/4 v1, 0x0

    .line 973
    const/4 v3, 0x1

    invoke-direct {p0, v3}, Lcom/cobra/zufflin/json/JsonReader;->fillBuffer(I)Z

    move-result v3

    if-nez v3, :cond_0

    goto :goto_1

    .line 982
    :cond_4
    iget-boolean v3, p0, Lcom/cobra/zufflin/json/JsonReader;->skipping:Z

    if-eqz v3, :cond_5

    .line 983
    const-string v2, "skipped!"

    .line 984
    .restart local v2    # "result":Ljava/lang/String;
    goto :goto_2

    .end local v2    # "result":Ljava/lang/String;
    :cond_5
    if-nez v0, :cond_6

    .line 985
    iget-object v3, p0, Lcom/cobra/zufflin/json/JsonReader;->stringPool:Lcom/cobra/zufflin/json/StringPool;

    iget-object v4, p0, Lcom/cobra/zufflin/json/JsonReader;->buffer:[C

    iget v5, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    invoke-virtual {v3, v4, v5, v1}, Lcom/cobra/zufflin/json/StringPool;->get([CII)Ljava/lang/String;

    move-result-object v2

    .line 986
    .restart local v2    # "result":Ljava/lang/String;
    goto :goto_2

    .line 987
    .end local v2    # "result":Ljava/lang/String;
    :cond_6
    iget-object v3, p0, Lcom/cobra/zufflin/json/JsonReader;->buffer:[C

    iget v4, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    invoke-virtual {v0, v3, v4, v1}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 988
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .restart local v2    # "result":Ljava/lang/String;
    goto :goto_2

    .line 929
    :sswitch_data_0
    .sparse-switch
        0x9 -> :sswitch_0
        0xa -> :sswitch_0
        0xc -> :sswitch_0
        0xd -> :sswitch_0
        0x20 -> :sswitch_0
        0x23 -> :sswitch_1
        0x2c -> :sswitch_0
        0x2f -> :sswitch_1
        0x3a -> :sswitch_0
        0x3b -> :sswitch_1
        0x3d -> :sswitch_1
        0x5b -> :sswitch_0
        0x5c -> :sswitch_1
        0x5d -> :sswitch_0
        0x7b -> :sswitch_0
        0x7d -> :sswitch_0
    .end sparse-switch
.end method

.method private nextNonWhitespace()I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    .line 778
    :goto_0
    :sswitch_0
    iget v2, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    iget v3, p0, Lcom/cobra/zufflin/json/JsonReader;->limit:I

    if-lt v2, v3, :cond_0

    invoke-direct {p0, v5}, Lcom/cobra/zufflin/json/JsonReader;->fillBuffer(I)Z

    move-result v2

    if-nez v2, :cond_0

    .line 829
    new-instance v2, Ljava/io/EOFException;

    const-string v3, "End of input"

    invoke-direct {v2, v3}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 779
    :cond_0
    iget-object v2, p0, Lcom/cobra/zufflin/json/JsonReader;->buffer:[C

    iget v3, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    aget-char v0, v2, v3

    .line 780
    .local v0, "c":I
    sparse-switch v0, :sswitch_data_0

    .line 825
    :cond_1
    :goto_1
    return v0

    .line 788
    :sswitch_1
    iget v2, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    iget v3, p0, Lcom/cobra/zufflin/json/JsonReader;->limit:I

    if-ne v2, v3, :cond_2

    invoke-direct {p0, v5}, Lcom/cobra/zufflin/json/JsonReader;->fillBuffer(I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 792
    :cond_2
    invoke-direct {p0}, Lcom/cobra/zufflin/json/JsonReader;->checkLenient()V

    .line 793
    iget-object v2, p0, Lcom/cobra/zufflin/json/JsonReader;->buffer:[C

    iget v3, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    aget-char v1, v2, v3

    .line 794
    .local v1, "peek":C
    sparse-switch v1, :sswitch_data_1

    goto :goto_1

    .line 797
    :sswitch_2
    iget v2, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    .line 798
    const-string v2, "*/"

    invoke-direct {p0, v2}, Lcom/cobra/zufflin/json/JsonReader;->skipTo(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 799
    const-string v2, "Unterminated comment"

    invoke-direct {p0, v2}, Lcom/cobra/zufflin/json/JsonReader;->syntaxError(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v2

    throw v2

    .line 801
    :cond_3
    iget v2, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    add-int/lit8 v2, v2, 0x2

    iput v2, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    goto :goto_0

    .line 806
    :sswitch_3
    iget v2, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    .line 807
    invoke-direct {p0}, Lcom/cobra/zufflin/json/JsonReader;->skipToEndOfLine()V

    goto :goto_0

    .line 820
    .end local v1    # "peek":C
    :sswitch_4
    invoke-direct {p0}, Lcom/cobra/zufflin/json/JsonReader;->checkLenient()V

    .line 821
    invoke-direct {p0}, Lcom/cobra/zufflin/json/JsonReader;->skipToEndOfLine()V

    goto :goto_0

    .line 780
    nop

    :sswitch_data_0
    .sparse-switch
        0x9 -> :sswitch_0
        0xa -> :sswitch_0
        0xd -> :sswitch_0
        0x20 -> :sswitch_0
        0x23 -> :sswitch_4
        0x2f -> :sswitch_1
    .end sparse-switch

    .line 794
    :sswitch_data_1
    .sparse-switch
        0x2a -> :sswitch_2
        0x2f -> :sswitch_3
    .end sparse-switch
.end method

.method private nextString(C)Ljava/lang/String;
    .locals 6
    .param p1, "quote"    # C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 876
    const/4 v0, 0x0

    .line 879
    .local v0, "builder":Ljava/lang/StringBuilder;
    :cond_0
    iget v2, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    .line 880
    .local v2, "start":I
    :cond_1
    :goto_0
    iget v3, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    iget v4, p0, Lcom/cobra/zufflin/json/JsonReader;->limit:I

    if-lt v3, v4, :cond_3

    .line 903
    if-nez v0, :cond_2

    .line 904
    new-instance v0, Ljava/lang/StringBuilder;

    .end local v0    # "builder":Ljava/lang/StringBuilder;
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 906
    .restart local v0    # "builder":Ljava/lang/StringBuilder;
    :cond_2
    iget-object v3, p0, Lcom/cobra/zufflin/json/JsonReader;->buffer:[C

    iget v4, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    sub-int/2addr v4, v2

    invoke-virtual {v0, v3, v2, v4}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 907
    const/4 v3, 0x1

    invoke-direct {p0, v3}, Lcom/cobra/zufflin/json/JsonReader;->fillBuffer(I)Z

    move-result v3

    if-nez v3, :cond_0

    .line 909
    const-string v3, "Unterminated string"

    invoke-direct {p0, v3}, Lcom/cobra/zufflin/json/JsonReader;->syntaxError(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v3

    throw v3

    .line 881
    :cond_3
    iget-object v3, p0, Lcom/cobra/zufflin/json/JsonReader;->buffer:[C

    iget v4, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    aget-char v1, v3, v4

    .line 883
    .local v1, "c":I
    if-ne v1, p1, :cond_6

    .line 884
    iget-boolean v3, p0, Lcom/cobra/zufflin/json/JsonReader;->skipping:Z

    if-eqz v3, :cond_4

    .line 885
    const-string v3, "skipped!"

    .line 890
    :goto_1
    return-object v3

    .line 886
    :cond_4
    if-nez v0, :cond_5

    .line 887
    iget-object v3, p0, Lcom/cobra/zufflin/json/JsonReader;->stringPool:Lcom/cobra/zufflin/json/StringPool;

    iget-object v4, p0, Lcom/cobra/zufflin/json/JsonReader;->buffer:[C

    iget v5, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    sub-int/2addr v5, v2

    add-int/lit8 v5, v5, -0x1

    invoke-virtual {v3, v4, v2, v5}, Lcom/cobra/zufflin/json/StringPool;->get([CII)Ljava/lang/String;

    move-result-object v3

    goto :goto_1

    .line 889
    :cond_5
    iget-object v3, p0, Lcom/cobra/zufflin/json/JsonReader;->buffer:[C

    iget v4, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    sub-int/2addr v4, v2

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v0, v3, v2, v4}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 890
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_1

    .line 893
    :cond_6
    const/16 v3, 0x5c

    if-ne v1, v3, :cond_1

    .line 894
    if-nez v0, :cond_7

    .line 895
    new-instance v0, Ljava/lang/StringBuilder;

    .end local v0    # "builder":Ljava/lang/StringBuilder;
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 897
    .restart local v0    # "builder":Ljava/lang/StringBuilder;
    :cond_7
    iget-object v3, p0, Lcom/cobra/zufflin/json/JsonReader;->buffer:[C

    iget v4, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    sub-int/2addr v4, v2

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v0, v3, v2, v4}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 898
    invoke-direct {p0}, Lcom/cobra/zufflin/json/JsonReader;->readEscapeCharacter()C

    move-result v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 899
    iget v2, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    goto :goto_0
.end method

.method private nextValue()Lcom/cobra/zufflin/json/JsonToken;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 691
    invoke-direct {p0}, Lcom/cobra/zufflin/json/JsonReader;->nextNonWhitespace()I

    move-result v0

    .line 692
    .local v0, "c":I
    sparse-switch v0, :sswitch_data_0

    .line 708
    iget v1, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    .line 709
    invoke-direct {p0}, Lcom/cobra/zufflin/json/JsonReader;->readLiteral()Lcom/cobra/zufflin/json/JsonToken;

    move-result-object v1

    :goto_0
    return-object v1

    .line 694
    :sswitch_0
    sget-object v1, Lcom/cobra/zufflin/json/JsonScope;->EMPTY_OBJECT:Lcom/cobra/zufflin/json/JsonScope;

    invoke-direct {p0, v1}, Lcom/cobra/zufflin/json/JsonReader;->push(Lcom/cobra/zufflin/json/JsonScope;)V

    .line 695
    sget-object v1, Lcom/cobra/zufflin/json/JsonToken;->BEGIN_OBJECT:Lcom/cobra/zufflin/json/JsonToken;

    iput-object v1, p0, Lcom/cobra/zufflin/json/JsonReader;->token:Lcom/cobra/zufflin/json/JsonToken;

    goto :goto_0

    .line 698
    :sswitch_1
    sget-object v1, Lcom/cobra/zufflin/json/JsonScope;->EMPTY_ARRAY:Lcom/cobra/zufflin/json/JsonScope;

    invoke-direct {p0, v1}, Lcom/cobra/zufflin/json/JsonReader;->push(Lcom/cobra/zufflin/json/JsonScope;)V

    .line 699
    sget-object v1, Lcom/cobra/zufflin/json/JsonToken;->BEGIN_ARRAY:Lcom/cobra/zufflin/json/JsonToken;

    iput-object v1, p0, Lcom/cobra/zufflin/json/JsonReader;->token:Lcom/cobra/zufflin/json/JsonToken;

    goto :goto_0

    .line 702
    :sswitch_2
    invoke-direct {p0}, Lcom/cobra/zufflin/json/JsonReader;->checkLenient()V

    .line 704
    :sswitch_3
    int-to-char v1, v0

    invoke-direct {p0, v1}, Lcom/cobra/zufflin/json/JsonReader;->nextString(C)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/cobra/zufflin/json/JsonReader;->value:Ljava/lang/String;

    .line 705
    sget-object v1, Lcom/cobra/zufflin/json/JsonToken;->STRING:Lcom/cobra/zufflin/json/JsonToken;

    iput-object v1, p0, Lcom/cobra/zufflin/json/JsonReader;->token:Lcom/cobra/zufflin/json/JsonToken;

    goto :goto_0

    .line 692
    nop

    :sswitch_data_0
    .sparse-switch
        0x22 -> :sswitch_3
        0x27 -> :sswitch_2
        0x5b -> :sswitch_1
        0x7b -> :sswitch_0
    .end sparse-switch
.end method

.method private objectValue()Lcom/cobra/zufflin/json/JsonToken;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 673
    invoke-direct {p0}, Lcom/cobra/zufflin/json/JsonReader;->nextNonWhitespace()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 683
    :pswitch_0
    const-string v0, "Expected \':\'"

    invoke-direct {p0, v0}, Lcom/cobra/zufflin/json/JsonReader;->syntaxError(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    .line 677
    :pswitch_1
    invoke-direct {p0}, Lcom/cobra/zufflin/json/JsonReader;->checkLenient()V

    .line 678
    iget v0, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    iget v1, p0, Lcom/cobra/zufflin/json/JsonReader;->limit:I

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/cobra/zufflin/json/JsonReader;->fillBuffer(I)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/cobra/zufflin/json/JsonReader;->buffer:[C

    iget v1, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    aget-char v0, v0, v1

    const/16 v1, 0x3e

    if-ne v0, v1, :cond_1

    .line 679
    iget v0, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    .line 686
    :cond_1
    :pswitch_2
    sget-object v0, Lcom/cobra/zufflin/json/JsonScope;->NONEMPTY_OBJECT:Lcom/cobra/zufflin/json/JsonScope;

    invoke-direct {p0, v0}, Lcom/cobra/zufflin/json/JsonReader;->replaceTop(Lcom/cobra/zufflin/json/JsonScope;)V

    .line 687
    invoke-direct {p0}, Lcom/cobra/zufflin/json/JsonReader;->nextValue()Lcom/cobra/zufflin/json/JsonToken;

    move-result-object v0

    return-object v0

    .line 673
    :pswitch_data_0
    .packed-switch 0x3a
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private peekStack()Lcom/cobra/zufflin/json/JsonScope;
    .locals 2

    .prologue
    .line 563
    iget-object v0, p0, Lcom/cobra/zufflin/json/JsonReader;->stack:Ljava/util/List;

    iget-object v1, p0, Lcom/cobra/zufflin/json/JsonReader;->stack:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/cobra/zufflin/json/JsonScope;

    return-object v0
.end method

.method private pop()Lcom/cobra/zufflin/json/JsonScope;
    .locals 2

    .prologue
    .line 567
    iget-object v0, p0, Lcom/cobra/zufflin/json/JsonReader;->stack:Ljava/util/List;

    iget-object v1, p0, Lcom/cobra/zufflin/json/JsonReader;->stack:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/cobra/zufflin/json/JsonScope;

    return-object v0
.end method

.method private push(Lcom/cobra/zufflin/json/JsonScope;)V
    .locals 1
    .param p1, "newTop"    # Lcom/cobra/zufflin/json/JsonScope;

    .prologue
    .line 571
    iget-object v0, p0, Lcom/cobra/zufflin/json/JsonReader;->stack:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 572
    return-void
.end method

.method private readEscapeCharacter()C
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x4

    .line 1009
    iget v2, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    iget v3, p0, Lcom/cobra/zufflin/json/JsonReader;->limit:I

    if-ne v2, v3, :cond_0

    const/4 v2, 0x1

    invoke-direct {p0, v2}, Lcom/cobra/zufflin/json/JsonReader;->fillBuffer(I)Z

    move-result v2

    if-nez v2, :cond_0

    .line 1010
    const-string v2, "Unterminated escape sequence"

    invoke-direct {p0, v2}, Lcom/cobra/zufflin/json/JsonReader;->syntaxError(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v2

    throw v2

    .line 1013
    :cond_0
    iget-object v2, p0, Lcom/cobra/zufflin/json/JsonReader;->buffer:[C

    iget v3, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    aget-char v0, v2, v3

    .line 1014
    .local v0, "escaped":C
    sparse-switch v0, :sswitch_data_0

    .line 1042
    .end local v0    # "escaped":C
    :goto_0
    return v0

    .line 1016
    .restart local v0    # "escaped":C
    :sswitch_0
    iget v2, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    add-int/lit8 v2, v2, 0x4

    iget v3, p0, Lcom/cobra/zufflin/json/JsonReader;->limit:I

    if-le v2, v3, :cond_1

    invoke-direct {p0, v5}, Lcom/cobra/zufflin/json/JsonReader;->fillBuffer(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 1017
    const-string v2, "Unterminated escape sequence"

    invoke-direct {p0, v2}, Lcom/cobra/zufflin/json/JsonReader;->syntaxError(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v2

    throw v2

    .line 1019
    :cond_1
    iget-object v2, p0, Lcom/cobra/zufflin/json/JsonReader;->stringPool:Lcom/cobra/zufflin/json/StringPool;

    iget-object v3, p0, Lcom/cobra/zufflin/json/JsonReader;->buffer:[C

    iget v4, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    invoke-virtual {v2, v3, v4, v5}, Lcom/cobra/zufflin/json/StringPool;->get([CII)Ljava/lang/String;

    move-result-object v1

    .line 1020
    .local v1, "hex":Ljava/lang/String;
    iget v2, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    add-int/lit8 v2, v2, 0x4

    iput v2, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    .line 1021
    const/16 v2, 0x10

    invoke-static {v1, v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v2

    int-to-char v0, v2

    goto :goto_0

    .line 1024
    .end local v1    # "hex":Ljava/lang/String;
    :sswitch_1
    const/16 v0, 0x9

    goto :goto_0

    .line 1027
    :sswitch_2
    const/16 v0, 0x8

    goto :goto_0

    .line 1030
    :sswitch_3
    const/16 v0, 0xa

    goto :goto_0

    .line 1033
    :sswitch_4
    const/16 v0, 0xd

    goto :goto_0

    .line 1036
    :sswitch_5
    const/16 v0, 0xc

    goto :goto_0

    .line 1014
    nop

    :sswitch_data_0
    .sparse-switch
        0x62 -> :sswitch_2
        0x66 -> :sswitch_5
        0x6e -> :sswitch_3
        0x72 -> :sswitch_4
        0x74 -> :sswitch_1
        0x75 -> :sswitch_0
    .end sparse-switch
.end method

.method private readLiteral()Lcom/cobra/zufflin/json/JsonToken;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1050
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/cobra/zufflin/json/JsonReader;->nextLiteral(Z)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/cobra/zufflin/json/JsonReader;->value:Ljava/lang/String;

    .line 1051
    iget v0, p0, Lcom/cobra/zufflin/json/JsonReader;->valueLength:I

    if-nez v0, :cond_0

    .line 1052
    const-string v0, "Expected literal value"

    invoke-direct {p0, v0}, Lcom/cobra/zufflin/json/JsonReader;->syntaxError(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    .line 1054
    :cond_0
    invoke-direct {p0}, Lcom/cobra/zufflin/json/JsonReader;->decodeLiteral()Lcom/cobra/zufflin/json/JsonToken;

    move-result-object v0

    iput-object v0, p0, Lcom/cobra/zufflin/json/JsonReader;->token:Lcom/cobra/zufflin/json/JsonToken;

    .line 1055
    iget-object v0, p0, Lcom/cobra/zufflin/json/JsonReader;->token:Lcom/cobra/zufflin/json/JsonToken;

    sget-object v1, Lcom/cobra/zufflin/json/JsonToken;->STRING:Lcom/cobra/zufflin/json/JsonToken;

    if-ne v0, v1, :cond_1

    .line 1056
    invoke-direct {p0}, Lcom/cobra/zufflin/json/JsonReader;->checkLenient()V

    .line 1058
    :cond_1
    iget-object v0, p0, Lcom/cobra/zufflin/json/JsonReader;->token:Lcom/cobra/zufflin/json/JsonToken;

    return-object v0
.end method

.method private replaceTop(Lcom/cobra/zufflin/json/JsonScope;)V
    .locals 2
    .param p1, "newTop"    # Lcom/cobra/zufflin/json/JsonScope;

    .prologue
    .line 578
    iget-object v0, p0, Lcom/cobra/zufflin/json/JsonReader;->stack:Ljava/util/List;

    iget-object v1, p0, Lcom/cobra/zufflin/json/JsonReader;->stack:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1, p1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 579
    return-void
.end method

.method private skipTo(Ljava/lang/String;)Z
    .locals 3
    .param p1, "toFind"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 854
    :goto_0
    iget v1, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v1, v2

    iget v2, p0, Lcom/cobra/zufflin/json/JsonReader;->limit:I

    if-le v1, v2, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-direct {p0, v1}, Lcom/cobra/zufflin/json/JsonReader;->fillBuffer(I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 862
    const/4 v1, 0x0

    :goto_1
    return v1

    .line 855
    :cond_0
    const/4 v0, 0x0

    .local v0, "c":I
    :goto_2
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-lt v0, v1, :cond_1

    .line 860
    const/4 v1, 0x1

    goto :goto_1

    .line 856
    :cond_1
    iget-object v1, p0, Lcom/cobra/zufflin/json/JsonReader;->buffer:[C

    iget v2, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    add-int/2addr v2, v0

    aget-char v1, v1, v2

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-eq v1, v2, :cond_2

    .line 854
    iget v1, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    goto :goto_0

    .line 855
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_2
.end method

.method private skipToEndOfLine()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 844
    :cond_0
    iget v1, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    iget v2, p0, Lcom/cobra/zufflin/json/JsonReader;->limit:I

    if-lt v1, v2, :cond_2

    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lcom/cobra/zufflin/json/JsonReader;->fillBuffer(I)Z

    move-result v1

    if-nez v1, :cond_2

    .line 850
    :cond_1
    :goto_0
    return-void

    .line 845
    :cond_2
    iget-object v1, p0, Lcom/cobra/zufflin/json/JsonReader;->buffer:[C

    iget v2, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/cobra/zufflin/json/JsonReader;->pos:I

    aget-char v0, v1, v2

    .line 846
    .local v0, "c":C
    const/16 v1, 0xd

    if-eq v0, v1, :cond_1

    const/16 v1, 0xa

    if-ne v0, v1, :cond_0

    goto :goto_0
.end method

.method private syntaxError(Ljava/lang/String;)Ljava/io/IOException;
    .locals 3
    .param p1, "message"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1155
    new-instance v0, Lcom/cobra/zufflin/json/MalformedJsonException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1156
    const-string v2, " at line "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-direct {p0}, Lcom/cobra/zufflin/json/JsonReader;->getLineNumber()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " column "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-direct {p0}, Lcom/cobra/zufflin/json/JsonReader;->getColumnNumber()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1155
    invoke-direct {v0, v1}, Lcom/cobra/zufflin/json/MalformedJsonException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public beginArray()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 276
    sget-object v0, Lcom/cobra/zufflin/json/JsonToken;->BEGIN_ARRAY:Lcom/cobra/zufflin/json/JsonToken;

    invoke-direct {p0, v0}, Lcom/cobra/zufflin/json/JsonReader;->expect(Lcom/cobra/zufflin/json/JsonToken;)V

    .line 277
    return-void
.end method

.method public beginObject()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 292
    sget-object v0, Lcom/cobra/zufflin/json/JsonToken;->BEGIN_OBJECT:Lcom/cobra/zufflin/json/JsonToken;

    invoke-direct {p0, v0}, Lcom/cobra/zufflin/json/JsonReader;->expect(Lcom/cobra/zufflin/json/JsonToken;)V

    .line 293
    return-void
.end method

.method public close()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 533
    iput-object v0, p0, Lcom/cobra/zufflin/json/JsonReader;->value:Ljava/lang/String;

    .line 534
    iput-object v0, p0, Lcom/cobra/zufflin/json/JsonReader;->token:Lcom/cobra/zufflin/json/JsonToken;

    .line 535
    iget-object v0, p0, Lcom/cobra/zufflin/json/JsonReader;->stack:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 536
    iget-object v0, p0, Lcom/cobra/zufflin/json/JsonReader;->stack:Ljava/util/List;

    sget-object v1, Lcom/cobra/zufflin/json/JsonScope;->CLOSED:Lcom/cobra/zufflin/json/JsonScope;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 537
    iget-object v0, p0, Lcom/cobra/zufflin/json/JsonReader;->in:Ljava/io/Reader;

    invoke-virtual {v0}, Ljava/io/Reader;->close()V

    .line 538
    return-void
.end method

.method public endArray()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 284
    sget-object v0, Lcom/cobra/zufflin/json/JsonToken;->END_ARRAY:Lcom/cobra/zufflin/json/JsonToken;

    invoke-direct {p0, v0}, Lcom/cobra/zufflin/json/JsonReader;->expect(Lcom/cobra/zufflin/json/JsonToken;)V

    .line 285
    return-void
.end method

.method public endObject()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 300
    sget-object v0, Lcom/cobra/zufflin/json/JsonToken;->END_OBJECT:Lcom/cobra/zufflin/json/JsonToken;

    invoke-direct {p0, v0}, Lcom/cobra/zufflin/json/JsonReader;->expect(Lcom/cobra/zufflin/json/JsonToken;)V

    .line 301
    return-void
.end method

.method public hasNext()Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 318
    invoke-virtual {p0}, Lcom/cobra/zufflin/json/JsonReader;->peek()Lcom/cobra/zufflin/json/JsonToken;

    .line 319
    iget-object v0, p0, Lcom/cobra/zufflin/json/JsonReader;->token:Lcom/cobra/zufflin/json/JsonToken;

    sget-object v1, Lcom/cobra/zufflin/json/JsonToken;->END_OBJECT:Lcom/cobra/zufflin/json/JsonToken;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/cobra/zufflin/json/JsonReader;->token:Lcom/cobra/zufflin/json/JsonToken;

    sget-object v1, Lcom/cobra/zufflin/json/JsonToken;->END_ARRAY:Lcom/cobra/zufflin/json/JsonToken;

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isLenient()Z
    .locals 1

    .prologue
    .line 268
    iget-boolean v0, p0, Lcom/cobra/zufflin/json/JsonReader;->lenient:Z

    return v0
.end method

.method public nextBoolean()Z
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 423
    invoke-virtual {p0}, Lcom/cobra/zufflin/json/JsonReader;->peek()Lcom/cobra/zufflin/json/JsonToken;

    .line 424
    iget-object v1, p0, Lcom/cobra/zufflin/json/JsonReader;->token:Lcom/cobra/zufflin/json/JsonToken;

    sget-object v2, Lcom/cobra/zufflin/json/JsonToken;->BOOLEAN:Lcom/cobra/zufflin/json/JsonToken;

    if-eq v1, v2, :cond_0

    .line 425
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Expected a boolean but was "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/cobra/zufflin/json/JsonReader;->token:Lcom/cobra/zufflin/json/JsonToken;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 428
    :cond_0
    iget-object v1, p0, Lcom/cobra/zufflin/json/JsonReader;->value:Ljava/lang/String;

    const-string v2, "true"

    if-ne v1, v2, :cond_1

    const/4 v0, 0x1

    .line 429
    .local v0, "result":Z
    :goto_0
    invoke-direct {p0}, Lcom/cobra/zufflin/json/JsonReader;->advance()Lcom/cobra/zufflin/json/JsonToken;

    .line 430
    return v0

    .line 428
    .end local v0    # "result":Z
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public nextDouble()D
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 457
    invoke-virtual {p0}, Lcom/cobra/zufflin/json/JsonReader;->peek()Lcom/cobra/zufflin/json/JsonToken;

    .line 458
    iget-object v2, p0, Lcom/cobra/zufflin/json/JsonReader;->token:Lcom/cobra/zufflin/json/JsonToken;

    sget-object v3, Lcom/cobra/zufflin/json/JsonToken;->STRING:Lcom/cobra/zufflin/json/JsonToken;

    if-eq v2, v3, :cond_0

    iget-object v2, p0, Lcom/cobra/zufflin/json/JsonReader;->token:Lcom/cobra/zufflin/json/JsonToken;

    sget-object v3, Lcom/cobra/zufflin/json/JsonToken;->NUMBER:Lcom/cobra/zufflin/json/JsonToken;

    if-eq v2, v3, :cond_0

    .line 459
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Expected a double but was "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/cobra/zufflin/json/JsonReader;->token:Lcom/cobra/zufflin/json/JsonToken;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 462
    :cond_0
    iget-object v2, p0, Lcom/cobra/zufflin/json/JsonReader;->value:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v0

    .line 463
    .local v0, "result":D
    invoke-direct {p0}, Lcom/cobra/zufflin/json/JsonReader;->advance()Lcom/cobra/zufflin/json/JsonToken;

    .line 464
    return-wide v0
.end method

.method public nextInt()I
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 509
    invoke-virtual {p0}, Lcom/cobra/zufflin/json/JsonReader;->peek()Lcom/cobra/zufflin/json/JsonToken;

    .line 510
    iget-object v4, p0, Lcom/cobra/zufflin/json/JsonReader;->token:Lcom/cobra/zufflin/json/JsonToken;

    sget-object v5, Lcom/cobra/zufflin/json/JsonToken;->STRING:Lcom/cobra/zufflin/json/JsonToken;

    if-eq v4, v5, :cond_0

    iget-object v4, p0, Lcom/cobra/zufflin/json/JsonReader;->token:Lcom/cobra/zufflin/json/JsonToken;

    sget-object v5, Lcom/cobra/zufflin/json/JsonToken;->NUMBER:Lcom/cobra/zufflin/json/JsonToken;

    if-eq v4, v5, :cond_0

    .line 511
    new-instance v4, Ljava/lang/IllegalStateException;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "Expected an int but was "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v6, p0, Lcom/cobra/zufflin/json/JsonReader;->token:Lcom/cobra/zufflin/json/JsonToken;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 516
    :cond_0
    :try_start_0
    iget-object v4, p0, Lcom/cobra/zufflin/json/JsonReader;->value:Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    .line 525
    .local v3, "result":I
    :cond_1
    invoke-direct {p0}, Lcom/cobra/zufflin/json/JsonReader;->advance()Lcom/cobra/zufflin/json/JsonToken;

    .line 526
    return v3

    .line 517
    .end local v3    # "result":I
    :catch_0
    move-exception v2

    .line 518
    .local v2, "ignored":Ljava/lang/NumberFormatException;
    iget-object v4, p0, Lcom/cobra/zufflin/json/JsonReader;->value:Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v0

    .line 519
    .local v0, "asDouble":D
    double-to-int v3, v0

    .line 520
    .restart local v3    # "result":I
    int-to-double v4, v3

    cmpl-double v4, v4, v0

    if-eqz v4, :cond_1

    .line 521
    new-instance v4, Ljava/lang/NumberFormatException;

    iget-object v5, p0, Lcom/cobra/zufflin/json/JsonReader;->value:Ljava/lang/String;

    invoke-direct {v4, v5}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method public nextLong()J
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 478
    invoke-virtual {p0}, Lcom/cobra/zufflin/json/JsonReader;->peek()Lcom/cobra/zufflin/json/JsonToken;

    .line 479
    iget-object v5, p0, Lcom/cobra/zufflin/json/JsonReader;->token:Lcom/cobra/zufflin/json/JsonToken;

    sget-object v6, Lcom/cobra/zufflin/json/JsonToken;->STRING:Lcom/cobra/zufflin/json/JsonToken;

    if-eq v5, v6, :cond_0

    iget-object v5, p0, Lcom/cobra/zufflin/json/JsonReader;->token:Lcom/cobra/zufflin/json/JsonToken;

    sget-object v6, Lcom/cobra/zufflin/json/JsonToken;->NUMBER:Lcom/cobra/zufflin/json/JsonToken;

    if-eq v5, v6, :cond_0

    .line 480
    new-instance v5, Ljava/lang/IllegalStateException;

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "Expected a long but was "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v7, p0, Lcom/cobra/zufflin/json/JsonReader;->token:Lcom/cobra/zufflin/json/JsonToken;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 485
    :cond_0
    :try_start_0
    iget-object v5, p0, Lcom/cobra/zufflin/json/JsonReader;->value:Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v3

    .line 494
    .local v3, "result":J
    :cond_1
    invoke-direct {p0}, Lcom/cobra/zufflin/json/JsonReader;->advance()Lcom/cobra/zufflin/json/JsonToken;

    .line 495
    return-wide v3

    .line 486
    .end local v3    # "result":J
    :catch_0
    move-exception v2

    .line 487
    .local v2, "ignored":Ljava/lang/NumberFormatException;
    iget-object v5, p0, Lcom/cobra/zufflin/json/JsonReader;->value:Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v0

    .line 488
    .local v0, "asDouble":D
    double-to-long v3, v0

    .line 489
    .restart local v3    # "result":J
    long-to-double v5, v3

    cmpl-double v5, v5, v0

    if-eqz v5, :cond_1

    .line 490
    new-instance v5, Ljava/lang/NumberFormatException;

    iget-object v6, p0, Lcom/cobra/zufflin/json/JsonReader;->value:Ljava/lang/String;

    invoke-direct {v5, v6}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v5
.end method

.method public nextName()Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 387
    invoke-virtual {p0}, Lcom/cobra/zufflin/json/JsonReader;->peek()Lcom/cobra/zufflin/json/JsonToken;

    .line 388
    iget-object v1, p0, Lcom/cobra/zufflin/json/JsonReader;->token:Lcom/cobra/zufflin/json/JsonToken;

    sget-object v2, Lcom/cobra/zufflin/json/JsonToken;->NAME:Lcom/cobra/zufflin/json/JsonToken;

    if-eq v1, v2, :cond_0

    .line 389
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Expected a name but was "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/cobra/zufflin/json/JsonReader;->peek()Lcom/cobra/zufflin/json/JsonToken;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 391
    :cond_0
    iget-object v0, p0, Lcom/cobra/zufflin/json/JsonReader;->name:Ljava/lang/String;

    .line 392
    .local v0, "result":Ljava/lang/String;
    invoke-direct {p0}, Lcom/cobra/zufflin/json/JsonReader;->advance()Lcom/cobra/zufflin/json/JsonToken;

    .line 393
    return-object v0
.end method

.method public nextNull()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 441
    invoke-virtual {p0}, Lcom/cobra/zufflin/json/JsonReader;->peek()Lcom/cobra/zufflin/json/JsonToken;

    .line 442
    iget-object v0, p0, Lcom/cobra/zufflin/json/JsonReader;->token:Lcom/cobra/zufflin/json/JsonToken;

    sget-object v1, Lcom/cobra/zufflin/json/JsonToken;->NULL:Lcom/cobra/zufflin/json/JsonToken;

    if-eq v0, v1, :cond_0

    .line 443
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Expected null but was "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/cobra/zufflin/json/JsonReader;->token:Lcom/cobra/zufflin/json/JsonToken;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 446
    :cond_0
    invoke-direct {p0}, Lcom/cobra/zufflin/json/JsonReader;->advance()Lcom/cobra/zufflin/json/JsonToken;

    .line 447
    return-void
.end method

.method public nextString()Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 405
    invoke-virtual {p0}, Lcom/cobra/zufflin/json/JsonReader;->peek()Lcom/cobra/zufflin/json/JsonToken;

    .line 406
    iget-object v1, p0, Lcom/cobra/zufflin/json/JsonReader;->token:Lcom/cobra/zufflin/json/JsonToken;

    sget-object v2, Lcom/cobra/zufflin/json/JsonToken;->STRING:Lcom/cobra/zufflin/json/JsonToken;

    if-eq v1, v2, :cond_0

    iget-object v1, p0, Lcom/cobra/zufflin/json/JsonReader;->token:Lcom/cobra/zufflin/json/JsonToken;

    sget-object v2, Lcom/cobra/zufflin/json/JsonToken;->NUMBER:Lcom/cobra/zufflin/json/JsonToken;

    if-eq v1, v2, :cond_0

    .line 407
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Expected a string but was "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/cobra/zufflin/json/JsonReader;->peek()Lcom/cobra/zufflin/json/JsonToken;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 410
    :cond_0
    iget-object v0, p0, Lcom/cobra/zufflin/json/JsonReader;->value:Ljava/lang/String;

    .line 411
    .local v0, "result":Ljava/lang/String;
    invoke-direct {p0}, Lcom/cobra/zufflin/json/JsonReader;->advance()Lcom/cobra/zufflin/json/JsonToken;

    .line 412
    return-object v0
.end method

.method public peek()Lcom/cobra/zufflin/json/JsonToken;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 326
    iget-object v3, p0, Lcom/cobra/zufflin/json/JsonReader;->token:Lcom/cobra/zufflin/json/JsonToken;

    if-eqz v3, :cond_1

    .line 327
    iget-object v1, p0, Lcom/cobra/zufflin/json/JsonReader;->token:Lcom/cobra/zufflin/json/JsonToken;

    .line 357
    :cond_0
    :goto_0
    return-object v1

    .line 330
    :cond_1
    invoke-static {}, Lcom/cobra/zufflin/json/JsonReader;->$SWITCH_TABLE$com$cobra$zufflin$json$JsonScope()[I

    move-result-object v3

    invoke-direct {p0}, Lcom/cobra/zufflin/json/JsonReader;->peekStack()Lcom/cobra/zufflin/json/JsonScope;

    move-result-object v4

    invoke-virtual {v4}, Lcom/cobra/zufflin/json/JsonScope;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_0

    .line 362
    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3}, Ljava/lang/AssertionError;-><init>()V

    throw v3

    .line 332
    :pswitch_0
    sget-object v3, Lcom/cobra/zufflin/json/JsonScope;->NONEMPTY_DOCUMENT:Lcom/cobra/zufflin/json/JsonScope;

    invoke-direct {p0, v3}, Lcom/cobra/zufflin/json/JsonReader;->replaceTop(Lcom/cobra/zufflin/json/JsonScope;)V

    .line 333
    invoke-direct {p0}, Lcom/cobra/zufflin/json/JsonReader;->nextValue()Lcom/cobra/zufflin/json/JsonToken;

    move-result-object v1

    .line 334
    .local v1, "firstToken":Lcom/cobra/zufflin/json/JsonToken;
    iget-boolean v3, p0, Lcom/cobra/zufflin/json/JsonReader;->lenient:Z

    if-nez v3, :cond_0

    iget-object v3, p0, Lcom/cobra/zufflin/json/JsonReader;->token:Lcom/cobra/zufflin/json/JsonToken;

    sget-object v4, Lcom/cobra/zufflin/json/JsonToken;->BEGIN_ARRAY:Lcom/cobra/zufflin/json/JsonToken;

    if-eq v3, v4, :cond_0

    iget-object v3, p0, Lcom/cobra/zufflin/json/JsonReader;->token:Lcom/cobra/zufflin/json/JsonToken;

    sget-object v4, Lcom/cobra/zufflin/json/JsonToken;->BEGIN_OBJECT:Lcom/cobra/zufflin/json/JsonToken;

    if-eq v3, v4, :cond_0

    .line 335
    new-instance v3, Ljava/io/IOException;

    .line 336
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Expected JSON document to start with \'[\' or \'{\' but was "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v5, p0, Lcom/cobra/zufflin/json/JsonReader;->token:Lcom/cobra/zufflin/json/JsonToken;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 335
    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 340
    .end local v1    # "firstToken":Lcom/cobra/zufflin/json/JsonToken;
    :pswitch_1
    invoke-direct {p0, v6}, Lcom/cobra/zufflin/json/JsonReader;->nextInArray(Z)Lcom/cobra/zufflin/json/JsonToken;

    move-result-object v1

    goto :goto_0

    .line 342
    :pswitch_2
    invoke-direct {p0, v5}, Lcom/cobra/zufflin/json/JsonReader;->nextInArray(Z)Lcom/cobra/zufflin/json/JsonToken;

    move-result-object v1

    goto :goto_0

    .line 344
    :pswitch_3
    invoke-direct {p0, v6}, Lcom/cobra/zufflin/json/JsonReader;->nextInObject(Z)Lcom/cobra/zufflin/json/JsonToken;

    move-result-object v1

    goto :goto_0

    .line 346
    :pswitch_4
    invoke-direct {p0}, Lcom/cobra/zufflin/json/JsonReader;->objectValue()Lcom/cobra/zufflin/json/JsonToken;

    move-result-object v1

    goto :goto_0

    .line 348
    :pswitch_5
    invoke-direct {p0, v5}, Lcom/cobra/zufflin/json/JsonReader;->nextInObject(Z)Lcom/cobra/zufflin/json/JsonToken;

    move-result-object v1

    goto :goto_0

    .line 351
    :pswitch_6
    :try_start_0
    invoke-direct {p0}, Lcom/cobra/zufflin/json/JsonReader;->nextValue()Lcom/cobra/zufflin/json/JsonToken;

    move-result-object v2

    .line 352
    .local v2, "token":Lcom/cobra/zufflin/json/JsonToken;
    iget-boolean v3, p0, Lcom/cobra/zufflin/json/JsonReader;->lenient:Z

    if-eqz v3, :cond_2

    move-object v1, v2

    .line 353
    goto :goto_0

    .line 355
    :cond_2
    const-string v3, "Expected EOF"

    invoke-direct {p0, v3}, Lcom/cobra/zufflin/json/JsonReader;->syntaxError(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v3

    throw v3
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0

    .line 356
    .end local v2    # "token":Lcom/cobra/zufflin/json/JsonToken;
    :catch_0
    move-exception v0

    .line 357
    .local v0, "e":Ljava/io/EOFException;
    sget-object v1, Lcom/cobra/zufflin/json/JsonToken;->END_DOCUMENT:Lcom/cobra/zufflin/json/JsonToken;

    iput-object v1, p0, Lcom/cobra/zufflin/json/JsonReader;->token:Lcom/cobra/zufflin/json/JsonToken;

    goto :goto_0

    .line 360
    .end local v0    # "e":Ljava/io/EOFException;
    :pswitch_7
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "JsonReader is closed"

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 330
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_0
        :pswitch_6
        :pswitch_7
    .end packed-switch
.end method

.method public setLenient(Z)V
    .locals 0
    .param p1, "lenient"    # Z

    .prologue
    .line 261
    iput-boolean p1, p0, Lcom/cobra/zufflin/json/JsonReader;->lenient:Z

    .line 262
    return-void
.end method

.method public skipValue()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 546
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/cobra/zufflin/json/JsonReader;->skipping:Z

    .line 548
    const/4 v0, 0x0

    .line 550
    .local v0, "count":I
    :cond_0
    :try_start_0
    invoke-direct {p0}, Lcom/cobra/zufflin/json/JsonReader;->advance()Lcom/cobra/zufflin/json/JsonToken;

    move-result-object v1

    .line 551
    .local v1, "token":Lcom/cobra/zufflin/json/JsonToken;
    sget-object v2, Lcom/cobra/zufflin/json/JsonToken;->BEGIN_ARRAY:Lcom/cobra/zufflin/json/JsonToken;

    if-eq v1, v2, :cond_1

    sget-object v2, Lcom/cobra/zufflin/json/JsonToken;->BEGIN_OBJECT:Lcom/cobra/zufflin/json/JsonToken;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-ne v1, v2, :cond_3

    .line 552
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 556
    :cond_2
    :goto_0
    if-nez v0, :cond_0

    .line 558
    iput-boolean v3, p0, Lcom/cobra/zufflin/json/JsonReader;->skipping:Z

    .line 560
    return-void

    .line 553
    :cond_3
    :try_start_1
    sget-object v2, Lcom/cobra/zufflin/json/JsonToken;->END_ARRAY:Lcom/cobra/zufflin/json/JsonToken;

    if-eq v1, v2, :cond_4

    sget-object v2, Lcom/cobra/zufflin/json/JsonToken;->END_OBJECT:Lcom/cobra/zufflin/json/JsonToken;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-ne v1, v2, :cond_2

    .line 554
    :cond_4
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 557
    .end local v1    # "token":Lcom/cobra/zufflin/json/JsonToken;
    :catchall_0
    move-exception v2

    .line 558
    iput-boolean v3, p0, Lcom/cobra/zufflin/json/JsonReader;->skipping:Z

    .line 559
    throw v2
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 996
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, " near "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-direct {p0}, Lcom/cobra/zufflin/json/JsonReader;->getSnippet()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
