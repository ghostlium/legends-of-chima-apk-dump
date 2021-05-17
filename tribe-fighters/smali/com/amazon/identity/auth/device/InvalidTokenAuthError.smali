.class public Lcom/amazon/identity/auth/device/InvalidTokenAuthError;
.super Lcom/amazon/identity/auth/device/AuthError;
.source "InvalidTokenAuthError.java"


# static fields
.field private static final serialVersionUID:J = 0x1L


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "detailMessage"    # Ljava/lang/String;

    .prologue
    .line 10
    sget-object v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_INVALID_TOKEN:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    invoke-direct {p0, p1, v0}, Lcom/amazon/identity/auth/device/AuthError;-><init>(Ljava/lang/String;Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;)V

    .line 11
    return-void
.end method
