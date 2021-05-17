.class public Lcom/amazon/identity/auth/device/token/AccessAtzToken;
.super Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;
.source "AccessAtzToken.java"


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 45
    invoke-direct {p0}, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;-><init>()V

    .line 46
    sget-object v0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$AUTHZ_TOKEN_TYPE;->ACCESS:Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$AUTHZ_TOKEN_TYPE;

    iput-object v0, p0, Lcom/amazon/identity/auth/device/token/AccessAtzToken;->mType:Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$AUTHZ_TOKEN_TYPE;

    .line 47
    return-void
.end method

.method private constructor <init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;Ljava/util/Date;[B)V
    .locals 8
    .param p1, "id"    # J
    .param p3, "appId"    # Ljava/lang/String;
    .param p4, "directedId"    # Ljava/lang/String;
    .param p5, "tokenValue"    # Ljava/lang/String;
    .param p6, "creationTime"    # Ljava/util/Date;
    .param p7, "expirationTime"    # Ljava/util/Date;
    .param p8, "miscData"    # [B

    .prologue
    .line 27
    sget-object v7, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$AUTHZ_TOKEN_TYPE;->ACCESS:Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$AUTHZ_TOKEN_TYPE;

    move-object v0, p0

    move-object v1, p3

    move-object v2, p4

    move-object v3, p5

    move-object v4, p6

    move-object v5, p7

    move-object/from16 v6, p8

    invoke-direct/range {v0 .. v7}, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;Ljava/util/Date;[BLcom/amazon/identity/auth/device/dataobject/AuthorizationToken$AUTHZ_TOKEN_TYPE;)V

    .line 28
    invoke-virtual {p0, p1, p2}, Lcom/amazon/identity/auth/device/token/AccessAtzToken;->setId(J)V

    .line 29
    return-void
.end method

.method public constructor <init>(Lcom/amazon/identity/auth/device/token/AccessAtzToken;)V
    .locals 10
    .param p1, "token"    # Lcom/amazon/identity/auth/device/token/AccessAtzToken;

    .prologue
    .line 39
    invoke-virtual {p1}, Lcom/amazon/identity/auth/device/token/AccessAtzToken;->getId()J

    move-result-wide v1

    invoke-virtual {p1}, Lcom/amazon/identity/auth/device/token/AccessAtzToken;->getAppFamilyId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Lcom/amazon/identity/auth/device/token/AccessAtzToken;->getDirectedId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1}, Lcom/amazon/identity/auth/device/token/AccessAtzToken;->getTokenValue()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/util/Date;

    invoke-virtual {p1}, Lcom/amazon/identity/auth/device/token/AccessAtzToken;->getCreationTime()Ljava/util/Date;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v7

    invoke-direct {v6, v7, v8}, Ljava/util/Date;-><init>(J)V

    new-instance v7, Ljava/util/Date;

    invoke-virtual {p1}, Lcom/amazon/identity/auth/device/token/AccessAtzToken;->getExpirationTime()Ljava/util/Date;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v8

    invoke-direct {v7, v8, v9}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {p1}, Lcom/amazon/identity/auth/device/token/AccessAtzToken;->getMiscData()[B

    move-result-object v8

    move-object v0, p0

    invoke-direct/range {v0 .. v8}, Lcom/amazon/identity/auth/device/token/AccessAtzToken;-><init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;Ljava/util/Date;[B)V

    .line 42
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J[B)V
    .locals 8
    .param p1, "appId"    # Ljava/lang/String;
    .param p2, "directedId"    # Ljava/lang/String;
    .param p3, "tokenValue"    # Ljava/lang/String;
    .param p4, "expiresIn"    # J
    .param p6, "miscData"    # [B

    .prologue
    .line 13
    new-instance v4, Ljava/util/Date;

    invoke-direct {v4}, Ljava/util/Date;-><init>()V

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-wide v5, p4

    move-object v7, p6

    invoke-direct/range {v0 .. v7}, Lcom/amazon/identity/auth/device/token/AccessAtzToken;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;J[B)V

    .line 14
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;J[B)V
    .locals 7
    .param p1, "appId"    # Ljava/lang/String;
    .param p2, "directedId"    # Ljava/lang/String;
    .param p3, "tokenValue"    # Ljava/lang/String;
    .param p4, "creationTime"    # Ljava/util/Date;
    .param p5, "expiresIn"    # J
    .param p7, "miscData"    # [B

    .prologue
    .line 17
    new-instance v5, Ljava/util/Date;

    invoke-virtual {p4}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    add-long/2addr v0, p5

    invoke-direct {v5, v0, v1}, Ljava/util/Date;-><init>(J)V

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v6, p7

    invoke-direct/range {v0 .. v6}, Lcom/amazon/identity/auth/device/token/AccessAtzToken;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;Ljava/util/Date;[B)V

    .line 18
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;Ljava/util/Date;[B)V
    .locals 8
    .param p1, "appId"    # Ljava/lang/String;
    .param p2, "directedId"    # Ljava/lang/String;
    .param p3, "tokenValue"    # Ljava/lang/String;
    .param p4, "creationTime"    # Ljava/util/Date;
    .param p5, "expirationTime"    # Ljava/util/Date;
    .param p6, "miscData"    # [B

    .prologue
    .line 22
    sget-object v7, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$AUTHZ_TOKEN_TYPE;->ACCESS:Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$AUTHZ_TOKEN_TYPE;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    invoke-direct/range {v0 .. v7}, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;Ljava/util/Date;[BLcom/amazon/identity/auth/device/dataobject/AuthorizationToken$AUTHZ_TOKEN_TYPE;)V

    .line 23
    return-void
.end method
