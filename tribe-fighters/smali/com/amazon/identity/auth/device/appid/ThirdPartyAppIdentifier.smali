.class public final Lcom/amazon/identity/auth/device/appid/ThirdPartyAppIdentifier;
.super Lcom/amazon/identity/auth/device/appid/AbstractAppIdentifier;
.source "ThirdPartyAppIdentifier.java"


# static fields
.field private static final LOG_TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 10
    const-class v0, Lcom/amazon/identity/auth/device/appid/ThirdPartyAppIdentifier;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/identity/auth/device/appid/ThirdPartyAppIdentifier;->LOG_TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Lcom/amazon/identity/auth/device/appid/AbstractAppIdentifier;-><init>()V

    .line 14
    return-void
.end method


# virtual methods
.method public getAllowedScopes(Ljava/lang/String;Landroid/content/Context;)[Ljava/lang/String;
    .locals 5
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 86
    sget-object v2, Lcom/amazon/identity/auth/device/appid/ThirdPartyAppIdentifier;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "getAllowedScopes : packageName="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 88
    if-nez p1, :cond_1

    .line 89
    sget-object v2, Lcom/amazon/identity/auth/device/appid/ThirdPartyAppIdentifier;->LOG_TAG:Ljava/lang/String;

    const-string v3, "packageName can\'t be null!"

    invoke-static {v2, v3}, Lcom/amazon/identity/auth/device/utils/MAPLog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 95
    :cond_0
    :goto_0
    return-object v1

    .line 93
    :cond_1
    invoke-virtual {p0, p1, p2}, Lcom/amazon/identity/auth/device/appid/ThirdPartyAppIdentifier;->getAppInfo(Ljava/lang/String;Landroid/content/Context;)Lcom/amazon/identity/auth/device/dataobject/AppInfo;

    move-result-object v0

    .line 95
    .local v0, "appInfo":Lcom/amazon/identity/auth/device/dataobject/AppInfo;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->getAllowedScopes()[Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public getAppFamilyId(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;
    .locals 5
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 52
    sget-object v2, Lcom/amazon/identity/auth/device/appid/ThirdPartyAppIdentifier;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "getAppFamilyId : packageName="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 54
    if-nez p1, :cond_1

    .line 55
    sget-object v2, Lcom/amazon/identity/auth/device/appid/ThirdPartyAppIdentifier;->LOG_TAG:Ljava/lang/String;

    const-string v3, "packageName can\'t be null!"

    invoke-static {v2, v3}, Lcom/amazon/identity/auth/device/utils/MAPLog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 61
    :cond_0
    :goto_0
    return-object v1

    .line 59
    :cond_1
    invoke-virtual {p0, p1, p2}, Lcom/amazon/identity/auth/device/appid/ThirdPartyAppIdentifier;->getAppInfo(Ljava/lang/String;Landroid/content/Context;)Lcom/amazon/identity/auth/device/dataobject/AppInfo;

    move-result-object v0

    .line 61
    .local v0, "appInfo":Lcom/amazon/identity/auth/device/dataobject/AppInfo;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->getAppFamilyId()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public getAppInfoByApiKey(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)Lcom/amazon/identity/auth/device/dataobject/AppInfo;
    .locals 3
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "apiKey"    # Ljava/lang/String;
    .param p3, "context"    # Landroid/content/Context;

    .prologue
    .line 116
    sget-object v0, Lcom/amazon/identity/auth/device/appid/ThirdPartyAppIdentifier;->LOG_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getAppInfo : packageName="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 118
    if-nez p1, :cond_0

    .line 119
    sget-object v0, Lcom/amazon/identity/auth/device/appid/ThirdPartyAppIdentifier;->LOG_TAG:Ljava/lang/String;

    const-string v1, "packageName can\'t be null!"

    invoke-static {v0, v1}, Lcom/amazon/identity/auth/device/utils/MAPLog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 120
    const/4 v0, 0x0

    .line 122
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    invoke-static {p1, p2, v0, p3}, Lcom/amazon/identity/auth/device/appid/APIKeyDecoder;->doDecode(Ljava/lang/String;Ljava/lang/String;ZLandroid/content/Context;)Lcom/amazon/identity/auth/device/dataobject/AppInfo;

    move-result-object v0

    goto :goto_0
.end method

.method public getAppPermissions(Ljava/lang/String;Landroid/content/Context;)[Ljava/lang/String;
    .locals 5
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 103
    sget-object v2, Lcom/amazon/identity/auth/device/appid/ThirdPartyAppIdentifier;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "getAppPermissions : packageName="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 105
    if-nez p1, :cond_1

    .line 106
    sget-object v2, Lcom/amazon/identity/auth/device/appid/ThirdPartyAppIdentifier;->LOG_TAG:Ljava/lang/String;

    const-string v3, "packageName can\'t be null!"

    invoke-static {v2, v3}, Lcom/amazon/identity/auth/device/utils/MAPLog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 112
    :cond_0
    :goto_0
    return-object v1

    .line 110
    :cond_1
    invoke-virtual {p0, p1, p2}, Lcom/amazon/identity/auth/device/appid/ThirdPartyAppIdentifier;->getAppInfo(Ljava/lang/String;Landroid/content/Context;)Lcom/amazon/identity/auth/device/dataobject/AppInfo;

    move-result-object v0

    .line 112
    .local v0, "appInfo":Lcom/amazon/identity/auth/device/dataobject/AppInfo;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->getGrantedPermissions()[Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public getAppVariantId(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;
    .locals 5
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 69
    sget-object v2, Lcom/amazon/identity/auth/device/appid/ThirdPartyAppIdentifier;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "getAppVariantId : packageName="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 71
    if-nez p1, :cond_1

    .line 72
    sget-object v2, Lcom/amazon/identity/auth/device/appid/ThirdPartyAppIdentifier;->LOG_TAG:Ljava/lang/String;

    const-string v3, "packageName can\'t be null!"

    invoke-static {v2, v3}, Lcom/amazon/identity/auth/device/utils/MAPLog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 78
    :cond_0
    :goto_0
    return-object v1

    .line 76
    :cond_1
    invoke-virtual {p0, p1, p2}, Lcom/amazon/identity/auth/device/appid/ThirdPartyAppIdentifier;->getAppInfo(Ljava/lang/String;Landroid/content/Context;)Lcom/amazon/identity/auth/device/dataobject/AppInfo;

    move-result-object v0

    .line 78
    .local v0, "appInfo":Lcom/amazon/identity/auth/device/dataobject/AppInfo;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->getAppVariantId()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public getPackageName(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;
    .locals 1
    .param p1, "appId"    # Ljava/lang/String;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 23
    const/4 v0, 0x0

    return-object v0
.end method

.method public getPackageNameByVariant(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;
    .locals 1
    .param p1, "appVariantId"    # Ljava/lang/String;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 43
    const/4 v0, 0x0

    return-object v0
.end method

.method public getPackageNames(Ljava/lang/String;Landroid/content/Context;)[Ljava/lang/String;
    .locals 1
    .param p1, "appId"    # Ljava/lang/String;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 33
    const/4 v0, 0x0

    return-object v0
.end method

.method public isAPIKeyValidFormat(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)Z
    .locals 5
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "apiKey"    # Ljava/lang/String;
    .param p3, "context"    # Landroid/content/Context;

    .prologue
    const/4 v0, 0x0

    .line 126
    sget-object v1, Lcom/amazon/identity/auth/device/appid/ThirdPartyAppIdentifier;->LOG_TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "isAPIKeyValid : packageName="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "apiKey="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/amazon/identity/auth/device/utils/MAPLog;->pii(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 128
    if-nez p1, :cond_1

    .line 129
    sget-object v1, Lcom/amazon/identity/auth/device/appid/ThirdPartyAppIdentifier;->LOG_TAG:Ljava/lang/String;

    const-string v2, "packageName can\'t be null!"

    invoke-static {v1, v2}, Lcom/amazon/identity/auth/device/utils/MAPLog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 138
    :cond_0
    :goto_0
    return v0

    .line 133
    :cond_1
    if-nez p2, :cond_2

    .line 134
    sget-object v1, Lcom/amazon/identity/auth/device/appid/ThirdPartyAppIdentifier;->LOG_TAG:Ljava/lang/String;

    const-string v2, "apiKey can\'t be null!"

    invoke-static {v1, v2}, Lcom/amazon/identity/auth/device/utils/MAPLog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 138
    :cond_2
    invoke-static {p1, p2, v0, p3}, Lcom/amazon/identity/auth/device/appid/APIKeyDecoder;->doDecode(Ljava/lang/String;Ljava/lang/String;ZLandroid/content/Context;)Lcom/amazon/identity/auth/device/dataobject/AppInfo;

    move-result-object v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0
.end method
