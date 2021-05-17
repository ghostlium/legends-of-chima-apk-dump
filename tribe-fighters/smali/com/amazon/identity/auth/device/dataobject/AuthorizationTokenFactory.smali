.class public final Lcom/amazon/identity/auth/device/dataobject/AuthorizationTokenFactory;
.super Ljava/lang/Object;
.source "AuthorizationTokenFactory.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/amazon/identity/auth/device/dataobject/AuthorizationTokenFactory$1;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    return-void
.end method

.method public static getAuthorizationToken(Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$AUTHZ_TOKEN_TYPE;)Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;
    .locals 4
    .param p0, "type"    # Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$AUTHZ_TOKEN_TYPE;

    .prologue
    .line 15
    sget-object v1, Lcom/amazon/identity/auth/device/dataobject/AuthorizationTokenFactory$1;->$SwitchMap$com$amazon$identity$auth$device$dataobject$AuthorizationToken$AUTHZ_TOKEN_TYPE:[I

    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$AUTHZ_TOKEN_TYPE;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 24
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unknown token type for factory "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 18
    :pswitch_0
    new-instance v0, Lcom/amazon/identity/auth/device/token/AccessAtzToken;

    invoke-direct {v0}, Lcom/amazon/identity/auth/device/token/AccessAtzToken;-><init>()V

    .line 26
    .local v0, "token":Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;
    :goto_0
    return-object v0

    .line 21
    .end local v0    # "token":Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;
    :pswitch_1
    new-instance v0, Lcom/amazon/identity/auth/device/token/RefreshAtzToken;

    invoke-direct {v0}, Lcom/amazon/identity/auth/device/token/RefreshAtzToken;-><init>()V

    .line 22
    .restart local v0    # "token":Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;
    goto :goto_0

    .line 15
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public static getCopyAuthorizationToken(Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;)Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;
    .locals 4
    .param p0, "token"    # Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;

    .prologue
    .line 32
    sget-object v1, Lcom/amazon/identity/auth/device/dataobject/AuthorizationTokenFactory$1;->$SwitchMap$com$amazon$identity$auth$device$dataobject$AuthorizationToken$AUTHZ_TOKEN_TYPE:[I

    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->getTypeAsEnum()Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$AUTHZ_TOKEN_TYPE;

    move-result-object v2

    invoke-virtual {v2}, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$AUTHZ_TOKEN_TYPE;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 41
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unknown token type for copy "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->getType()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 35
    :pswitch_0
    new-instance v0, Lcom/amazon/identity/auth/device/token/AccessAtzToken;

    check-cast p0, Lcom/amazon/identity/auth/device/token/AccessAtzToken;

    .end local p0    # "token":Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;
    invoke-direct {v0, p0}, Lcom/amazon/identity/auth/device/token/AccessAtzToken;-><init>(Lcom/amazon/identity/auth/device/token/AccessAtzToken;)V

    .line 43
    .local v0, "returnToken":Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;
    :goto_0
    return-object v0

    .line 38
    .end local v0    # "returnToken":Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;
    .restart local p0    # "token":Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;
    :pswitch_1
    new-instance v0, Lcom/amazon/identity/auth/device/token/RefreshAtzToken;

    check-cast p0, Lcom/amazon/identity/auth/device/token/RefreshAtzToken;

    .end local p0    # "token":Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;
    invoke-direct {v0, p0}, Lcom/amazon/identity/auth/device/token/RefreshAtzToken;-><init>(Lcom/amazon/identity/auth/device/token/RefreshAtzToken;)V

    .line 39
    .restart local v0    # "returnToken":Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;
    goto :goto_0

    .line 32
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
