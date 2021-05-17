.class public final enum Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;
.super Ljava/lang/Enum;
.source "AuthzConstants.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "BUNDLE_KEY"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

.field public static final enum APP_ID:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

.field public static final enum AUTHORIZATION_CODE:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

.field public static final enum AUTHORIZE:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

.field public static final enum BROWSER_AUTHORIZATION:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

.field public static final enum CAUSE_ID:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

.field public static final enum CLIENT_ID:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

.field public static final enum DEVICE_ID:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

.field public static final enum DIRECTED_ID:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

.field public static final enum FUTURE:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

.field public static final enum ON_CANCEL_DESCRIPTION:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

.field public static final enum ON_CANCEL_TYPE:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

.field public static final enum PROFILE:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

.field public static final enum REJECTED_SCOPE_LIST:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

.field public static final enum TOKEN:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;


# instance fields
.field public final val:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 12
    new-instance v0, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    const-string v1, "TOKEN"

    const-string v2, "com.amazon.identity.auth.device.authorization.token"

    invoke-direct {v0, v1, v4, v2}, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->TOKEN:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    .line 13
    new-instance v0, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    const-string v1, "AUTHORIZATION_CODE"

    const-string v2, "com.amazon.identity.auth.device.authorization.authorizationCode"

    invoke-direct {v0, v1, v5, v2}, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->AUTHORIZATION_CODE:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    .line 14
    new-instance v0, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    const-string v1, "DIRECTED_ID"

    const-string v2, "com.amazon.identity.auth.device.authorization.directedId"

    invoke-direct {v0, v1, v6, v2}, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->DIRECTED_ID:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    .line 15
    new-instance v0, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    const-string v1, "DEVICE_ID"

    const-string v2, "com.amazon.identity.auth.device.authorization.deviceId"

    invoke-direct {v0, v1, v7, v2}, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->DEVICE_ID:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    .line 16
    new-instance v0, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    const-string v1, "APP_ID"

    const-string v2, "com.amazon.identity.auth.device.authorization.appId"

    invoke-direct {v0, v1, v8, v2}, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->APP_ID:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    .line 17
    new-instance v0, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    const-string v1, "CAUSE_ID"

    const/4 v2, 0x5

    const-string v3, "com.amazon.identity.auth.device.authorization.causeId"

    invoke-direct {v0, v1, v2, v3}, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->CAUSE_ID:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    .line 18
    new-instance v0, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    const-string v1, "REJECTED_SCOPE_LIST"

    const/4 v2, 0x6

    const-string v3, "com.amazon.identity.auth.device.authorization.ungrantedScopes"

    invoke-direct {v0, v1, v2, v3}, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->REJECTED_SCOPE_LIST:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    .line 19
    new-instance v0, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    const-string v1, "AUTHORIZE"

    const/4 v2, 0x7

    const-string v3, "com.amazon.identity.auth.device.authorization.authorize"

    invoke-direct {v0, v1, v2, v3}, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->AUTHORIZE:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    .line 20
    new-instance v0, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    const-string v1, "CLIENT_ID"

    const/16 v2, 0x8

    const-string v3, "com.amazon.identity.auth.device.authorization.clietId"

    invoke-direct {v0, v1, v2, v3}, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->CLIENT_ID:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    .line 21
    new-instance v0, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    const-string v1, "ON_CANCEL_TYPE"

    const/16 v2, 0x9

    const-string v3, "com.amazon.identity.auth.device.authorization.onCancelType"

    invoke-direct {v0, v1, v2, v3}, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->ON_CANCEL_TYPE:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    .line 22
    new-instance v0, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    const-string v1, "ON_CANCEL_DESCRIPTION"

    const/16 v2, 0xa

    const-string v3, "com.amazon.identity.auth.device.authorization.onCancelDescription"

    invoke-direct {v0, v1, v2, v3}, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->ON_CANCEL_DESCRIPTION:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    .line 23
    new-instance v0, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    const-string v1, "BROWSER_AUTHORIZATION"

    const/16 v2, 0xb

    const-string v3, "com.amazon.identity.auth.device.authorization.useBrowserForAuthorization"

    invoke-direct {v0, v1, v2, v3}, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->BROWSER_AUTHORIZATION:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    .line 24
    new-instance v0, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    const-string v1, "PROFILE"

    const/16 v2, 0xc

    const-string v3, "com.amazon.identity.auth.device.authorization.profile"

    invoke-direct {v0, v1, v2, v3}, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->PROFILE:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    .line 25
    new-instance v0, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    const-string v1, "FUTURE"

    const/16 v2, 0xd

    const-string v3, "com.amazon.identity.auth.device.authorization.future.type"

    invoke-direct {v0, v1, v2, v3}, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->FUTURE:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    .line 11
    const/16 v0, 0xe

    new-array v0, v0, [Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    sget-object v1, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->TOKEN:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    aput-object v1, v0, v4

    sget-object v1, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->AUTHORIZATION_CODE:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    aput-object v1, v0, v5

    sget-object v1, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->DIRECTED_ID:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    aput-object v1, v0, v6

    sget-object v1, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->DEVICE_ID:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    aput-object v1, v0, v7

    sget-object v1, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->APP_ID:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    aput-object v1, v0, v8

    const/4 v1, 0x5

    sget-object v2, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->CAUSE_ID:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->REJECTED_SCOPE_LIST:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->AUTHORIZE:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->CLIENT_ID:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->ON_CANCEL_TYPE:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->ON_CANCEL_DESCRIPTION:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    sget-object v2, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->BROWSER_AUTHORIZATION:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    aput-object v2, v0, v1

    const/16 v1, 0xc

    sget-object v2, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->PROFILE:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    aput-object v2, v0, v1

    const/16 v1, 0xd

    sget-object v2, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->FUTURE:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    aput-object v2, v0, v1

    sput-object v0, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->$VALUES:[Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .param p3, "val"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 28
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->val:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 11
    const-class v0, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    return-object v0
.end method

.method public static values()[Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;
    .locals 1

    .prologue
    .line 11
    sget-object v0, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->$VALUES:[Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    invoke-virtual {v0}, [Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    return-object v0
.end method
