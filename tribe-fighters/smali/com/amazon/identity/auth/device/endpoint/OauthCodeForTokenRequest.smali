.class Lcom/amazon/identity/auth/device/endpoint/OauthCodeForTokenRequest;
.super Lcom/amazon/identity/auth/device/endpoint/AbstractOauthTokenRequest;
.source "OauthCodeForTokenRequest.java"


# static fields
.field private static final LOG_TAG:Ljava/lang/String;


# instance fields
.field private final mCode:Ljava/lang/String;

.field private final mRedirectUri:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 17
    const-class v0, Lcom/amazon/identity/auth/device/endpoint/OauthCodeForTokenRequest;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/identity/auth/device/endpoint/OauthCodeForTokenRequest;->LOG_TAG:Ljava/lang/String;

    return-void
.end method

.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V
    .locals 9
    .param p1, "appName"    # Ljava/lang/String;
    .param p2, "appVersion"    # Ljava/lang/String;
    .param p3, "libVersion"    # Ljava/lang/String;
    .param p4, "options"    # Landroid/os/Bundle;
    .param p5, "code"    # Ljava/lang/String;
    .param p6, "clientId"    # Ljava/lang/String;
    .param p7, "appId"    # Ljava/lang/String;
    .param p8, "redirectUri"    # Ljava/lang/String;
    .param p9, "context"    # Landroid/content/Context;

    .prologue
    .line 24
    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object/from16 v5, p7

    move-object/from16 v6, p9

    move-object v7, p6

    move-object v8, p4

    invoke-direct/range {v1 .. v8}, Lcom/amazon/identity/auth/device/endpoint/AbstractOauthTokenRequest;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;)V

    .line 25
    iput-object p5, p0, Lcom/amazon/identity/auth/device/endpoint/OauthCodeForTokenRequest;->mCode:Ljava/lang/String;

    .line 26
    move-object/from16 v0, p8

    iput-object v0, p0, Lcom/amazon/identity/auth/device/endpoint/OauthCodeForTokenRequest;->mRedirectUri:Ljava/lang/String;

    .line 27
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
    .line 53
    invoke-super {p0}, Lcom/amazon/identity/auth/device/endpoint/AbstractOauthTokenRequest;->addRequestInfoParameters()V

    .line 54
    iget-object v0, p0, Lcom/amazon/identity/auth/device/endpoint/OauthCodeForTokenRequest;->postParameters:Ljava/util/List;

    new-instance v1, Lorg/apache/http/message/BasicNameValuePair;

    const-string v2, "code"

    iget-object v3, p0, Lcom/amazon/identity/auth/device/endpoint/OauthCodeForTokenRequest;->mCode:Ljava/lang/String;

    invoke-direct {v1, v2, v3}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 56
    iget-object v0, p0, Lcom/amazon/identity/auth/device/endpoint/OauthCodeForTokenRequest;->postParameters:Ljava/util/List;

    new-instance v1, Lorg/apache/http/message/BasicNameValuePair;

    const-string v2, "redirect_uri"

    iget-object v3, p0, Lcom/amazon/identity/auth/device/endpoint/OauthCodeForTokenRequest;->mRedirectUri:Ljava/lang/String;

    invoke-direct {v1, v2, v3}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 57
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
    .line 46
    sget-object v0, Lcom/amazon/identity/auth/device/endpoint/OauthCodeForTokenRequest;->LOG_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Oauth Code for Token Exchange executeRequest. redirectUri="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/identity/auth/device/endpoint/OauthCodeForTokenRequest;->mRedirectUri:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " appId="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/endpoint/OauthCodeForTokenRequest;->getAppFamilyId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "code="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/amazon/identity/auth/device/endpoint/OauthCodeForTokenRequest;->mCode:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/amazon/identity/auth/device/utils/MAPLog;->pii(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    invoke-super {p0}, Lcom/amazon/identity/auth/device/endpoint/AbstractOauthTokenRequest;->executeRequest()Lorg/apache/http/HttpResponse;

    move-result-object v0

    return-object v0
.end method

.method protected generateTokenResponse(Lorg/apache/http/HttpResponse;)Lcom/amazon/identity/auth/device/endpoint/TokenResponse;
    .locals 2
    .param p1, "httpResponse"    # Lorg/apache/http/HttpResponse;

    .prologue
    .line 36
    new-instance v0, Lcom/amazon/identity/auth/device/endpoint/OauthCodeForTokenResponse;

    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/endpoint/OauthCodeForTokenRequest;->getAppFamilyId()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lcom/amazon/identity/auth/device/endpoint/OauthCodeForTokenResponse;-><init>(Lorg/apache/http/HttpResponse;Ljava/lang/String;)V

    return-object v0
.end method

.method public getGrantType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 31
    const-string v0, "authorization_code"

    return-object v0
.end method
