.class public interface abstract Lcom/amazon/identity/auth/device/endpoint/TokenResponse;
.super Ljava/lang/Object;
.source "TokenResponse.java"


# virtual methods
.method public abstract getStatusCode()I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/identity/auth/device/AuthError;
        }
    .end annotation
.end method

.method public abstract parse()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/identity/auth/device/AuthError;
        }
    .end annotation
.end method
