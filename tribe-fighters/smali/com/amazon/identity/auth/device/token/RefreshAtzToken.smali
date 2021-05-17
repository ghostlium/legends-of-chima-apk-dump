.class public Lcom/amazon/identity/auth/device/token/RefreshAtzToken;
.super Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;
.source "RefreshAtzToken.java"


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 41
    invoke-direct {p0}, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;-><init>()V

    .line 42
    sget-object v0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$AUTHZ_TOKEN_TYPE;->REFRESH:Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$AUTHZ_TOKEN_TYPE;

    iput-object v0, p0, Lcom/amazon/identity/auth/device/token/RefreshAtzToken;->mType:Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$AUTHZ_TOKEN_TYPE;

    .line 43
    return-void
.end method

.method private constructor <init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;[B)V
    .locals 8
    .param p1, "id"    # J
    .param p3, "appId"    # Ljava/lang/String;
    .param p4, "directedId"    # Ljava/lang/String;
    .param p5, "tokenValue"    # Ljava/lang/String;
    .param p6, "creationTime"    # Ljava/util/Date;
    .param p7, "miscData"    # [B

    .prologue
    .line 23
    sget-object v7, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$AUTHZ_TOKEN_TYPE;->REFRESH:Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$AUTHZ_TOKEN_TYPE;

    move-object v0, p0

    move-object v1, p3

    move-object v2, p4

    move-object v3, p5

    move-object v4, p6

    move-object v5, p6

    move-object v6, p7

    invoke-direct/range {v0 .. v7}, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;Ljava/util/Date;[BLcom/amazon/identity/auth/device/dataobject/AuthorizationToken$AUTHZ_TOKEN_TYPE;)V

    .line 24
    invoke-virtual {p0, p1, p2}, Lcom/amazon/identity/auth/device/token/RefreshAtzToken;->setId(J)V

    .line 25
    return-void
.end method

.method public constructor <init>(Lcom/amazon/identity/auth/device/token/RefreshAtzToken;)V
    .locals 9
    .param p1, "token"    # Lcom/amazon/identity/auth/device/token/RefreshAtzToken;

    .prologue
    .line 35
    invoke-virtual {p1}, Lcom/amazon/identity/auth/device/token/RefreshAtzToken;->getId()J

    move-result-wide v1

    invoke-virtual {p1}, Lcom/amazon/identity/auth/device/token/RefreshAtzToken;->getAppFamilyId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Lcom/amazon/identity/auth/device/token/RefreshAtzToken;->getDirectedId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1}, Lcom/amazon/identity/auth/device/token/RefreshAtzToken;->getTokenValue()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/util/Date;

    invoke-virtual {p1}, Lcom/amazon/identity/auth/device/token/RefreshAtzToken;->getCreationTime()Ljava/util/Date;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v7

    invoke-direct {v6, v7, v8}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {p1}, Lcom/amazon/identity/auth/device/token/RefreshAtzToken;->getMiscData()[B

    move-result-object v7

    move-object v0, p0

    invoke-direct/range {v0 .. v7}, Lcom/amazon/identity/auth/device/token/RefreshAtzToken;-><init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;[B)V

    .line 38
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;[B)V
    .locals 8
    .param p1, "appId"    # Ljava/lang/String;
    .param p2, "directedId"    # Ljava/lang/String;
    .param p3, "tokenValue"    # Ljava/lang/String;
    .param p4, "creationTime"    # Ljava/util/Date;
    .param p5, "miscData"    # [B

    .prologue
    .line 18
    sget-object v7, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$AUTHZ_TOKEN_TYPE;->REFRESH:Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$AUTHZ_TOKEN_TYPE;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p4

    move-object v6, p5

    invoke-direct/range {v0 .. v7}, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;Ljava/util/Date;[BLcom/amazon/identity/auth/device/dataobject/AuthorizationToken$AUTHZ_TOKEN_TYPE;)V

    .line 19
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[B)V
    .locals 6
    .param p1, "appId"    # Ljava/lang/String;
    .param p2, "directedId"    # Ljava/lang/String;
    .param p3, "tokenValue"    # Ljava/lang/String;
    .param p4, "miscData"    # [B

    .prologue
    .line 10
    new-instance v4, Ljava/util/Date;

    invoke-direct {v4}, Ljava/util/Date;-><init>()V

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/amazon/identity/auth/device/token/RefreshAtzToken;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;[B)V

    .line 11
    return-void
.end method
