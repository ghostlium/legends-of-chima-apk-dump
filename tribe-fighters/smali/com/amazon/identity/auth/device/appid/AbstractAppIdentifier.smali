.class public abstract Lcom/amazon/identity/auth/device/appid/AbstractAppIdentifier;
.super Ljava/lang/Object;
.source "AbstractAppIdentifier.java"

# interfaces
.implements Lcom/amazon/identity/auth/device/appid/AppIdentifier;


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final LOG_TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 15
    const-class v0, Lcom/amazon/identity/auth/device/appid/AbstractAppIdentifier;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/amazon/identity/auth/device/appid/AbstractAppIdentifier;->$assertionsDisabled:Z

    .line 17
    const-class v0, Lcom/amazon/identity/auth/device/appid/AbstractAppIdentifier;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/identity/auth/device/appid/AbstractAppIdentifier;->LOG_TAG:Ljava/lang/String;

    return-void

    .line 15
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private getAPIKey(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;
    .locals 5
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 138
    sget-object v2, Lcom/amazon/identity/auth/device/appid/AbstractAppIdentifier;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Finding API Key for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 140
    sget-boolean v2, Lcom/amazon/identity/auth/device/appid/AbstractAppIdentifier;->$assertionsDisabled:Z

    if-nez v2, :cond_0

    if-nez p1, :cond_0

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 142
    :cond_0
    const/4 v1, 0x0

    .line 145
    .local v1, "to_return":Ljava/lang/String;
    const/4 v0, 0x0

    .line 146
    .local v0, "parser":Lcom/amazon/identity/auth/device/utils/ThirdPartyResourceParser;
    new-instance v0, Lcom/amazon/identity/auth/device/utils/ThirdPartyResourceParser;

    .end local v0    # "parser":Lcom/amazon/identity/auth/device/utils/ThirdPartyResourceParser;
    invoke-direct {v0, p2, p1}, Lcom/amazon/identity/auth/device/utils/ThirdPartyResourceParser;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 147
    .restart local v0    # "parser":Lcom/amazon/identity/auth/device/utils/ThirdPartyResourceParser;
    invoke-virtual {v0}, Lcom/amazon/identity/auth/device/utils/ThirdPartyResourceParser;->getApiKey()Ljava/lang/String;

    move-result-object v1

    .line 149
    return-object v1
.end method


# virtual methods
.method public abstract getAppFamilyId(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;
.end method

.method public getAppInfo(Ljava/lang/String;Landroid/content/Context;)Lcom/amazon/identity/auth/device/dataobject/AppInfo;
    .locals 4
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 76
    sget-object v1, Lcom/amazon/identity/auth/device/appid/AbstractAppIdentifier;->LOG_TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getAppInfo : packageName="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 78
    if-nez p1, :cond_0

    .line 79
    sget-object v1, Lcom/amazon/identity/auth/device/appid/AbstractAppIdentifier;->LOG_TAG:Ljava/lang/String;

    const-string v2, "packageName can\'t be null!"

    invoke-static {v1, v2}, Lcom/amazon/identity/auth/device/utils/MAPLog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 80
    const/4 v1, 0x0

    .line 85
    :goto_0
    return-object v1

    .line 83
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/amazon/identity/auth/device/appid/AbstractAppIdentifier;->getAPIKey(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 85
    .local v0, "apiKey":Ljava/lang/String;
    invoke-static {p1, v0, p2}, Lcom/amazon/identity/auth/device/appid/APIKeyDecoder;->decode(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)Lcom/amazon/identity/auth/device/dataobject/AppInfo;

    move-result-object v1

    goto :goto_0
.end method

.method public getAppLabel(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;
    .locals 6
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 113
    sget-object v3, Lcom/amazon/identity/auth/device/appid/AbstractAppIdentifier;->LOG_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "getAppLabel : packageName="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 115
    if-nez p1, :cond_0

    .line 116
    sget-object v3, Lcom/amazon/identity/auth/device/appid/AbstractAppIdentifier;->LOG_TAG:Ljava/lang/String;

    const-string v4, "packageName can\'t be null!"

    invoke-static {v3, v4}, Lcom/amazon/identity/auth/device/utils/MAPLog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 117
    const/4 v2, 0x0

    .line 131
    :goto_0
    return-object v2

    .line 120
    :cond_0
    const/4 v2, 0x0

    .line 123
    .local v2, "to_return":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, p1, v4}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 124
    .local v0, "appInfo":Landroid/content/pm/ApplicationInfo;
    invoke-virtual {p2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/content/pm/PackageManager;->getApplicationLabel(Landroid/content/pm/ApplicationInfo;)Ljava/lang/CharSequence;

    move-result-object v2

    .end local v2    # "to_return":Ljava/lang/String;
    check-cast v2, Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .restart local v2    # "to_return":Ljava/lang/String;
    goto :goto_0

    .line 126
    .end local v0    # "appInfo":Landroid/content/pm/ApplicationInfo;
    .end local v2    # "to_return":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 127
    .local v1, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    sget-object v3, Lcom/amazon/identity/auth/device/appid/AbstractAppIdentifier;->LOG_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Landroid/content/pm/PackageManager$NameNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v1}, Lcom/amazon/identity/auth/device/utils/MAPLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 128
    const/4 v2, 0x0

    .restart local v2    # "to_return":Ljava/lang/String;
    goto :goto_0
.end method

.method public abstract getAppVariantId(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;
.end method

.method public abstract getPackageName(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;
.end method

.method public abstract getPackageNameByVariant(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;
.end method

.method public abstract getPackageNames(Ljava/lang/String;Landroid/content/Context;)[Ljava/lang/String;
.end method

.method public isAPIKeyValid(Landroid/content/Context;)Z
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 26
    if-nez p1, :cond_0

    .line 28
    sget-object v1, Lcom/amazon/identity/auth/device/appid/AbstractAppIdentifier;->LOG_TAG:Ljava/lang/String;

    const-string v2, "context can\'t be null!"

    invoke-static {v1, v2}, Lcom/amazon/identity/auth/device/utils/MAPLog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 29
    const/4 v1, 0x0

    .line 33
    :goto_0
    return v1

    .line 31
    :cond_0
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    .line 33
    .local v0, "packageName":Ljava/lang/String;
    invoke-virtual {p0, v0, p1}, Lcom/amazon/identity/auth/device/appid/AbstractAppIdentifier;->isAPIKeyValid(Ljava/lang/String;Landroid/content/Context;)Z

    move-result v1

    goto :goto_0
.end method

.method public isAPIKeyValid(Ljava/lang/String;Landroid/content/Context;)Z
    .locals 4
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    const/4 v0, 0x0

    .line 41
    sget-object v1, Lcom/amazon/identity/auth/device/appid/AbstractAppIdentifier;->LOG_TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "isAPIKeyValid : packageName="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 43
    if-nez p1, :cond_1

    .line 44
    sget-object v1, Lcom/amazon/identity/auth/device/appid/AbstractAppIdentifier;->LOG_TAG:Ljava/lang/String;

    const-string v2, "packageName can\'t be null!"

    invoke-static {v1, v2}, Lcom/amazon/identity/auth/device/utils/MAPLog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    :cond_0
    :goto_0
    return v0

    :cond_1
    invoke-virtual {p0, p1, p2}, Lcom/amazon/identity/auth/device/appid/AbstractAppIdentifier;->getAppInfo(Ljava/lang/String;Landroid/content/Context;)Lcom/amazon/identity/auth/device/dataobject/AppInfo;

    move-result-object v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0
.end method

.method public isAPIKeyValid(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)Z
    .locals 5
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "apiKey"    # Ljava/lang/String;
    .param p3, "context"    # Landroid/content/Context;

    .prologue
    const/4 v0, 0x0

    .line 56
    sget-object v1, Lcom/amazon/identity/auth/device/appid/AbstractAppIdentifier;->LOG_TAG:Ljava/lang/String;

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

    .line 58
    if-nez p1, :cond_1

    .line 59
    sget-object v1, Lcom/amazon/identity/auth/device/appid/AbstractAppIdentifier;->LOG_TAG:Ljava/lang/String;

    const-string v2, "packageName can\'t be null!"

    invoke-static {v1, v2}, Lcom/amazon/identity/auth/device/utils/MAPLog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 68
    :cond_0
    :goto_0
    return v0

    .line 63
    :cond_1
    if-nez p2, :cond_2

    .line 64
    sget-object v1, Lcom/amazon/identity/auth/device/appid/AbstractAppIdentifier;->LOG_TAG:Ljava/lang/String;

    const-string v2, "apiKey can\'t be null!"

    invoke-static {v1, v2}, Lcom/amazon/identity/auth/device/utils/MAPLog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 68
    :cond_2
    invoke-static {p1, p2, p3}, Lcom/amazon/identity/auth/device/appid/APIKeyDecoder;->decode(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)Lcom/amazon/identity/auth/device/dataobject/AppInfo;

    move-result-object v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0
.end method
