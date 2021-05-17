.class public Lcom/flurry/android/FlurryWallet;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field protected static EMAIL_END:Ljava/lang/String;

.field private static cI:Lcom/flurry/android/AppCloudUser;

.field private static mContext:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 16
    sput-object v0, Lcom/flurry/android/FlurryWallet;->mContext:Landroid/content/Context;

    .line 17
    sput-object v0, Lcom/flurry/android/FlurryWallet;->cI:Lcom/flurry/android/AppCloudUser;

    .line 20
    const-string v0, ".flurry.com"

    sput-object v0, Lcom/flurry/android/FlurryWallet;->EMAIL_END:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic a(Lcom/flurry/android/AppCloudUser;)Lcom/flurry/android/AppCloudUser;
    .locals 0

    .prologue
    .line 14
    sput-object p0, Lcom/flurry/android/FlurryWallet;->cI:Lcom/flurry/android/AppCloudUser;

    return-object p0
.end method

.method private static a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/flurry/android/FlurryWalletHandler;)V
    .locals 2

    .prologue
    .line 79
    const/4 v0, 0x1

    :try_start_0
    new-instance v1, Lcom/flurry/android/di;

    invoke-direct {v1, p3, p4}, Lcom/flurry/android/di;-><init>(Ljava/lang/String;Lcom/flurry/android/FlurryWalletHandler;)V

    invoke-static {p0, p1, p2, v0, v1}, Lcom/flurry/android/AppCloudUser;->loginUserWithName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLcom/flurry/android/responses/AppCloudLoginResponseHandler;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 97
    :goto_0
    return-void

    .line 94
    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public static addObserverForCurrecyKey(Ljava/lang/String;Lcom/flurry/android/FlurryWalletHandler;)V
    .locals 3

    .prologue
    .line 33
    invoke-static {}, Lcom/flurry/android/dy;->aq()Ljava/lang/String;

    move-result-object v0

    .line 34
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 35
    const-string v0, "FlurryWallet"

    const-string v1, "There is no last logged in user"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 36
    invoke-static {}, Lcom/flurry/android/FlurryWallet;->generateDeviceId()Ljava/lang/String;

    move-result-object v0

    .line 40
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "@"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lcom/flurry/android/FlurryWallet;->EMAIL_END:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 41
    invoke-static {v0, v0, v1, p0, p1}, Lcom/flurry/android/FlurryWallet;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/flurry/android/FlurryWalletHandler;)V

    .line 55
    :goto_0
    return-void

    .line 44
    :cond_0
    invoke-static {}, Lcom/flurry/android/FlurryWallet;->isLastLoggedInUserFake()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 45
    invoke-static {}, Lcom/flurry/android/dy;->ar()Ljava/lang/String;

    move-result-object v0

    .line 46
    invoke-static {}, Lcom/flurry/android/dy;->as()Ljava/lang/String;

    move-result-object v1

    .line 47
    invoke-static {v0, v0, v1, p0, p1}, Lcom/flurry/android/FlurryWallet;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/flurry/android/FlurryWalletHandler;)V

    goto :goto_0

    .line 51
    :cond_1
    invoke-static {}, Lcom/flurry/android/dy;->au()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/flurry/android/FlurryAppCloud;->UserSession:Ljava/lang/String;

    .line 52
    invoke-static {p0, v0, p1}, Lcom/flurry/android/FlurryWallet;->addObserverForUser(Ljava/lang/String;Ljava/lang/String;Lcom/flurry/android/FlurryWalletHandler;)V

    goto :goto_0
.end method

.method protected static addObserverForUser(Ljava/lang/String;Ljava/lang/String;Lcom/flurry/android/FlurryWalletHandler;)V
    .locals 2

    .prologue
    .line 101
    sget-object v0, Lcom/flurry/android/FlurryWallet;->cI:Lcom/flurry/android/AppCloudUser;

    if-nez v0, :cond_0

    .line 102
    invoke-static {}, Lcom/flurry/android/dy;->ap()Lcom/flurry/android/AppCloudUser;

    move-result-object v0

    sput-object v0, Lcom/flurry/android/FlurryWallet;->cI:Lcom/flurry/android/AppCloudUser;

    .line 105
    :cond_0
    sget-object v0, Lcom/flurry/android/FlurryWallet;->cI:Lcom/flurry/android/AppCloudUser;

    invoke-virtual {v0, p0, p2}, Lcom/flurry/android/AppCloudUser;->addObserverForKey(Ljava/lang/String;Lcom/flurry/android/AppCloudValueUpdateHandler;)V

    .line 106
    sget-object v0, Lcom/flurry/android/FlurryWallet;->cI:Lcom/flurry/android/AppCloudUser;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/flurry/android/AppCloudUser;->setAutoSyncEnabled(Z)Z

    .line 107
    return-void
.end method

.method static f(Landroid/content/Context;)V
    .locals 0

    .prologue
    .line 23
    sput-object p0, Lcom/flurry/android/FlurryWallet;->mContext:Landroid/content/Context;

    .line 24
    return-void
.end method

.method protected static generateDeviceId()Ljava/lang/String;
    .locals 8

    .prologue
    .line 110
    sget-object v0, Lcom/flurry/android/FlurryWallet;->mContext:Landroid/content/Context;

    const-string v1, "phone"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    .line 113
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getDeviceId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 114
    const-string v1, ""

    .line 115
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lcom/flurry/android/FlurryWallet;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v4, "android_id"

    invoke-static {v3, v4}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 117
    new-instance v3, Ljava/util/UUID;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    int-to-long v4, v2

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    int-to-long v6, v0

    const/16 v0, 0x20

    shl-long/2addr v6, v0

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v0

    int-to-long v0, v0

    or-long/2addr v0, v6

    invoke-direct {v3, v4, v5, v0, v1}, Ljava/util/UUID;-><init>(JJ)V

    .line 118
    invoke-virtual {v3}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    .line 119
    return-object v0
.end method

.method protected static isLastLoggedInUserFake()Z
    .locals 4

    .prologue
    .line 58
    invoke-static {}, Lcom/flurry/android/dy;->ar()Ljava/lang/String;

    move-result-object v0

    .line 59
    invoke-static {}, Lcom/flurry/android/dy;->as()Ljava/lang/String;

    move-result-object v1

    .line 60
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "@"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v2, Lcom/flurry/android/FlurryWallet;->EMAIL_END:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 61
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 62
    const-string v0, "FlurryWallet"

    const-string v1, "Last logged in user is fake"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 63
    const/4 v0, 0x1

    .line 67
    :goto_0
    return v0

    .line 66
    :cond_0
    const-string v0, "FlurryWallet"

    const-string v1, "Last logged in user is real one"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 67
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static removeAllObservers()Z
    .locals 1

    .prologue
    .line 157
    invoke-static {}, Lcom/flurry/android/dy;->ap()Lcom/flurry/android/AppCloudUser;

    move-result-object v0

    .line 158
    if-eqz v0, :cond_0

    .line 159
    invoke-virtual {v0}, Lcom/flurry/android/AppCloudUser;->removeAllObservers()Z

    move-result v0

    .line 162
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static removeObserver(Lcom/flurry/android/FlurryWalletHandler;)Z
    .locals 1

    .prologue
    .line 144
    invoke-static {}, Lcom/flurry/android/dy;->ap()Lcom/flurry/android/AppCloudUser;

    move-result-object v0

    .line 145
    if-eqz v0, :cond_0

    .line 146
    invoke-virtual {v0, p0}, Lcom/flurry/android/AppCloudUser;->removeObserver(Lcom/flurry/android/AppCloudValueUpdateHandler;)Z

    move-result v0

    .line 149
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static removeObserversForCurrecyKey(Ljava/lang/String;)Z
    .locals 1

    .prologue
    .line 129
    invoke-static {}, Lcom/flurry/android/dy;->ap()Lcom/flurry/android/AppCloudUser;

    move-result-object v0

    .line 130
    if-eqz v0, :cond_0

    .line 131
    invoke-virtual {v0, p0}, Lcom/flurry/android/AppCloudUser;->removeObserverForKey(Ljava/lang/String;)Z

    move-result v0

    .line 134
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
