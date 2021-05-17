.class public final enum Lcom/amazon/ags/client/whispersync/model/SyncableType;
.super Ljava/lang/Enum;
.source "SyncableType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/amazon/ags/client/whispersync/model/SyncableType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/amazon/ags/client/whispersync/model/SyncableType;

.field public static final enum ACCUMULATING_NUMBER:Lcom/amazon/ags/client/whispersync/model/SyncableType;

.field public static final enum DEVELOPER_STRING:Lcom/amazon/ags/client/whispersync/model/SyncableType;

.field public static final enum HIGHEST_NUMBER:Lcom/amazon/ags/client/whispersync/model/SyncableType;

.field public static final enum HIGHEST_NUMBER_LIST:Lcom/amazon/ags/client/whispersync/model/SyncableType;

.field public static final enum LATEST_NUMBER:Lcom/amazon/ags/client/whispersync/model/SyncableType;

.field public static final enum LATEST_NUMBER_LIST:Lcom/amazon/ags/client/whispersync/model/SyncableType;

.field public static final enum LATEST_STRING:Lcom/amazon/ags/client/whispersync/model/SyncableType;

.field public static final enum LATEST_STRING_LIST:Lcom/amazon/ags/client/whispersync/model/SyncableType;

.field public static final enum LOWEST_NUMBER:Lcom/amazon/ags/client/whispersync/model/SyncableType;

.field public static final enum LOWEST_NUMBER_LIST:Lcom/amazon/ags/client/whispersync/model/SyncableType;

.field public static final enum MAP:Lcom/amazon/ags/client/whispersync/model/SyncableType;

.field public static final enum STRING_SET:Lcom/amazon/ags/client/whispersync/model/SyncableType;


# instance fields
.field private final jsonName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 10
    new-instance v0, Lcom/amazon/ags/client/whispersync/model/SyncableType;

    const-string v1, "HIGHEST_NUMBER"

    const-string v2, "HN"

    invoke-direct {v0, v1, v4, v2}, Lcom/amazon/ags/client/whispersync/model/SyncableType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazon/ags/client/whispersync/model/SyncableType;->HIGHEST_NUMBER:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    .line 11
    new-instance v0, Lcom/amazon/ags/client/whispersync/model/SyncableType;

    const-string v1, "LOWEST_NUMBER"

    const-string v2, "LN"

    invoke-direct {v0, v1, v5, v2}, Lcom/amazon/ags/client/whispersync/model/SyncableType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazon/ags/client/whispersync/model/SyncableType;->LOWEST_NUMBER:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    .line 12
    new-instance v0, Lcom/amazon/ags/client/whispersync/model/SyncableType;

    const-string v1, "LATEST_NUMBER"

    const-string v2, "CN"

    invoke-direct {v0, v1, v6, v2}, Lcom/amazon/ags/client/whispersync/model/SyncableType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazon/ags/client/whispersync/model/SyncableType;->LATEST_NUMBER:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    .line 13
    new-instance v0, Lcom/amazon/ags/client/whispersync/model/SyncableType;

    const-string v1, "ACCUMULATING_NUMBER"

    const-string v2, "AN"

    invoke-direct {v0, v1, v7, v2}, Lcom/amazon/ags/client/whispersync/model/SyncableType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazon/ags/client/whispersync/model/SyncableType;->ACCUMULATING_NUMBER:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    .line 14
    new-instance v0, Lcom/amazon/ags/client/whispersync/model/SyncableType;

    const-string v1, "HIGHEST_NUMBER_LIST"

    const-string v2, "HNL"

    invoke-direct {v0, v1, v8, v2}, Lcom/amazon/ags/client/whispersync/model/SyncableType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazon/ags/client/whispersync/model/SyncableType;->HIGHEST_NUMBER_LIST:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    .line 15
    new-instance v0, Lcom/amazon/ags/client/whispersync/model/SyncableType;

    const-string v1, "LOWEST_NUMBER_LIST"

    const/4 v2, 0x5

    const-string v3, "LNL"

    invoke-direct {v0, v1, v2, v3}, Lcom/amazon/ags/client/whispersync/model/SyncableType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazon/ags/client/whispersync/model/SyncableType;->LOWEST_NUMBER_LIST:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    .line 16
    new-instance v0, Lcom/amazon/ags/client/whispersync/model/SyncableType;

    const-string v1, "LATEST_NUMBER_LIST"

    const/4 v2, 0x6

    const-string v3, "CNL"

    invoke-direct {v0, v1, v2, v3}, Lcom/amazon/ags/client/whispersync/model/SyncableType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazon/ags/client/whispersync/model/SyncableType;->LATEST_NUMBER_LIST:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    .line 17
    new-instance v0, Lcom/amazon/ags/client/whispersync/model/SyncableType;

    const-string v1, "LATEST_STRING"

    const/4 v2, 0x7

    const-string v3, "CS"

    invoke-direct {v0, v1, v2, v3}, Lcom/amazon/ags/client/whispersync/model/SyncableType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazon/ags/client/whispersync/model/SyncableType;->LATEST_STRING:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    .line 18
    new-instance v0, Lcom/amazon/ags/client/whispersync/model/SyncableType;

    const-string v1, "LATEST_STRING_LIST"

    const/16 v2, 0x8

    const-string v3, "CSL"

    invoke-direct {v0, v1, v2, v3}, Lcom/amazon/ags/client/whispersync/model/SyncableType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazon/ags/client/whispersync/model/SyncableType;->LATEST_STRING_LIST:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    .line 19
    new-instance v0, Lcom/amazon/ags/client/whispersync/model/SyncableType;

    const-string v1, "STRING_SET"

    const/16 v2, 0x9

    const-string v3, "SS"

    invoke-direct {v0, v1, v2, v3}, Lcom/amazon/ags/client/whispersync/model/SyncableType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazon/ags/client/whispersync/model/SyncableType;->STRING_SET:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    .line 20
    new-instance v0, Lcom/amazon/ags/client/whispersync/model/SyncableType;

    const-string v1, "DEVELOPER_STRING"

    const/16 v2, 0xa

    const-string v3, "DS"

    invoke-direct {v0, v1, v2, v3}, Lcom/amazon/ags/client/whispersync/model/SyncableType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazon/ags/client/whispersync/model/SyncableType;->DEVELOPER_STRING:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    .line 21
    new-instance v0, Lcom/amazon/ags/client/whispersync/model/SyncableType;

    const-string v1, "MAP"

    const/16 v2, 0xb

    const-string v3, "MAP"

    invoke-direct {v0, v1, v2, v3}, Lcom/amazon/ags/client/whispersync/model/SyncableType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazon/ags/client/whispersync/model/SyncableType;->MAP:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    .line 8
    const/16 v0, 0xc

    new-array v0, v0, [Lcom/amazon/ags/client/whispersync/model/SyncableType;

    sget-object v1, Lcom/amazon/ags/client/whispersync/model/SyncableType;->HIGHEST_NUMBER:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/amazon/ags/client/whispersync/model/SyncableType;->LOWEST_NUMBER:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    aput-object v1, v0, v5

    sget-object v1, Lcom/amazon/ags/client/whispersync/model/SyncableType;->LATEST_NUMBER:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    aput-object v1, v0, v6

    sget-object v1, Lcom/amazon/ags/client/whispersync/model/SyncableType;->ACCUMULATING_NUMBER:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    aput-object v1, v0, v7

    sget-object v1, Lcom/amazon/ags/client/whispersync/model/SyncableType;->HIGHEST_NUMBER_LIST:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    aput-object v1, v0, v8

    const/4 v1, 0x5

    sget-object v2, Lcom/amazon/ags/client/whispersync/model/SyncableType;->LOWEST_NUMBER_LIST:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/amazon/ags/client/whispersync/model/SyncableType;->LATEST_NUMBER_LIST:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/amazon/ags/client/whispersync/model/SyncableType;->LATEST_STRING:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/amazon/ags/client/whispersync/model/SyncableType;->LATEST_STRING_LIST:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/amazon/ags/client/whispersync/model/SyncableType;->STRING_SET:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lcom/amazon/ags/client/whispersync/model/SyncableType;->DEVELOPER_STRING:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    sget-object v2, Lcom/amazon/ags/client/whispersync/model/SyncableType;->MAP:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    aput-object v2, v0, v1

    sput-object v0, Lcom/amazon/ags/client/whispersync/model/SyncableType;->$VALUES:[Lcom/amazon/ags/client/whispersync/model/SyncableType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .param p3, "jsonName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 25
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 26
    iput-object p3, p0, Lcom/amazon/ags/client/whispersync/model/SyncableType;->jsonName:Ljava/lang/String;

    .line 27
    return-void
.end method

.method public static fromString(Ljava/lang/String;)Lcom/amazon/ags/client/whispersync/model/SyncableType;
    .locals 5
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    .line 34
    invoke-static {}, Lcom/amazon/ags/client/whispersync/model/SyncableType;->values()[Lcom/amazon/ags/client/whispersync/model/SyncableType;

    move-result-object v0

    .local v0, "arr$":[Lcom/amazon/ags/client/whispersync/model/SyncableType;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_1

    aget-object v3, v0, v1

    .line 35
    .local v3, "type":Lcom/amazon/ags/client/whispersync/model/SyncableType;
    iget-object v4, v3, Lcom/amazon/ags/client/whispersync/model/SyncableType;->jsonName:Ljava/lang/String;

    invoke-virtual {v4, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 39
    .end local v3    # "type":Lcom/amazon/ags/client/whispersync/model/SyncableType;
    :goto_1
    return-object v3

    .line 34
    .restart local v3    # "type":Lcom/amazon/ags/client/whispersync/model/SyncableType;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 39
    .end local v3    # "type":Lcom/amazon/ags/client/whispersync/model/SyncableType;
    :cond_1
    const/4 v3, 0x0

    goto :goto_1
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/amazon/ags/client/whispersync/model/SyncableType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 8
    const-class v0, Lcom/amazon/ags/client/whispersync/model/SyncableType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/amazon/ags/client/whispersync/model/SyncableType;

    return-object v0
.end method

.method public static values()[Lcom/amazon/ags/client/whispersync/model/SyncableType;
    .locals 1

    .prologue
    .line 8
    sget-object v0, Lcom/amazon/ags/client/whispersync/model/SyncableType;->$VALUES:[Lcom/amazon/ags/client/whispersync/model/SyncableType;

    invoke-virtual {v0}, [Lcom/amazon/ags/client/whispersync/model/SyncableType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/amazon/ags/client/whispersync/model/SyncableType;

    return-object v0
.end method


# virtual methods
.method public getJsonName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 30
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/SyncableType;->jsonName:Ljava/lang/String;

    return-object v0
.end method
