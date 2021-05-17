.class public final enum Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;
.super Ljava/lang/Enum;
.source "CMConstants.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/amazon/identity/auth/device/authorization/api/CMConstants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "BUNDLE_KEY"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;

.field public static final enum APPS_WITH_PERMISSION_LIST:Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;

.field public static final enum APPS_WITH_SCOPE_LIST:Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;

.field public static final enum APP_ID:Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;

.field public static final enum APP_VARIANT_ID:Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;

.field public static final enum HAS_PERMISSION:Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;

.field public static final enum HAS_SCOPE:Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;

.field public static final enum PACKAGE_NAME:Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;

.field public static final enum PACKAGE_NAMES:Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;

.field public static final enum PERMISSION_LIST:Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;

.field public static final enum SCOPE_LIST:Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;

.field public static final enum USER_ID:Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;


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

    .line 11
    new-instance v0, Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;

    const-string v1, "PACKAGE_NAME"

    const-string v2, "com.amazon.identity.auth.device.authorization.packageName"

    invoke-direct {v0, v1, v4, v2}, Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;->PACKAGE_NAME:Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;

    .line 12
    new-instance v0, Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;

    const-string v1, "APP_ID"

    const-string v2, "com.amazon.identity.auth.device.authorization.appId"

    invoke-direct {v0, v1, v5, v2}, Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;->APP_ID:Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;

    .line 13
    new-instance v0, Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;

    const-string v1, "USER_ID"

    const-string v2, "com.amazon.identity.auth.device.authorization.userId"

    invoke-direct {v0, v1, v6, v2}, Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;->USER_ID:Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;

    .line 14
    new-instance v0, Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;

    const-string v1, "APPS_WITH_SCOPE_LIST"

    const-string v2, "com.amazon.identity.auth.device.authorization.appsWithScopeList"

    invoke-direct {v0, v1, v7, v2}, Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;->APPS_WITH_SCOPE_LIST:Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;

    .line 15
    new-instance v0, Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;

    const-string v1, "SCOPE_LIST"

    const-string v2, "com.amazon.identity.auth.device.authorization.scopeList"

    invoke-direct {v0, v1, v8, v2}, Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;->SCOPE_LIST:Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;

    .line 16
    new-instance v0, Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;

    const-string v1, "HAS_SCOPE"

    const/4 v2, 0x5

    const-string v3, "com.amazon.identity.auth.device.authorization.hasScope"

    invoke-direct {v0, v1, v2, v3}, Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;->HAS_SCOPE:Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;

    .line 17
    new-instance v0, Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;

    const-string v1, "PERMISSION_LIST"

    const/4 v2, 0x6

    const-string v3, "com.amazon.identity.auth.device.authorization.permissionList"

    invoke-direct {v0, v1, v2, v3}, Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;->PERMISSION_LIST:Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;

    .line 18
    new-instance v0, Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;

    const-string v1, "HAS_PERMISSION"

    const/4 v2, 0x7

    const-string v3, "com.amazon.identity.auth.device.authorization.hasPermission"

    invoke-direct {v0, v1, v2, v3}, Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;->HAS_PERMISSION:Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;

    .line 19
    new-instance v0, Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;

    const-string v1, "APPS_WITH_PERMISSION_LIST"

    const/16 v2, 0x8

    const-string v3, "com.amazon.identity.auth.device.authorization.appsWithPermissionList"

    invoke-direct {v0, v1, v2, v3}, Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;->APPS_WITH_PERMISSION_LIST:Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;

    .line 20
    new-instance v0, Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;

    const-string v1, "APP_VARIANT_ID"

    const/16 v2, 0x9

    const-string v3, "com.amazon.identity.auth.device.authorization.appVariantid"

    invoke-direct {v0, v1, v2, v3}, Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;->APP_VARIANT_ID:Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;

    .line 21
    new-instance v0, Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;

    const-string v1, "PACKAGE_NAMES"

    const/16 v2, 0xa

    const-string v3, "com.amazon.identity.auth.device.authorization.packageNames"

    invoke-direct {v0, v1, v2, v3}, Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;->PACKAGE_NAMES:Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;

    .line 10
    const/16 v0, 0xb

    new-array v0, v0, [Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;

    sget-object v1, Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;->PACKAGE_NAME:Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;

    aput-object v1, v0, v4

    sget-object v1, Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;->APP_ID:Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;

    aput-object v1, v0, v5

    sget-object v1, Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;->USER_ID:Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;

    aput-object v1, v0, v6

    sget-object v1, Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;->APPS_WITH_SCOPE_LIST:Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;

    aput-object v1, v0, v7

    sget-object v1, Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;->SCOPE_LIST:Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;

    aput-object v1, v0, v8

    const/4 v1, 0x5

    sget-object v2, Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;->HAS_SCOPE:Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;->PERMISSION_LIST:Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;->HAS_PERMISSION:Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;->APPS_WITH_PERMISSION_LIST:Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;->APP_VARIANT_ID:Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;->PACKAGE_NAMES:Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;

    aput-object v2, v0, v1

    sput-object v0, Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;->$VALUES:[Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;

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
    .line 24
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;->val:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 10
    const-class v0, Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;

    return-object v0
.end method

.method public static values()[Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;
    .locals 1

    .prologue
    .line 10
    sget-object v0, Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;->$VALUES:[Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;

    invoke-virtual {v0}, [Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/amazon/identity/auth/device/authorization/api/CMConstants$BUNDLE_KEY;

    return-object v0
.end method
