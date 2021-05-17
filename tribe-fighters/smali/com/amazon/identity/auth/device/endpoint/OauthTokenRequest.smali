.class Lcom/amazon/identity/auth/device/endpoint/OauthTokenRequest;
.super Lcom/amazon/identity/auth/device/endpoint/AbstractOauthTokenRequest;
.source "OauthTokenRequest.java"


# static fields
.field private static final LOG_TAG:Ljava/lang/String;


# instance fields
.field private final mRefreshToken:Lcom/amazon/identity/auth/device/token/RefreshAtzToken;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 18
    const-class v0, Lcom/amazon/identity/auth/device/endpoint/OauthTokenRequest;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/identity/auth/device/endpoint/OauthTokenRequest;->LOG_TAG:Ljava/lang/String;

    return-void
.end method

.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;Ljava/lang/String;Landroid/content/Context;Lcom/amazon/identity/auth/device/token/RefreshAtzToken;Ljava/lang/String;)V
    .locals 8
    .param p1, "appName"    # Ljava/lang/String;
    .param p2, "appVersion"    # Ljava/lang/String;
    .param p3, "libVersion"    # Ljava/lang/String;
    .param p4, "options"    # Landroid/os/Bundle;
    .param p5, "appId"    # Ljava/lang/String;
    .param p6, "context"    # Landroid/content/Context;
    .param p7, "refreshToken"    # Lcom/amazon/identity/auth/device/token/RefreshAtzToken;
    .param p8, "clientId"    # Ljava/lang/String;

    .prologue
    .line 24
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p5

    move-object v5, p6

    move-object/from16 v6, p8

    move-object v7, p4

    invoke-direct/range {v0 .. v7}, Lcom/amazon/identity/auth/device/endpoint/AbstractOauthTokenRequest;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;)V

    .line 25
    iput-object p7, p0, Lcom/amazon/identity/auth/device/endpoint/OauthTokenRequest;->mRefreshToken:Lcom/amazon/identity/auth/device/token/RefreshAtzToken;

    .line 26
    return-void
.end method


# virtual methods
.method protected addRequestInfoParameters()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/identity/auth/device/AuthError;
        }
    .end annotation

    .prologue
    .line 52
    invoke-super {p0}, Lcom/amazon/identity/auth/device/endpoint/AbstractOauthTokenRequest;->addRequestInfoParameters()V

    .line 53
    iget-object v0, p0, Lcom/amazon/identity/auth/device/endpoint/OauthTokenRequest;->postParameters:Ljava/util/List;

    new-instance v1, Lorg/apache/http/message/BasicNameValuePair;

    const-string v2, "refresh_token"

    iget-object v3, p0, Lcom/amazon/identity/auth/device/endpoint/OauthTokenRequest;->mRefreshToken:Lcom/amazon/identity/auth/device/token/RefreshAtzToken;

    invoke-virtual {v3}, Lcom/amazon/identity/auth/device/token/RefreshAtzToken;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 54
    return-void
.end method

.method public executeRequest()Lorg/apache/http/HttpResponse;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/client/ClientProtocolException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 45
    sget-object v0, Lcom/amazon/identity/auth/device/endpoint/OauthTokenRequest;->LOG_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Oauth Access Exchange executeRequest. appId="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/endpoint/OauthTokenRequest;->getAppFamilyId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "refreshAtzToken="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/amazon/identity/auth/device/endpoint/OauthTokenRequest;->mRefreshToken:Lcom/amazon/identity/auth/device/token/RefreshAtzToken;

    invoke-virtual {v3}, Lcom/amazon/identity/auth/device/token/RefreshAtzToken;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/amazon/identity/auth/device/utils/MAPLog;->pii(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 46
    invoke-super {p0}, Lcom/amazon/identity/auth/device/endpoint/AbstractOauthTokenRequest;->executeRequest()Lorg/apache/http/HttpResponse;

    move-result-object v0

    return-object v0
.end method

.method protected generateTokenResponse(Lorg/apache/http/HttpResponse;)Lcom/amazon/identity/auth/device/endpoint/TokenResponse;
    .locals 2
    .param p1, "httpResponse"    # Lorg/apache/http/HttpResponse;

    .prologue
    .line 35
    new-instance v0, Lcom/amazon/identity/auth/device/endpoint/OauthTokenResponse;

    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/endpoint/OauthTokenRequest;->getAppFamilyId()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lcom/amazon/identity/auth/device/endpoint/OauthTokenResponse;-><init>(Lorg/apache/http/HttpResponse;Ljava/lang/String;)V

    return-object v0
.end method

.method public getGrantType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 30
    const-string v0, "refresh_token"

    return-object v0
.end method
