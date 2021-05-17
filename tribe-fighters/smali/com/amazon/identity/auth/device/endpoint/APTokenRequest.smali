.class public interface abstract Lcom/amazon/identity/auth/device/endpoint/APTokenRequest;
.super Ljava/lang/Object;
.source "APTokenRequest.java"

# interfaces
.implements Lcom/amazon/identity/auth/device/endpoint/RequestUrlBuilder;


# virtual methods
.method public abstract executeRequest()Lorg/apache/http/HttpResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/client/ClientProtocolException;,
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract getHeaders()[Lorg/apache/http/Header;
.end method

.method public abstract getHost(Landroid/os/Bundle;)Ljava/lang/String;
.end method

.method public abstract getPostParameters()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getVerbAsString()Ljava/lang/String;
.end method

.method public abstract initializeHeaders()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/identity/auth/device/AuthError;
        }
    .end annotation
.end method

.method public abstract initializeHttp()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/identity/auth/device/AuthError;
        }
    .end annotation
.end method

.method public abstract initializePostParams()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/identity/auth/device/AuthError;
        }
    .end annotation
.end method

.method public abstract initializeUserAgent()V
.end method

.method public abstract postExecute(Lorg/apache/http/HttpResponse;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/identity/auth/device/AuthError;
        }
    .end annotation
.end method

.method public abstract preExecute()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/identity/auth/device/AuthError;
        }
    .end annotation
.end method

.method public abstract setSocketTimeout(I)V
.end method

.method public abstract submit()Lcom/amazon/identity/auth/device/endpoint/TokenResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/identity/auth/device/AuthError;
        }
    .end annotation
.end method
