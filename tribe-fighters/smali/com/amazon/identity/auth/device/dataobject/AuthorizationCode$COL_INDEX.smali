.class public final enum Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode$COL_INDEX;
.super Ljava/lang/Enum;
.source "AuthorizationCode.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "COL_INDEX"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode$COL_INDEX;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode$COL_INDEX;

.field public static final enum APP_FAMILY_ID:Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode$COL_INDEX;

.field public static final enum AUTHORIZATION_TOKEN_ID:Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode$COL_INDEX;

.field public static final enum CODE:Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode$COL_INDEX;

.field public static final enum ROW_ID:Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode$COL_INDEX;


# instance fields
.field public final colId:I


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 36
    new-instance v0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode$COL_INDEX;

    const-string v1, "ROW_ID"

    invoke-direct {v0, v1, v2, v2}, Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode$COL_INDEX;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode$COL_INDEX;->ROW_ID:Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode$COL_INDEX;

    new-instance v0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode$COL_INDEX;

    const-string v1, "CODE"

    invoke-direct {v0, v1, v3, v3}, Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode$COL_INDEX;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode$COL_INDEX;->CODE:Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode$COL_INDEX;

    new-instance v0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode$COL_INDEX;

    const-string v1, "APP_FAMILY_ID"

    invoke-direct {v0, v1, v4, v4}, Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode$COL_INDEX;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode$COL_INDEX;->APP_FAMILY_ID:Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode$COL_INDEX;

    new-instance v0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode$COL_INDEX;

    const-string v1, "AUTHORIZATION_TOKEN_ID"

    invoke-direct {v0, v1, v5, v5}, Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode$COL_INDEX;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode$COL_INDEX;->AUTHORIZATION_TOKEN_ID:Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode$COL_INDEX;

    .line 35
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode$COL_INDEX;

    sget-object v1, Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode$COL_INDEX;->ROW_ID:Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode$COL_INDEX;

    aput-object v1, v0, v2

    sget-object v1, Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode$COL_INDEX;->CODE:Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode$COL_INDEX;

    aput-object v1, v0, v3

    sget-object v1, Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode$COL_INDEX;->APP_FAMILY_ID:Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode$COL_INDEX;

    aput-object v1, v0, v4

    sget-object v1, Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode$COL_INDEX;->AUTHORIZATION_TOKEN_ID:Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode$COL_INDEX;

    aput-object v1, v0, v5

    sput-object v0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode$COL_INDEX;->$VALUES:[Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode$COL_INDEX;

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
    .line 38
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode$COL_INDEX;->colId:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode$COL_INDEX;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 35
    const-class v0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode$COL_INDEX;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode$COL_INDEX;

    return-object v0
.end method

.method public static values()[Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode$COL_INDEX;
    .locals 1

    .prologue
    .line 35
    sget-object v0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode$COL_INDEX;->$VALUES:[Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode$COL_INDEX;

    invoke-virtual {v0}, [Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode$COL_INDEX;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode$COL_INDEX;

    return-object v0
.end method
