.class public final enum Lcom/cobra/zufflin/json/JsonToken;
.super Ljava/lang/Enum;
.source "JsonToken.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/cobra/zufflin/json/JsonToken;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum BEGIN_ARRAY:Lcom/cobra/zufflin/json/JsonToken;

.field public static final enum BEGIN_OBJECT:Lcom/cobra/zufflin/json/JsonToken;

.field public static final enum BOOLEAN:Lcom/cobra/zufflin/json/JsonToken;

.field public static final enum END_ARRAY:Lcom/cobra/zufflin/json/JsonToken;

.field public static final enum END_DOCUMENT:Lcom/cobra/zufflin/json/JsonToken;

.field public static final enum END_OBJECT:Lcom/cobra/zufflin/json/JsonToken;

.field private static final synthetic ENUM$VALUES:[Lcom/cobra/zufflin/json/JsonToken;

.field public static final enum NAME:Lcom/cobra/zufflin/json/JsonToken;

.field public static final enum NULL:Lcom/cobra/zufflin/json/JsonToken;

.field public static final enum NUMBER:Lcom/cobra/zufflin/json/JsonToken;

.field public static final enum STRING:Lcom/cobra/zufflin/json/JsonToken;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 24
    new-instance v0, Lcom/cobra/zufflin/json/JsonToken;

    const-string v1, "BEGIN_ARRAY"

    invoke-direct {v0, v1, v3}, Lcom/cobra/zufflin/json/JsonToken;-><init>(Ljava/lang/String;I)V

    .line 28
    sput-object v0, Lcom/cobra/zufflin/json/JsonToken;->BEGIN_ARRAY:Lcom/cobra/zufflin/json/JsonToken;

    .line 30
    new-instance v0, Lcom/cobra/zufflin/json/JsonToken;

    const-string v1, "END_ARRAY"

    invoke-direct {v0, v1, v4}, Lcom/cobra/zufflin/json/JsonToken;-><init>(Ljava/lang/String;I)V

    .line 34
    sput-object v0, Lcom/cobra/zufflin/json/JsonToken;->END_ARRAY:Lcom/cobra/zufflin/json/JsonToken;

    .line 36
    new-instance v0, Lcom/cobra/zufflin/json/JsonToken;

    const-string v1, "BEGIN_OBJECT"

    invoke-direct {v0, v1, v5}, Lcom/cobra/zufflin/json/JsonToken;-><init>(Ljava/lang/String;I)V

    .line 40
    sput-object v0, Lcom/cobra/zufflin/json/JsonToken;->BEGIN_OBJECT:Lcom/cobra/zufflin/json/JsonToken;

    .line 42
    new-instance v0, Lcom/cobra/zufflin/json/JsonToken;

    const-string v1, "END_OBJECT"

    invoke-direct {v0, v1, v6}, Lcom/cobra/zufflin/json/JsonToken;-><init>(Ljava/lang/String;I)V

    .line 46
    sput-object v0, Lcom/cobra/zufflin/json/JsonToken;->END_OBJECT:Lcom/cobra/zufflin/json/JsonToken;

    .line 48
    new-instance v0, Lcom/cobra/zufflin/json/JsonToken;

    const-string v1, "NAME"

    invoke-direct {v0, v1, v7}, Lcom/cobra/zufflin/json/JsonToken;-><init>(Ljava/lang/String;I)V

    .line 53
    sput-object v0, Lcom/cobra/zufflin/json/JsonToken;->NAME:Lcom/cobra/zufflin/json/JsonToken;

    .line 55
    new-instance v0, Lcom/cobra/zufflin/json/JsonToken;

    const-string v1, "STRING"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/cobra/zufflin/json/JsonToken;-><init>(Ljava/lang/String;I)V

    .line 58
    sput-object v0, Lcom/cobra/zufflin/json/JsonToken;->STRING:Lcom/cobra/zufflin/json/JsonToken;

    .line 60
    new-instance v0, Lcom/cobra/zufflin/json/JsonToken;

    const-string v1, "NUMBER"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/cobra/zufflin/json/JsonToken;-><init>(Ljava/lang/String;I)V

    .line 64
    sput-object v0, Lcom/cobra/zufflin/json/JsonToken;->NUMBER:Lcom/cobra/zufflin/json/JsonToken;

    .line 66
    new-instance v0, Lcom/cobra/zufflin/json/JsonToken;

    const-string v1, "BOOLEAN"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/cobra/zufflin/json/JsonToken;-><init>(Ljava/lang/String;I)V

    .line 69
    sput-object v0, Lcom/cobra/zufflin/json/JsonToken;->BOOLEAN:Lcom/cobra/zufflin/json/JsonToken;

    .line 71
    new-instance v0, Lcom/cobra/zufflin/json/JsonToken;

    const-string v1, "NULL"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/cobra/zufflin/json/JsonToken;-><init>(Ljava/lang/String;I)V

    .line 74
    sput-object v0, Lcom/cobra/zufflin/json/JsonToken;->NULL:Lcom/cobra/zufflin/json/JsonToken;

    .line 76
    new-instance v0, Lcom/cobra/zufflin/json/JsonToken;

    const-string v1, "END_DOCUMENT"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lcom/cobra/zufflin/json/JsonToken;-><init>(Ljava/lang/String;I)V

    .line 81
    sput-object v0, Lcom/cobra/zufflin/json/JsonToken;->END_DOCUMENT:Lcom/cobra/zufflin/json/JsonToken;

    .line 22
    const/16 v0, 0xa

    new-array v0, v0, [Lcom/cobra/zufflin/json/JsonToken;

    sget-object v1, Lcom/cobra/zufflin/json/JsonToken;->BEGIN_ARRAY:Lcom/cobra/zufflin/json/JsonToken;

    aput-object v1, v0, v3

    sget-object v1, Lcom/cobra/zufflin/json/JsonToken;->END_ARRAY:Lcom/cobra/zufflin/json/JsonToken;

    aput-object v1, v0, v4

    sget-object v1, Lcom/cobra/zufflin/json/JsonToken;->BEGIN_OBJECT:Lcom/cobra/zufflin/json/JsonToken;

    aput-object v1, v0, v5

    sget-object v1, Lcom/cobra/zufflin/json/JsonToken;->END_OBJECT:Lcom/cobra/zufflin/json/JsonToken;

    aput-object v1, v0, v6

    sget-object v1, Lcom/cobra/zufflin/json/JsonToken;->NAME:Lcom/cobra/zufflin/json/JsonToken;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/cobra/zufflin/json/JsonToken;->STRING:Lcom/cobra/zufflin/json/JsonToken;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/cobra/zufflin/json/JsonToken;->NUMBER:Lcom/cobra/zufflin/json/JsonToken;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/cobra/zufflin/json/JsonToken;->BOOLEAN:Lcom/cobra/zufflin/json/JsonToken;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/cobra/zufflin/json/JsonToken;->NULL:Lcom/cobra/zufflin/json/JsonToken;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/cobra/zufflin/json/JsonToken;->END_DOCUMENT:Lcom/cobra/zufflin/json/JsonToken;

    aput-object v2, v0, v1

    sput-object v0, Lcom/cobra/zufflin/json/JsonToken;->ENUM$VALUES:[Lcom/cobra/zufflin/json/JsonToken;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/cobra/zufflin/json/JsonToken;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lcom/cobra/zufflin/json/JsonToken;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/cobra/zufflin/json/JsonToken;

    return-object v0
.end method

.method public static values()[Lcom/cobra/zufflin/json/JsonToken;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/cobra/zufflin/json/JsonToken;->ENUM$VALUES:[Lcom/cobra/zufflin/json/JsonToken;

    array-length v1, v0

    new-array v2, v1, [Lcom/cobra/zufflin/json/JsonToken;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
