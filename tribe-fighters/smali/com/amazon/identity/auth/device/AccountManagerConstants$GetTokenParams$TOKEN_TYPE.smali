.class public final enum Lcom/amazon/identity/auth/device/AccountManagerConstants$GetTokenParams$TOKEN_TYPE;
.super Ljava/lang/Enum;
.source "AccountManagerConstants.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/amazon/identity/auth/device/AccountManagerConstants$GetTokenParams;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "TOKEN_TYPE"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/amazon/identity/auth/device/AccountManagerConstants$GetTokenParams$TOKEN_TYPE;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/amazon/identity/auth/device/AccountManagerConstants$GetTokenParams$TOKEN_TYPE;

.field public static final enum ACCESS_TOKEN:Lcom/amazon/identity/auth/device/AccountManagerConstants$GetTokenParams$TOKEN_TYPE;

.field public static final enum DELEGATED_ACCESS_TOKEN:Lcom/amazon/identity/auth/device/AccountManagerConstants$GetTokenParams$TOKEN_TYPE;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 145
    new-instance v0, Lcom/amazon/identity/auth/device/AccountManagerConstants$GetTokenParams$TOKEN_TYPE;

    const-string v1, "ACCESS_TOKEN"

    invoke-direct {v0, v1, v2}, Lcom/amazon/identity/auth/device/AccountManagerConstants$GetTokenParams$TOKEN_TYPE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/identity/auth/device/AccountManagerConstants$GetTokenParams$TOKEN_TYPE;->ACCESS_TOKEN:Lcom/amazon/identity/auth/device/AccountManagerConstants$GetTokenParams$TOKEN_TYPE;

    new-instance v0, Lcom/amazon/identity/auth/device/AccountManagerConstants$GetTokenParams$TOKEN_TYPE;

    const-string v1, "DELEGATED_ACCESS_TOKEN"

    invoke-direct {v0, v1, v3}, Lcom/amazon/identity/auth/device/AccountManagerConstants$GetTokenParams$TOKEN_TYPE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/identity/auth/device/AccountManagerConstants$GetTokenParams$TOKEN_TYPE;->DELEGATED_ACCESS_TOKEN:Lcom/amazon/identity/auth/device/AccountManagerConstants$GetTokenParams$TOKEN_TYPE;

    const/4 v0, 0x2

    new-array v0, v0, [Lcom/amazon/identity/auth/device/AccountManagerConstants$GetTokenParams$TOKEN_TYPE;

    sget-object v1, Lcom/amazon/identity/auth/device/AccountManagerConstants$GetTokenParams$TOKEN_TYPE;->ACCESS_TOKEN:Lcom/amazon/identity/auth/device/AccountManagerConstants$GetTokenParams$TOKEN_TYPE;

    aput-object v1, v0, v2

    sget-object v1, Lcom/amazon/identity/auth/device/AccountManagerConstants$GetTokenParams$TOKEN_TYPE;->DELEGATED_ACCESS_TOKEN:Lcom/amazon/identity/auth/device/AccountManagerConstants$GetTokenParams$TOKEN_TYPE;

    aput-object v1, v0, v3

    sput-object v0, Lcom/amazon/identity/auth/device/AccountManagerConstants$GetTokenParams$TOKEN_TYPE;->$VALUES:[Lcom/amazon/identity/auth/device/AccountManagerConstants$GetTokenParams$TOKEN_TYPE;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 145
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/amazon/identity/auth/device/AccountManagerConstants$GetTokenParams$TOKEN_TYPE;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 145
    const-class v0, Lcom/amazon/identity/auth/device/AccountManagerConstants$GetTokenParams$TOKEN_TYPE;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/amazon/identity/auth/device/AccountManagerConstants$GetTokenParams$TOKEN_TYPE;

    return-object v0
.end method

.method public static values()[Lcom/amazon/identity/auth/device/AccountManagerConstants$GetTokenParams$TOKEN_TYPE;
    .locals 1

    .prologue
    .line 145
    sget-object v0, Lcom/amazon/identity/auth/device/AccountManagerConstants$GetTokenParams$TOKEN_TYPE;->$VALUES:[Lcom/amazon/identity/auth/device/AccountManagerConstants$GetTokenParams$TOKEN_TYPE;

    invoke-virtual {v0}, [Lcom/amazon/identity/auth/device/AccountManagerConstants$GetTokenParams$TOKEN_TYPE;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/amazon/identity/auth/device/AccountManagerConstants$GetTokenParams$TOKEN_TYPE;

    return-object v0
.end method
