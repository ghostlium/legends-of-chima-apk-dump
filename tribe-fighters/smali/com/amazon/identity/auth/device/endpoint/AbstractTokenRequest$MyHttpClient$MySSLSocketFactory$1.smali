.class Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest$MyHttpClient$MySSLSocketFactory$1;
.super Ljava/lang/Object;
.source "AbstractTokenRequest.java"

# interfaces
.implements Ljavax/net/ssl/X509TrustManager;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest$MyHttpClient$MySSLSocketFactory;-><init>(Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest$MyHttpClient;Ljava/security/KeyStore;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest$MyHttpClient$MySSLSocketFactory;

.field final synthetic val$this$1:Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest$MyHttpClient;


# direct methods
.method constructor <init>(Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest$MyHttpClient$MySSLSocketFactory;Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest$MyHttpClient;)V
    .locals 0

    .prologue
    .line 422
    iput-object p1, p0, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest$MyHttpClient$MySSLSocketFactory$1;->this$2:Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest$MyHttpClient$MySSLSocketFactory;

    iput-object p2, p0, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest$MyHttpClient$MySSLSocketFactory$1;->val$this$1:Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest$MyHttpClient;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public checkClientTrusted([Ljava/security/cert/X509Certificate;Ljava/lang/String;)V
    .locals 0
    .param p1, "chain"    # [Ljava/security/cert/X509Certificate;
    .param p2, "authType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateException;
        }
    .end annotation

    .prologue
    .line 426
    return-void
.end method

.method public checkServerTrusted([Ljava/security/cert/X509Certificate;Ljava/lang/String;)V
    .locals 0
    .param p1, "chain"    # [Ljava/security/cert/X509Certificate;
    .param p2, "authType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateException;
        }
    .end annotation

    .prologue
    .line 431
    return-void
.end method

.method public getAcceptedIssuers()[Ljava/security/cert/X509Certificate;
    .locals 1

    .prologue
    .line 435
    const/4 v0, 0x0

    return-object v0
.end method
