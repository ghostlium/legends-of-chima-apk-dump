.class public Lcom/amazon/identity/auth/device/thread/CallbackErrorException;
.super Ljava/util/concurrent/ExecutionException;
.source "CallbackErrorException.java"


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private final mErrorBundleBytes:[B


# direct methods
.method public constructor <init>(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "errorBundle"    # Landroid/os/Bundle;

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/util/concurrent/ExecutionException;-><init>()V

    .line 19
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 20
    .local v0, "parcel":Landroid/os/Parcel;
    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeBundle(Landroid/os/Bundle;)V

    .line 21
    invoke-virtual {v0}, Landroid/os/Parcel;->marshall()[B

    move-result-object v1

    iput-object v1, p0, Lcom/amazon/identity/auth/device/thread/CallbackErrorException;->mErrorBundleBytes:[B

    .line 22
    return-void
.end method


# virtual methods
.method public getErrorBundle()Landroid/os/Bundle;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 26
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 27
    .local v0, "parcel":Landroid/os/Parcel;
    iget-object v1, p0, Lcom/amazon/identity/auth/device/thread/CallbackErrorException;->mErrorBundleBytes:[B

    iget-object v2, p0, Lcom/amazon/identity/auth/device/thread/CallbackErrorException;->mErrorBundleBytes:[B

    array-length v2, v2

    invoke-virtual {v0, v1, v3, v2}, Landroid/os/Parcel;->unmarshall([BII)V

    .line 28
    invoke-virtual {v0, v3}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 29
    invoke-virtual {v0}, Landroid/os/Parcel;->readBundle()Landroid/os/Bundle;

    move-result-object v1

    return-object v1
.end method
