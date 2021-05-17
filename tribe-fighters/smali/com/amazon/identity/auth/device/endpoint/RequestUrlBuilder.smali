.class public interface abstract Lcom/amazon/identity/auth/device/endpoint/RequestUrlBuilder;
.super Ljava/lang/Object;
.source "RequestUrlBuilder.java"


# virtual methods
.method public abstract getDomain()Ljava/lang/String;
.end method

.method public abstract getPort()I
.end method

.method public abstract getRequestUrl()Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/identity/auth/device/AuthError;
        }
    .end annotation
.end method
