.class public final enum Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;
.super Ljava/lang/Enum;
.source "AuthorizationToken.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "COL_INDEX"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;

.field public static final enum APP_ID:Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;

.field public static final enum CREATION_TIME:Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;

.field public static final enum DIRECTED_ID:Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;

.field public static final enum EXPIRATION_TIME:Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;

.field public static final enum ID:Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;

.field public static final enum MISC_DATA:Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;

.field public static final enum TOKEN:Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;

.field public static final enum TYPE:Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;


# instance fields
.field public final colId:I


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 44
    new-instance v0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;

    const-string v1, "ID"

    invoke-direct {v0, v1, v4, v4}, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;->ID:Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;

    new-instance v0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;

    const-string v1, "APP_ID"

    invoke-direct {v0, v1, v5, v5}, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;->APP_ID:Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;

    new-instance v0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;

    const-string v1, "TOKEN"

    invoke-direct {v0, v1, v6, v6}, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;->TOKEN:Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;

    new-instance v0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;

    const-string v1, "CREATION_TIME"

    invoke-direct {v0, v1, v7, v7}, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;->CREATION_TIME:Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;

    new-instance v0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;

    const-string v1, "EXPIRATION_TIME"

    invoke-direct {v0, v1, v8, v8}, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;->EXPIRATION_TIME:Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;

    new-instance v0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;

    const-string v1, "MISC_DATA"

    const/4 v2, 0x5

    const/4 v3, 0x5

    invoke-direct {v0, v1, v2, v3}, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;->MISC_DATA:Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;

    new-instance v0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;

    const-string v1, "TYPE"

    const/4 v2, 0x6

    const/4 v3, 0x6

    invoke-direct {v0, v1, v2, v3}, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;->TYPE:Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;

    new-instance v0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;

    const-string v1, "DIRECTED_ID"

    const/4 v2, 0x7

    const/4 v3, 0x7

    invoke-direct {v0, v1, v2, v3}, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;->DIRECTED_ID:Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;

    .line 43
    const/16 v0, 0x8

    new-array v0, v0, [Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;

    sget-object v1, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;->ID:Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;

    aput-object v1, v0, v4

    sget-object v1, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;->APP_ID:Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;

    aput-object v1, v0, v5

    sget-object v1, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;->TOKEN:Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;

    aput-object v1, v0, v6

    sget-object v1, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;->CREATION_TIME:Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;

    aput-object v1, v0, v7

    sget-object v1, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;->EXPIRATION_TIME:Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;

    aput-object v1, v0, v8

    const/4 v1, 0x5

    sget-object v2, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;->MISC_DATA:Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;->TYPE:Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;->DIRECTED_ID:Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;

    aput-object v2, v0, v1

    sput-object v0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;->$VALUES:[Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .param p3, "colId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .prologue
    .line 46
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;->colId:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 43
    const-class v0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;

    return-object v0
.end method

.method public static values()[Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;
    .locals 1

    .prologue
    .line 43
    sget-object v0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;->$VALUES:[Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;

    invoke-virtual {v0}, [Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;

    return-object v0
.end method
