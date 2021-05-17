.class public Lcom/amazon/identity/auth/device/token/AccessToken;
.super Lcom/amazon/identity/auth/device/token/AbstractToken;
.source "AccessToken.java"


# static fields
.field public static final ALWAYS_EXPIRE:J = -0x1L

.field private static final KEY_EXPIRES_IN:Ljava/lang/String; = "expires_in"

.field private static final LOG_TAG:Ljava/lang/String;

.field public static final NEVER_EXPIRE:J = 0x0L

.field protected static final PRE_EXPIRATION_PERIOD:J = 0x12cL


# instance fields
.field private _expirationTime:Landroid/text/format/Time;

.field private _expiresIn:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 20
    const-class v0, Lcom/amazon/identity/auth/device/token/AccessToken;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/identity/auth/device/token/AccessToken;->LOG_TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "token"    # Ljava/lang/String;
    .param p2, "directedId"    # Ljava/lang/String;

    .prologue
    .line 34
    const-wide/16 v0, 0x0

    invoke-direct {p0, p1, p2, v0, v1}, Lcom/amazon/identity/auth/device/token/AccessToken;-><init>(Ljava/lang/String;Ljava/lang/String;J)V

    .line 35
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;J)V
    .locals 4
    .param p1, "token"    # Ljava/lang/String;
    .param p2, "directedId"    # Ljava/lang/String;
    .param p3, "expiresIn"    # J

    .prologue
    .line 39
    invoke-direct {p0, p1}, Lcom/amazon/identity/auth/device/token/AbstractToken;-><init>(Ljava/lang/String;)V

    .line 29
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/amazon/identity/auth/device/token/AccessToken;->_expiresIn:J

    .line 40
    sget-object v0, Lcom/amazon/identity/auth/device/token/AccessToken;->LOG_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Creating Token "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/token/AccessToken;->getType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "expiresIn="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "directedId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/amazon/identity/auth/device/utils/MAPLog;->pii(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 43
    iget-object v0, p0, Lcom/amazon/identity/auth/device/token/AccessToken;->tokenData:Ljava/util/Map;

    const-string v1, "directedid"

    invoke-interface {v0, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    :cond_0
    invoke-direct {p0, p3, p4}, Lcom/amazon/identity/auth/device/token/AccessToken;->initExpirationData(J)V

    .line 46
    return-void
.end method

.method public constructor <init>(Ljava/util/Map;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/identity/auth/device/AuthError;
        }
    .end annotation

    .prologue
    .local p1, "tokenData":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-wide/16 v6, 0x0

    .line 55
    invoke-direct {p0, p1}, Lcom/amazon/identity/auth/device/token/AbstractToken;-><init>(Ljava/util/Map;)V

    .line 29
    iput-wide v6, p0, Lcom/amazon/identity/auth/device/token/AccessToken;->_expiresIn:J

    .line 57
    const-string v4, "directedid"

    invoke-interface {p1, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 59
    sget-object v4, Lcom/amazon/identity/auth/device/token/AccessToken;->LOG_TAG:Ljava/lang/String;

    const-string v5, "No DirectedId available for AccessToken"

    invoke-static {v4, v5}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 60
    new-instance v4, Lcom/amazon/identity/auth/device/AuthError;

    const-string v5, "No DirectedId available for AccessToken"

    const/4 v6, 0x0

    sget-object v7, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_BAD_PARAM:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    invoke-direct {v4, v5, v6, v7}, Lcom/amazon/identity/auth/device/AuthError;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;)V

    throw v4

    .line 65
    :cond_0
    const-string v4, "expires_in"

    invoke-interface {p1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 66
    .local v3, "expiresInStr":Ljava/lang/String;
    if-nez v3, :cond_1

    .line 67
    sget-object v4, Lcom/amazon/identity/auth/device/token/AccessToken;->LOG_TAG:Ljava/lang/String;

    const-string v5, "expires_in not found in token data when creating AccessToken, token will not expire locally"

    invoke-static {v4, v5}, Lcom/amazon/identity/auth/device/utils/MAPLog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 68
    const-wide/16 v1, 0x0

    .line 69
    .local v1, "expiresIn":J
    const-string v4, "expires_in"

    invoke-static {v6, v7}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    invoke-interface {p1, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    :goto_0
    sget-object v4, Lcom/amazon/identity/auth/device/token/AccessToken;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Creating Token "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/token/AccessToken;->getType()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " from data expires="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "directedId="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/token/AccessToken;->getDirectedId()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lcom/amazon/identity/auth/device/utils/MAPLog;->pii(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 82
    invoke-virtual {p0, v1, v2}, Lcom/amazon/identity/auth/device/token/AccessToken;->setExpirationTime(J)V

    .line 83
    return-void

    .line 73
    .end local v1    # "expiresIn":J
    :cond_1
    :try_start_0
    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v1

    .restart local v1    # "expiresIn":J
    goto :goto_0

    .line 74
    .end local v1    # "expiresIn":J
    :catch_0
    move-exception v0

    .line 75
    .local v0, "e":Ljava/lang/NumberFormatException;
    sget-object v4, Lcom/amazon/identity/auth/device/token/AccessToken;->LOG_TAG:Ljava/lang/String;

    const-string v5, "Unable to parse expires_in from token data when creating AccessToken, token will not expire locally"

    invoke-static {v4, v5}, Lcom/amazon/identity/auth/device/utils/MAPLog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 76
    const-wide/16 v1, 0x0

    .line 77
    .restart local v1    # "expiresIn":J
    const-string v4, "expires_in"

    invoke-static {v6, v7}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    invoke-interface {p1, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method private initExpirationData(J)V
    .locals 3
    .param p1, "expiresIn"    # J

    .prologue
    .line 150
    invoke-virtual {p0, p1, p2}, Lcom/amazon/identity/auth/device/token/AccessToken;->setExpirationTime(J)V

    .line 151
    iget-object v0, p0, Lcom/amazon/identity/auth/device/token/AccessToken;->tokenData:Ljava/util/Map;

    const-string v1, "expires_in"

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 152
    return-void
.end method


# virtual methods
.method protected getCurrentTime()Landroid/text/format/Time;
    .locals 1

    .prologue
    .line 158
    new-instance v0, Landroid/text/format/Time;

    invoke-direct {v0}, Landroid/text/format/Time;-><init>()V

    .line 159
    .local v0, "currentTime":Landroid/text/format/Time;
    invoke-virtual {v0}, Landroid/text/format/Time;->setToNow()V

    .line 160
    return-object v0
.end method

.method public getExpiresIn()J
    .locals 2

    .prologue
    .line 191
    iget-wide v0, p0, Lcom/amazon/identity/auth/device/token/AccessToken;->_expiresIn:J

    return-wide v0
.end method

.method protected getPreExpirationPeriod()J
    .locals 2

    .prologue
    .line 167
    const-wide/16 v0, 0x12c

    return-wide v0
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 176
    const-string v0, "com.amazon.identity.token.accessToken"

    return-object v0
.end method

.method public hasExpired()Z
    .locals 7

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 119
    const-wide/16 v3, 0x0

    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/token/AccessToken;->getExpiresIn()J

    move-result-wide v5

    cmp-long v3, v3, v5

    if-nez v3, :cond_1

    .line 130
    :cond_0
    :goto_0
    return v1

    .line 121
    :cond_1
    const-wide/16 v3, -0x1

    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/token/AccessToken;->getExpiresIn()J

    move-result-wide v5

    cmp-long v3, v3, v5

    if-nez v3, :cond_2

    move v1, v2

    .line 122
    goto :goto_0

    .line 126
    :cond_2
    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/token/AccessToken;->getCurrentTime()Landroid/text/format/Time;

    move-result-object v0

    .line 127
    .local v0, "currentTime":Landroid/text/format/Time;
    iget-object v3, p0, Lcom/amazon/identity/auth/device/token/AccessToken;->_expirationTime:Landroid/text/format/Time;

    invoke-static {v0, v3}, Landroid/text/format/Time;->compare(Landroid/text/format/Time;Landroid/text/format/Time;)I

    move-result v3

    if-ltz v3, :cond_0

    move v1, v2

    .line 128
    goto :goto_0
.end method

.method public neverExpire()Z
    .locals 4

    .prologue
    .line 142
    const-wide/16 v0, 0x0

    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/token/AccessToken;->getExpiresIn()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected setExpirationTime(J)V
    .locals 7
    .param p1, "expiresIn"    # J

    .prologue
    const-wide/16 v5, -0x1

    const/4 v4, 0x0

    .line 92
    iput-wide p1, p0, Lcom/amazon/identity/auth/device/token/AccessToken;->_expiresIn:J

    .line 93
    const-wide/16 v2, 0x0

    cmp-long v2, p1, v2

    if-nez v2, :cond_0

    .line 95
    iput-object v4, p0, Lcom/amazon/identity/auth/device/token/AccessToken;->_expirationTime:Landroid/text/format/Time;

    .line 109
    :goto_0
    sget-object v2, Lcom/amazon/identity/auth/device/token/AccessToken;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Expiration Time:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/amazon/identity/auth/device/token/AccessToken;->_expirationTime:Landroid/text/format/Time;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 110
    return-void

    .line 96
    :cond_0
    cmp-long v2, p1, v5

    if-gtz v2, :cond_1

    .line 98
    iput-wide v5, p0, Lcom/amazon/identity/auth/device/token/AccessToken;->_expiresIn:J

    .line 99
    iput-object v4, p0, Lcom/amazon/identity/auth/device/token/AccessToken;->_expirationTime:Landroid/text/format/Time;

    goto :goto_0

    .line 103
    :cond_1
    new-instance v2, Landroid/text/format/Time;

    invoke-direct {v2}, Landroid/text/format/Time;-><init>()V

    iput-object v2, p0, Lcom/amazon/identity/auth/device/token/AccessToken;->_expirationTime:Landroid/text/format/Time;

    .line 106
    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/token/AccessToken;->getLocalTimestamp()Landroid/text/format/Time;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/text/format/Time;->toMillis(Z)J

    move-result-wide v2

    invoke-static {p1, p2}, Lcom/amazon/identity/auth/device/token/AccessToken;->secsToMillis(J)J

    move-result-wide v4

    add-long/2addr v2, v4

    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/token/AccessToken;->getPreExpirationPeriod()J

    move-result-wide v4

    invoke-static {v4, v5}, Lcom/amazon/identity/auth/device/token/AccessToken;->secsToMillis(J)J

    move-result-wide v4

    sub-long v0, v2, v4

    .line 107
    .local v0, "expireAt":J
    iget-object v2, p0, Lcom/amazon/identity/auth/device/token/AccessToken;->_expirationTime:Landroid/text/format/Time;

    invoke-virtual {v2, v0, v1}, Landroid/text/format/Time;->set(J)V

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 184
    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/token/AccessToken;->getToken()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
