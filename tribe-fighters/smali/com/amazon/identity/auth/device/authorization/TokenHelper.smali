.class public final Lcom/amazon/identity/auth/device/authorization/TokenHelper;
.super Ljava/lang/Object;
.source "TokenHelper.java"


# static fields
.field private static final LOG_TAG:Ljava/lang/String;

.field private static mTokenVendor:Lcom/amazon/identity/auth/device/endpoint/TokenVendor;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 27
    const-class v0, Lcom/amazon/identity/auth/device/authorization/TokenHelper;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/identity/auth/device/authorization/TokenHelper;->LOG_TAG:Ljava/lang/String;

    .line 29
    new-instance v0, Lcom/amazon/identity/auth/device/endpoint/TokenVendor;

    invoke-direct {v0}, Lcom/amazon/identity/auth/device/endpoint/TokenVendor;-><init>()V

    sput-object v0, Lcom/amazon/identity/auth/device/authorization/TokenHelper;->mTokenVendor:Lcom/amazon/identity/auth/device/endpoint/TokenVendor;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getToken(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Lcom/amazon/identity/auth/device/shared/APIListener;)V
    .locals 11
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "clientId"    # Ljava/lang/String;
    .param p3, "scopes"    # [Ljava/lang/String;
    .param p4, "listener"    # Lcom/amazon/identity/auth/device/shared/APIListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/identity/auth/device/AuthError;
        }
    .end annotation

    .prologue
    .line 51
    sget-object v0, Lcom/amazon/identity/auth/device/authorization/TokenHelper;->LOG_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "GetToken pkg="

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, " scopes="

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p3}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "clientId="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v1, v4}, Lcom/amazon/identity/auth/device/utils/MAPLog;->pii(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 53
    new-instance v7, Lcom/amazon/identity/auth/device/appid/ThirdPartyAppIdentifier;

    invoke-direct {v7}, Lcom/amazon/identity/auth/device/appid/ThirdPartyAppIdentifier;-><init>()V

    .line 54
    .local v7, "appIdentifier":Lcom/amazon/identity/auth/device/appid/AppIdentifier;
    invoke-interface {v7, p1, p0}, Lcom/amazon/identity/auth/device/appid/AppIdentifier;->getAppInfo(Ljava/lang/String;Landroid/content/Context;)Lcom/amazon/identity/auth/device/dataobject/AppInfo;

    move-result-object v8

    .line 57
    .local v8, "appInfo":Lcom/amazon/identity/auth/device/dataobject/AppInfo;
    const/4 v2, 0x0

    .line 59
    .local v2, "directedId":Ljava/lang/String;
    :try_start_0
    invoke-virtual {v8}, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->getAppFamilyId()Ljava/lang/String;

    move-result-object v3

    .line 60
    .local v3, "appId":Ljava/lang/String;
    sget-object v0, Lcom/amazon/identity/auth/device/authorization/TokenHelper;->mTokenVendor:Lcom/amazon/identity/auth/device/endpoint/TokenVendor;

    move-object v1, p2

    move-object v4, p3

    move-object v5, p1

    move-object v6, p0

    invoke-virtual/range {v0 .. v6}, Lcom/amazon/identity/auth/device/endpoint/TokenVendor;->vendToken(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v9

    .line 61
    .local v9, "authzToken":Ljava/lang/String;
    sget-object v0, Lcom/amazon/identity/auth/device/authorization/TokenHelper;->LOG_TAG:Ljava/lang/String;

    const-string v1, "GetToken"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "id="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " appid="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v8}, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->getAppFamilyId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " atzToken="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v1, v4}, Lcom/amazon/identity/auth/device/utils/MAPLog;->pii(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 62
    sget-object v0, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->TOKEN:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    iget-object v0, v0, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->val:Ljava/lang/String;

    invoke-static {v0, v9}, Lcom/amazon/identity/auth/device/service/MAPServiceResult;->getOnSuccessBundle(Ljava/lang/String;Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    invoke-interface {p4, v0}, Lcom/amazon/identity/auth/device/shared/APIListener;->onSuccess(Landroid/os/Bundle;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 67
    .end local v3    # "appId":Ljava/lang/String;
    .end local v9    # "authzToken":Ljava/lang/String;
    :goto_0
    return-void

    .line 63
    :catch_0
    move-exception v10

    .line 64
    .local v10, "e":Ljava/io/IOException;
    sget-object v0, Lcom/amazon/identity/auth/device/authorization/TokenHelper;->LOG_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, ""

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v10}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v10}, Lcom/amazon/identity/auth/device/utils/MAPLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 65
    new-instance v0, Lcom/amazon/identity/auth/device/AuthError;

    const-string v1, "Error communicating with server!"

    sget-object v4, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_IO:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    invoke-direct {v0, v1, v10, v4}, Lcom/amazon/identity/auth/device/AuthError;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;)V

    invoke-interface {p4, v0}, Lcom/amazon/identity/auth/device/shared/APIListener;->onError(Lcom/amazon/identity/auth/device/AuthError;)V

    goto :goto_0
.end method

.method static setServerCommunicaton(Lcom/amazon/identity/auth/device/endpoint/ServerCommunication;)V
    .locals 1
    .param p0, "serverCommunication"    # Lcom/amazon/identity/auth/device/endpoint/ServerCommunication;

    .prologue
    .line 43
    sget-object v0, Lcom/amazon/identity/auth/device/authorization/TokenHelper;->mTokenVendor:Lcom/amazon/identity/auth/device/endpoint/TokenVendor;

    invoke-virtual {v0, p0}, Lcom/amazon/identity/auth/device/endpoint/TokenVendor;->setServerCommunication(Lcom/amazon/identity/auth/device/endpoint/ServerCommunication;)V

    .line 44
    return-void
.end method
