.class public Lcom/amazon/identity/auth/device/endpoint/ProfileRequest;
.super Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;
.source "ProfileRequest.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/amazon/identity/auth/device/endpoint/ProfileRequest$1;
    }
.end annotation


# static fields
.field private static final API_PREFIX:Ljava/lang/String; = "api"

.field public static final API_PREFIX_DEVO:Ljava/lang/String; = "api.integ"

.field public static final API_PREFIX_PRE_PROD:Ljava/lang/String; = "api.pre-prod"

.field private static final AUTHORIZATION:Ljava/lang/String; = "Authorization"

.field private static final BEARER_PREFIX:Ljava/lang/String; = "Bearer "

.field private static final LOG_TAG:Ljava/lang/String;

.field private static final PROFILE_ENDPOINT:Ljava/lang/String; = "/user/profile"


# instance fields
.field private mAuthzToken:Ljava/lang/String;

.field private final mContext:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 26
    const-class v0, Lcom/amazon/identity/auth/device/authorization/ProfileHelper;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/identity/auth/device/endpoint/ProfileRequest;->LOG_TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;Ljava/lang/String;Landroid/content/Context;)V
    .locals 0
    .param p1, "appName"    # Ljava/lang/String;
    .param p2, "appVersion"    # Ljava/lang/String;
    .param p3, "libVersion"    # Ljava/lang/String;
    .param p4, "options"    # Landroid/os/Bundle;
    .param p5, "authzToken"    # Ljava/lang/String;
    .param p6, "context"    # Landroid/content/Context;

    .prologue
    .line 37
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V

    .line 38
    iput-object p5, p0, Lcom/amazon/identity/auth/device/endpoint/ProfileRequest;->mAuthzToken:Ljava/lang/String;

    .line 39
    iput-object p6, p0, Lcom/amazon/identity/auth/device/endpoint/ProfileRequest;->mContext:Landroid/content/Context;

    .line 40
    return-void
.end method

.method private getHostType(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "packageName"    # Ljava/lang/String;

    .prologue
    .line 128
    const-string v2, "www"

    .line 132
    .local v2, "hostType":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    const/16 v4, 0x80

    invoke-virtual {v3, p2, v4}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 133
    .local v0, "appInfo":Landroid/content/pm/ApplicationInfo;
    iget-object v3, v0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    if-eqz v3, :cond_0

    .line 135
    iget-object v3, v0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    const-string v4, "host.type"

    invoke-virtual {v3, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 136
    sget-object v3, Lcom/amazon/identity/auth/device/endpoint/ProfileRequest;->LOG_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Host Type "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " found in package "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/amazon/identity/auth/device/utils/MAPLog;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 142
    .end local v0    # "appInfo":Landroid/content/pm/ApplicationInfo;
    :cond_0
    :goto_0
    return-object v2

    .line 138
    :catch_0
    move-exception v1

    .line 140
    .local v1, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    sget-object v3, Lcom/amazon/identity/auth/device/endpoint/ProfileRequest;->LOG_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "No host type found in package "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/amazon/identity/auth/device/utils/MAPLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private updateAppState()V
    .locals 3

    .prologue
    .line 115
    iget-object v1, p0, Lcom/amazon/identity/auth/device/endpoint/ProfileRequest;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/amazon/identity/auth/device/endpoint/ProfileRequest;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v1, v2}, Lcom/amazon/identity/auth/device/endpoint/ProfileRequest;->getHostType(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 116
    .local v0, "hostType":Ljava/lang/String;
    const-string v1, "development"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 118
    sget-object v1, Lcom/amazon/identity/auth/device/AccountManagerConstants$OVERIDE_APP_STATE;->FORCE_DEVO:Lcom/amazon/identity/auth/device/AccountManagerConstants$OVERIDE_APP_STATE;

    invoke-static {v1}, Lcom/amazon/identity/auth/device/utils/DefaultLibraryInfo;->setOverrideAppState(Lcom/amazon/identity/auth/device/AccountManagerConstants$OVERIDE_APP_STATE;)V

    .line 124
    :cond_0
    :goto_0
    return-void

    .line 120
    :cond_1
    const-string v1, "gamma"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 122
    sget-object v1, Lcom/amazon/identity/auth/device/AccountManagerConstants$OVERIDE_APP_STATE;->FORCE_PRE_PROD:Lcom/amazon/identity/auth/device/AccountManagerConstants$OVERIDE_APP_STATE;

    invoke-static {v1}, Lcom/amazon/identity/auth/device/utils/DefaultLibraryInfo;->setOverrideAppState(Lcom/amazon/identity/auth/device/AccountManagerConstants$OVERIDE_APP_STATE;)V

    goto :goto_0
.end method


# virtual methods
.method protected addRequestInfoParameters()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/identity/auth/device/AuthError;
        }
    .end annotation

    .prologue
    .line 51
    return-void
.end method

.method protected consumeRequestContent()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 105
    return-void
.end method

.method protected generateTokenResponse(Lorg/apache/http/HttpResponse;)Lcom/amazon/identity/auth/device/endpoint/TokenResponse;
    .locals 1
    .param p1, "httpResponse"    # Lorg/apache/http/HttpResponse;

    .prologue
    .line 44
    new-instance v0, Lcom/amazon/identity/auth/device/endpoint/ProfileResponse;

    invoke-direct {v0, p1}, Lcom/amazon/identity/auth/device/endpoint/ProfileResponse;-><init>(Lorg/apache/http/HttpResponse;)V

    return-object v0
.end method

.method public getDomain()Ljava/lang/String;
    .locals 1

    .prologue
    .line 68
    const-string v0, ".amazon.com"

    return-object v0
.end method

.method public getEndPoint()Ljava/lang/String;
    .locals 1

    .prologue
    .line 55
    const-string v0, "/user/profile"

    return-object v0
.end method

.method public getHost(Landroid/os/Bundle;)Ljava/lang/String;
    .locals 5
    .param p1, "options"    # Landroid/os/Bundle;

    .prologue
    .line 76
    const/4 v1, 0x0

    .line 77
    .local v1, "prefix":Ljava/lang/String;
    invoke-direct {p0}, Lcom/amazon/identity/auth/device/endpoint/ProfileRequest;->updateAppState()V

    .line 79
    sget-object v2, Lcom/amazon/identity/auth/device/endpoint/ProfileRequest$1;->$SwitchMap$com$amazon$identity$auth$device$AccountManagerConstants$OVERIDE_APP_STATE:[I

    invoke-static {}, Lcom/amazon/identity/auth/device/utils/DefaultLibraryInfo;->getOverrideLibraryState()Lcom/amazon/identity/auth/device/AccountManagerConstants$OVERIDE_APP_STATE;

    move-result-object v3

    invoke-virtual {v3}, Lcom/amazon/identity/auth/device/AccountManagerConstants$OVERIDE_APP_STATE;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    .line 88
    const-string v1, "api"

    .line 91
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/endpoint/ProfileRequest;->getDomain()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 92
    .local v0, "host":Ljava/lang/String;
    sget-object v2, Lcom/amazon/identity/auth/device/endpoint/ProfileRequest;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "host for request: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 93
    return-object v0

    .line 82
    .end local v0    # "host":Ljava/lang/String;
    :pswitch_0
    const-string v1, "api.integ"

    .line 83
    goto :goto_0

    .line 85
    :pswitch_1
    const-string v1, "api.pre-prod"

    .line 86
    goto :goto_0

    .line 79
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public getRequest()Lorg/apache/http/client/methods/HttpRequestBase;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/identity/auth/device/AuthError;
        }
    .end annotation

    .prologue
    .line 99
    new-instance v0, Lorg/apache/http/client/methods/HttpGet;

    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/endpoint/ProfileRequest;->getRequestUrl()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public initializeHeaders()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/identity/auth/device/AuthError;
        }
    .end annotation

    .prologue
    .line 62
    invoke-super {p0}, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;->initializeHeaders()V

    .line 63
    new-instance v0, Lorg/apache/http/message/BasicHeader;

    const-string v1, "Authorization"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Bearer "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/amazon/identity/auth/device/endpoint/ProfileRequest;->mAuthzToken:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/http/message/BasicHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/amazon/identity/auth/device/endpoint/ProfileRequest;->addHeader(Lorg/apache/http/Header;)V

    .line 64
    return-void
.end method

.method protected updateEntity()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 111
    return-void
.end method
