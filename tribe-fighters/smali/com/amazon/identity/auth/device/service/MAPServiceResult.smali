.class public final Lcom/amazon/identity/auth/device/service/MAPServiceResult;
.super Ljava/lang/Object;
.source "MAPServiceResult.java"


# direct methods
.method private constructor <init>()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    new-instance v0, Ljava/lang/Exception;

    const-string v1, "This class is not instantiable!"

    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static getOnCancelBundle(I[Ljava/lang/String;)Landroid/os/Bundle;
    .locals 2
    .param p0, "causeId"    # I
    .param p1, "rejectedScopes"    # [Ljava/lang/String;

    .prologue
    .line 24
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 26
    .local v0, "to_return":Landroid/os/Bundle;
    sget-object v1, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->CAUSE_ID:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    iget-object v1, v1, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->val:Ljava/lang/String;

    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 27
    const/4 v1, 0x1

    if-ne p0, v1, :cond_0

    if-eqz p1, :cond_0

    .line 28
    sget-object v1, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->REJECTED_SCOPE_LIST:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    iget-object v1, v1, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->val:Ljava/lang/String;

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putStringArray(Ljava/lang/String;[Ljava/lang/String;)V

    .line 31
    :cond_0
    return-object v0
.end method

.method public static getOnErrorBundle(Lcom/amazon/identity/auth/device/AuthError;)Landroid/os/Bundle;
    .locals 1
    .param p0, "e"    # Lcom/amazon/identity/auth/device/AuthError;

    .prologue
    .line 35
    invoke-static {p0}, Lcom/amazon/identity/auth/device/AuthError;->getErrorBundle(Lcom/amazon/identity/auth/device/AuthError;)Landroid/os/Bundle;

    move-result-object v0

    return-object v0
.end method

.method public static getOnSuccessBundle(Ljava/lang/String;Ljava/lang/String;)Landroid/os/Bundle;
    .locals 1
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 18
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 19
    .local v0, "to_return":Landroid/os/Bundle;
    invoke-virtual {v0, p0, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    return-object v0
.end method
