.class public Lcom/amazon/identity/auth/device/thread/DefaultAuthorizationListener;
.super Ljava/lang/Object;
.source "DefaultAuthorizationListener.java"

# interfaces
.implements Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;


# static fields
.field private static final LOG_TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 11
    const-class v0, Lcom/amazon/identity/auth/device/thread/DefaultAuthorizationListener;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/identity/auth/device/thread/DefaultAuthorizationListener;->LOG_TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "cause"    # Landroid/os/Bundle;

    .prologue
    .line 25
    sget-object v0, Lcom/amazon/identity/auth/device/thread/DefaultAuthorizationListener;->LOG_TAG:Ljava/lang/String;

    const-string v1, "onCancel"

    invoke-static {v0, v1}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 26
    return-void
.end method

.method public onError(Lcom/amazon/identity/auth/device/AuthError;)V
    .locals 2
    .param p1, "e"    # Lcom/amazon/identity/auth/device/AuthError;

    .prologue
    .line 20
    sget-object v0, Lcom/amazon/identity/auth/device/thread/DefaultAuthorizationListener;->LOG_TAG:Ljava/lang/String;

    const-string v1, "onError"

    invoke-static {v0, v1}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    return-void
.end method

.method public onSuccess(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "response"    # Landroid/os/Bundle;

    .prologue
    .line 15
    sget-object v0, Lcom/amazon/identity/auth/device/thread/DefaultAuthorizationListener;->LOG_TAG:Ljava/lang/String;

    const-string v1, "onSuccess"

    invoke-static {v0, v1}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 16
    return-void
.end method
