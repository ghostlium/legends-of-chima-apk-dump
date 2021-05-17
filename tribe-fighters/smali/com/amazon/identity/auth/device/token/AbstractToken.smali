.class public abstract Lcom/amazon/identity/auth/device/token/AbstractToken;
.super Ljava/lang/Object;
.source "AbstractToken.java"

# interfaces
.implements Lcom/amazon/identity/auth/device/token/Token;


# static fields
.field private static final KEY_CREATION_TIME:Ljava/lang/String; = "creation_time"

.field private static final LOG_TAG:Ljava/lang/String;


# instance fields
.field private final _token:Ljava/lang/String;

.field protected final localCreationTimestamp:Landroid/text/format/Time;

.field protected tokenData:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 20
    const-class v0, Lcom/amazon/identity/auth/device/token/AbstractToken;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/identity/auth/device/token/AbstractToken;->LOG_TAG:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    new-instance v0, Landroid/text/format/Time;

    invoke-direct {v0}, Landroid/text/format/Time;-><init>()V

    iput-object v0, p0, Lcom/amazon/identity/auth/device/token/AbstractToken;->localCreationTimestamp:Landroid/text/format/Time;

    .line 30
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/amazon/identity/auth/device/token/AbstractToken;->_token:Ljava/lang/String;

    .line 31
    return-void
.end method

.method public constructor <init>(Lcom/amazon/identity/auth/device/token/AbstractToken;)V
    .locals 2
    .param p1, "token"    # Lcom/amazon/identity/auth/device/token/AbstractToken;

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    new-instance v0, Landroid/text/format/Time;

    invoke-direct {v0}, Landroid/text/format/Time;-><init>()V

    iput-object v0, p0, Lcom/amazon/identity/auth/device/token/AbstractToken;->localCreationTimestamp:Landroid/text/format/Time;

    .line 39
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/amazon/identity/auth/device/token/AbstractToken;->getToken()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 41
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Token string may not be null for an AbstractToken"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 43
    :cond_1
    invoke-virtual {p1}, Lcom/amazon/identity/auth/device/token/AbstractToken;->getToken()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/identity/auth/device/token/AbstractToken;->_token:Ljava/lang/String;

    .line 44
    iget-object v0, p0, Lcom/amazon/identity/auth/device/token/AbstractToken;->localCreationTimestamp:Landroid/text/format/Time;

    iget-object v1, p1, Lcom/amazon/identity/auth/device/token/AbstractToken;->localCreationTimestamp:Landroid/text/format/Time;

    invoke-virtual {v0, v1}, Landroid/text/format/Time;->set(Landroid/text/format/Time;)V

    .line 45
    new-instance v0, Ljava/util/HashMap;

    iget-object v1, p1, Lcom/amazon/identity/auth/device/token/AbstractToken;->tokenData:Ljava/util/Map;

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    iput-object v0, p0, Lcom/amazon/identity/auth/device/token/AbstractToken;->tokenData:Ljava/util/Map;

    .line 46
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "token"    # Ljava/lang/String;

    .prologue
    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    new-instance v0, Landroid/text/format/Time;

    invoke-direct {v0}, Landroid/text/format/Time;-><init>()V

    iput-object v0, p0, Lcom/amazon/identity/auth/device/token/AbstractToken;->localCreationTimestamp:Landroid/text/format/Time;

    .line 54
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 56
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Token string may not be null for an AbstractToken"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 58
    :cond_0
    iput-object p1, p0, Lcom/amazon/identity/auth/device/token/AbstractToken;->_token:Ljava/lang/String;

    .line 59
    iget-object v0, p0, Lcom/amazon/identity/auth/device/token/AbstractToken;->localCreationTimestamp:Landroid/text/format/Time;

    invoke-virtual {v0}, Landroid/text/format/Time;->setToNow()V

    .line 60
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/amazon/identity/auth/device/token/AbstractToken;->tokenData:Ljava/util/Map;

    .line 61
    invoke-direct {p0}, Lcom/amazon/identity/auth/device/token/AbstractToken;->initTokenData()V

    .line 62
    return-void
.end method

.method public constructor <init>(Ljava/util/Map;)V
    .locals 6
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
    const/4 v5, 0x0

    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    new-instance v2, Landroid/text/format/Time;

    invoke-direct {v2}, Landroid/text/format/Time;-><init>()V

    iput-object v2, p0, Lcom/amazon/identity/auth/device/token/AbstractToken;->localCreationTimestamp:Landroid/text/format/Time;

    .line 73
    const-string v2, "token"

    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iput-object v2, p0, Lcom/amazon/identity/auth/device/token/AbstractToken;->_token:Ljava/lang/String;

    .line 74
    iget-object v2, p0, Lcom/amazon/identity/auth/device/token/AbstractToken;->_token:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 76
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Token string may not be null for an AbstractToken"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 79
    :cond_0
    iput-object p1, p0, Lcom/amazon/identity/auth/device/token/AbstractToken;->tokenData:Ljava/util/Map;

    .line 82
    const-string v2, "creation_time"

    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 83
    .local v0, "creationTimeMillis":Ljava/lang/String;
    if-nez v0, :cond_1

    .line 84
    sget-object v2, Lcom/amazon/identity/auth/device/token/AbstractToken;->LOG_TAG:Ljava/lang/String;

    const-string v3, "creation_time not found in token data when creating Token, setting creation time to now"

    invoke-static {v2, v3}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 85
    iget-object v2, p0, Lcom/amazon/identity/auth/device/token/AbstractToken;->localCreationTimestamp:Landroid/text/format/Time;

    invoke-virtual {v2}, Landroid/text/format/Time;->setToNow()V

    .line 86
    const-string v2, "creation_time"

    iget-object v3, p0, Lcom/amazon/identity/auth/device/token/AbstractToken;->localCreationTimestamp:Landroid/text/format/Time;

    invoke-virtual {v3, v5}, Landroid/text/format/Time;->toMillis(Z)J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    invoke-interface {p1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    :goto_0
    return-void

    .line 90
    :cond_1
    :try_start_0
    iget-object v2, p0, Lcom/amazon/identity/auth/device/token/AbstractToken;->localCreationTimestamp:Landroid/text/format/Time;

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Landroid/text/format/Time;->set(J)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 91
    :catch_0
    move-exception v1

    .line 92
    .local v1, "e":Ljava/lang/NumberFormatException;
    sget-object v2, Lcom/amazon/identity/auth/device/token/AbstractToken;->LOG_TAG:Ljava/lang/String;

    const-string v3, "Unable to parse creation_time from token data when creating Token, setting creation time to now"

    invoke-static {v2, v3}, Lcom/amazon/identity/auth/device/utils/MAPLog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 93
    iget-object v2, p0, Lcom/amazon/identity/auth/device/token/AbstractToken;->localCreationTimestamp:Landroid/text/format/Time;

    invoke-virtual {v2}, Landroid/text/format/Time;->setToNow()V

    .line 94
    const-string v2, "creation_time"

    iget-object v3, p0, Lcom/amazon/identity/auth/device/token/AbstractToken;->localCreationTimestamp:Landroid/text/format/Time;

    invoke-virtual {v3, v5}, Landroid/text/format/Time;->toMillis(Z)J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    invoke-interface {p1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public static convertStringToRegionHint(Ljava/lang/String;)Lcom/amazon/identity/auth/device/AccountManagerConstants$REGION_HINT;
    .locals 1
    .param p0, "sRegionHint"    # Ljava/lang/String;

    .prologue
    .line 130
    sget-object v0, Lcom/amazon/identity/auth/device/AccountManagerConstants$REGION_HINT;->EU:Lcom/amazon/identity/auth/device/AccountManagerConstants$REGION_HINT;

    invoke-virtual {v0}, Lcom/amazon/identity/auth/device/AccountManagerConstants$REGION_HINT;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 132
    sget-object v0, Lcom/amazon/identity/auth/device/AccountManagerConstants$REGION_HINT;->EU:Lcom/amazon/identity/auth/device/AccountManagerConstants$REGION_HINT;

    .line 144
    :goto_0
    return-object v0

    .line 134
    :cond_0
    sget-object v0, Lcom/amazon/identity/auth/device/AccountManagerConstants$REGION_HINT;->FE:Lcom/amazon/identity/auth/device/AccountManagerConstants$REGION_HINT;

    invoke-virtual {v0}, Lcom/amazon/identity/auth/device/AccountManagerConstants$REGION_HINT;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 136
    sget-object v0, Lcom/amazon/identity/auth/device/AccountManagerConstants$REGION_HINT;->FE:Lcom/amazon/identity/auth/device/AccountManagerConstants$REGION_HINT;

    goto :goto_0

    .line 138
    :cond_1
    sget-object v0, Lcom/amazon/identity/auth/device/AccountManagerConstants$REGION_HINT;->CN:Lcom/amazon/identity/auth/device/AccountManagerConstants$REGION_HINT;

    invoke-virtual {v0}, Lcom/amazon/identity/auth/device/AccountManagerConstants$REGION_HINT;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 140
    sget-object v0, Lcom/amazon/identity/auth/device/AccountManagerConstants$REGION_HINT;->CN:Lcom/amazon/identity/auth/device/AccountManagerConstants$REGION_HINT;

    goto :goto_0

    .line 144
    :cond_2
    sget-object v0, Lcom/amazon/identity/auth/device/AccountManagerConstants$REGION_HINT;->NA:Lcom/amazon/identity/auth/device/AccountManagerConstants$REGION_HINT;

    goto :goto_0
.end method

.method private initTokenData()V
    .locals 4

    .prologue
    .line 151
    iget-object v0, p0, Lcom/amazon/identity/auth/device/token/AbstractToken;->tokenData:Ljava/util/Map;

    const-string v1, "token"

    iget-object v2, p0, Lcom/amazon/identity/auth/device/token/AbstractToken;->_token:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 152
    iget-object v0, p0, Lcom/amazon/identity/auth/device/token/AbstractToken;->tokenData:Ljava/util/Map;

    const-string v1, "creation_time"

    iget-object v2, p0, Lcom/amazon/identity/auth/device/token/AbstractToken;->localCreationTimestamp:Landroid/text/format/Time;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/text/format/Time;->toMillis(Z)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 153
    return-void
.end method

.method protected static millisToSecs(J)J
    .locals 2
    .param p0, "milliSeconds"    # J

    .prologue
    .line 162
    const-wide/16 v0, 0x3e8

    div-long v0, p0, v0

    return-wide v0
.end method

.method public static secsToMillis(J)J
    .locals 2
    .param p0, "seconds"    # J

    .prologue
    .line 157
    const-wide/16 v0, 0x3e8

    mul-long/2addr v0, p0

    return-wide v0
.end method


# virtual methods
.method public final getData()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 120
    iget-object v0, p0, Lcom/amazon/identity/auth/device/token/AbstractToken;->tokenData:Ljava/util/Map;

    return-object v0
.end method

.method public getDirectedId()Ljava/lang/String;
    .locals 2

    .prologue
    .line 168
    iget-object v0, p0, Lcom/amazon/identity/auth/device/token/AbstractToken;->tokenData:Ljava/util/Map;

    const-string v1, "directedid"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getLocalTimestamp()Landroid/text/format/Time;
    .locals 1

    .prologue
    .line 106
    iget-object v0, p0, Lcom/amazon/identity/auth/device/token/AbstractToken;->localCreationTimestamp:Landroid/text/format/Time;

    return-object v0
.end method

.method protected final getToken()Ljava/lang/String;
    .locals 1

    .prologue
    .line 110
    iget-object v0, p0, Lcom/amazon/identity/auth/device/token/AbstractToken;->_token:Ljava/lang/String;

    return-object v0
.end method
