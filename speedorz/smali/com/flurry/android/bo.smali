.class final Lcom/flurry/android/bo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private Q:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/flurry/android/z;",
            ">;"
        }
    .end annotation
.end field

.field private dF:Z

.field private dG:J

.field private mCollectionName:Ljava/lang/String;

.field private mId:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput-object v2, p0, Lcom/flurry/android/bo;->mId:Ljava/lang/String;

    .line 22
    iput-object v2, p0, Lcom/flurry/android/bo;->mCollectionName:Ljava/lang/String;

    .line 24
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/flurry/android/bo;->dF:Z

    .line 25
    const-wide/16 v0, 0x3a98

    iput-wide v0, p0, Lcom/flurry/android/bo;->dG:J

    .line 61
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/flurry/android/bo;->Q:Ljava/util/HashMap;

    .line 81
    iput-object p1, p0, Lcom/flurry/android/bo;->mId:Ljava/lang/String;

    .line 82
    iput-object v2, p0, Lcom/flurry/android/bo;->mCollectionName:Ljava/lang/String;

    .line 83
    return-void
.end method

.method constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput-object v0, p0, Lcom/flurry/android/bo;->mId:Ljava/lang/String;

    .line 22
    iput-object v0, p0, Lcom/flurry/android/bo;->mCollectionName:Ljava/lang/String;

    .line 24
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/flurry/android/bo;->dF:Z

    .line 25
    const-wide/16 v0, 0x3a98

    iput-wide v0, p0, Lcom/flurry/android/bo;->dG:J

    .line 61
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/flurry/android/bo;->Q:Ljava/util/HashMap;

    .line 76
    iput-object p1, p0, Lcom/flurry/android/bo;->mId:Ljava/lang/String;

    .line 77
    iput-object p2, p0, Lcom/flurry/android/bo;->mCollectionName:Ljava/lang/String;

    .line 78
    return-void
.end method

.method private a(I)J
    .locals 2

    .prologue
    .line 356
    if-nez p1, :cond_0

    .line 357
    const-wide/16 v0, 0x0

    .line 360
    :goto_0
    return-wide v0

    :cond_0
    iget-wide v0, p0, Lcom/flurry/android/bo;->dG:J

    goto :goto_0
.end method

.method static synthetic a(Lcom/flurry/android/bo;Lcom/flurry/android/AppCloudResponse;Ljava/lang/String;)Z
    .locals 5

    .prologue
    const/16 v4, 0x195

    .line 17
    if-eqz p1, :cond_3

    invoke-virtual {p1}, Lcom/flurry/android/AppCloudResponse;->isSuccessful()Z

    move-result v0

    if-nez v0, :cond_3

    const-string v0, "invalid user session"

    invoke-virtual {p1}, Lcom/flurry/android/AppCloudResponse;->getResponseMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/flurry/android/bo;->Q:Ljava/util/HashMap;

    invoke-virtual {v0, p2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/flurry/android/bo;->Q:Ljava/util/HashMap;

    invoke-virtual {v0, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/z;

    iget-object v0, v0, Lcom/flurry/android/z;->bT:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/AppCloudValueUpdateHandler;

    instance-of v2, v0, Lcom/flurry/android/FlurryWalletHandler;

    if-eqz v2, :cond_0

    check-cast v0, Lcom/flurry/android/FlurryWalletHandler;

    new-instance v2, Lcom/flurry/android/responses/AppCloudError;

    const-string v3, "Session not valid, user has to relogin!"

    invoke-direct {v2, v4, v3}, Lcom/flurry/android/responses/AppCloudError;-><init>(ILjava/lang/String;)V

    invoke-virtual {v0, v2}, Lcom/flurry/android/FlurryWalletHandler;->onError(Lcom/flurry/android/responses/AppCloudError;)V

    goto :goto_0

    :cond_0
    instance-of v2, v0, Lcom/flurry/android/AppCloudValueUpdateHandler;

    if-eqz v2, :cond_1

    new-instance v2, Lcom/flurry/android/responses/AppCloudError;

    const-string v3, "Session not valid, user has to relogin!"

    invoke-direct {v2, v4, v3}, Lcom/flurry/android/responses/AppCloudError;-><init>(ILjava/lang/String;)V

    invoke-interface {v0, v2}, Lcom/flurry/android/AppCloudValueUpdateHandler;->onError(Lcom/flurry/android/responses/AppCloudError;)V

    goto :goto_0

    :cond_1
    const-string v0, "ObserverItem"

    const-string v2, "CALLBACK ERROR!"

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :goto_1
    return v0

    :cond_3
    const/4 v0, 0x1

    goto :goto_1
.end method

.method private k(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 140
    iget-object v0, p0, Lcom/flurry/android/bo;->Q:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/z;

    iget-object v0, v0, Lcom/flurry/android/z;->bS:Ljava/util/Timer;

    if-nez v0, :cond_0

    .line 157
    :goto_0
    return-void

    .line 143
    :cond_0
    iget-object v0, p0, Lcom/flurry/android/bo;->Q:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/z;

    .line 145
    if-nez v0, :cond_1

    .line 146
    const-string v0, "ObserverItem"

    const-string v1, "stopTimerForKey ERROR, info == null"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 150
    :cond_1
    iget-object v1, v0, Lcom/flurry/android/z;->bS:Ljava/util/Timer;

    if-eqz v1, :cond_2

    .line 152
    iget-object v1, v0, Lcom/flurry/android/z;->bS:Ljava/util/Timer;

    invoke-virtual {v1}, Ljava/util/Timer;->cancel()V

    .line 153
    const/4 v1, 0x0

    iput-object v1, v0, Lcom/flurry/android/z;->bS:Ljava/util/Timer;

    .line 156
    :cond_2
    iget-object v1, p0, Lcom/flurry/android/bo;->Q:Ljava/util/HashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method private l(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 188
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/flurry/android/bo;->a(I)J

    move-result-wide v0

    .line 190
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/flurry/android/bo;->a(Ljava/lang/String;Ljava/lang/Long;)V

    .line 191
    return-void
.end method


# virtual methods
.method public final S()V
    .locals 2

    .prologue
    .line 90
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/flurry/android/bo;->dF:Z

    .line 92
    iget-object v0, p0, Lcom/flurry/android/bo;->Q:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 93
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 94
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 95
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 96
    invoke-direct {p0, v0}, Lcom/flurry/android/bo;->l(Ljava/lang/String;)V

    goto :goto_0

    .line 98
    :cond_0
    return-void
.end method

.method public final T()V
    .locals 2

    .prologue
    .line 101
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/flurry/android/bo;->dF:Z

    .line 103
    iget-object v0, p0, Lcom/flurry/android/bo;->Q:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 104
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 105
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 106
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 107
    invoke-direct {p0, v0}, Lcom/flurry/android/bo;->k(Ljava/lang/String;)V

    goto :goto_0

    .line 109
    :cond_0
    return-void
.end method

.method protected final a(Ljava/lang/String;Ljava/lang/Long;)V
    .locals 5

    .prologue
    .line 117
    invoke-direct {p0, p1}, Lcom/flurry/android/bo;->k(Ljava/lang/String;)V

    .line 119
    iget-boolean v0, p0, Lcom/flurry/android/bo;->dF:Z

    if-nez v0, :cond_0

    .line 137
    :goto_0
    return-void

    .line 122
    :cond_0
    iget-object v0, p0, Lcom/flurry/android/bo;->Q:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/z;

    .line 124
    if-nez v0, :cond_1

    .line 125
    const-string v0, "ObserverItem"

    const-string v1, "scheduleTimerForKey ERROR, info == null"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 129
    :cond_1
    new-instance v1, Ljava/util/Timer;

    invoke-direct {v1}, Ljava/util/Timer;-><init>()V

    iput-object v1, v0, Lcom/flurry/android/z;->bS:Ljava/util/Timer;

    .line 130
    new-instance v1, Lcom/flurry/android/fg;

    invoke-direct {v1, p0, p1}, Lcom/flurry/android/fg;-><init>(Lcom/flurry/android/bo;Ljava/lang/String;)V

    .line 131
    const-string v2, "ObserverItem"

    const-string v3, "schedule"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 132
    iget-object v2, v0, Lcom/flurry/android/z;->bS:Ljava/util/Timer;

    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    invoke-virtual {v2, v1, v3, v4}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    .line 134
    iget-object v1, p0, Lcom/flurry/android/bo;->Q:Ljava/util/HashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method protected final addObserverForKey(Ljava/lang/String;Lcom/flurry/android/AppCloudValueUpdateHandler;)V
    .locals 3

    .prologue
    .line 160
    iget-object v0, p0, Lcom/flurry/android/bo;->Q:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 162
    iget-object v0, p0, Lcom/flurry/android/bo;->Q:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/z;

    .line 164
    if-nez v0, :cond_1

    .line 165
    const-string v0, "ObserverItem"

    const-string v1, "addObserverForKey ERROR, info == null"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 185
    :cond_0
    :goto_0
    return-void

    .line 169
    :cond_1
    iget-object v1, v0, Lcom/flurry/android/z;->bT:Ljava/util/List;

    .line 170
    invoke-interface {v1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 171
    iget-object v1, p0, Lcom/flurry/android/bo;->Q:Ljava/util/HashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 180
    :goto_1
    iget-boolean v0, p0, Lcom/flurry/android/bo;->dF:Z

    if-eqz v0, :cond_0

    .line 181
    invoke-direct {p0, p1}, Lcom/flurry/android/bo;->l(Ljava/lang/String;)V

    goto :goto_0

    .line 175
    :cond_2
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 176
    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 177
    iget-object v1, p0, Lcom/flurry/android/bo;->Q:Ljava/util/HashMap;

    new-instance v2, Lcom/flurry/android/z;

    invoke-direct {v2, v0}, Lcom/flurry/android/z;-><init>(Ljava/util/List;)V

    invoke-virtual {v1, p1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1
.end method

.method public final b(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    .prologue
    .line 228
    iget-object v0, p0, Lcom/flurry/android/bo;->Q:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 230
    iget-object v0, p0, Lcom/flurry/android/bo;->Q:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/z;

    iget-object v0, v0, Lcom/flurry/android/z;->bT:Ljava/util/List;

    .line 232
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 233
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 234
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/AppCloudValueUpdateHandler;

    .line 236
    instance-of v2, v0, Lcom/flurry/android/FlurryWalletHandler;

    if-eqz v2, :cond_0

    .line 237
    check-cast v0, Lcom/flurry/android/FlurryWalletHandler;

    .line 238
    new-instance v2, Lcom/flurry/android/FlurryWalletInfo;

    invoke-direct {v2}, Lcom/flurry/android/FlurryWalletInfo;-><init>()V

    .line 240
    iput-object p1, v2, Lcom/flurry/android/FlurryWalletInfo;->hr:Ljava/lang/String;

    .line 241
    invoke-static {p2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v3

    iput v3, v2, Lcom/flurry/android/FlurryWalletInfo;->hs:F

    .line 243
    invoke-virtual {v0, v2}, Lcom/flurry/android/FlurryWalletHandler;->onValueUpdated(Lcom/flurry/android/FlurryWalletInfo;)V

    goto :goto_0

    .line 245
    :cond_0
    instance-of v2, v0, Lcom/flurry/android/AppCloudValueUpdateHandler;

    if-eqz v2, :cond_1

    .line 248
    invoke-interface {v0, p1}, Lcom/flurry/android/AppCloudValueUpdateHandler;->onValueUpdated(Ljava/lang/String;)V

    goto :goto_0

    .line 251
    :cond_1
    const-string v0, "ObserverItem"

    const-string v2, "CALLBACK ERROR!"

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 255
    :cond_2
    return-void
.end method

.method public final isAutoSyncEnabled()Z
    .locals 1

    .prologue
    .line 112
    iget-boolean v0, p0, Lcom/flurry/android/bo;->dF:Z

    return v0
.end method

.method protected final m(Ljava/lang/String;)V
    .locals 4

    .prologue
    .line 260
    iget-object v0, p0, Lcom/flurry/android/bo;->Q:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/z;

    .line 262
    if-nez v0, :cond_0

    .line 263
    const-string v0, "ObserverItem"

    const-string v1, "addObserverForKey ERROR, info == null"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 275
    :goto_0
    return-void

    .line 266
    :cond_0
    iget v1, v0, Lcom/flurry/android/z;->A:I

    add-int/lit8 v1, v1, 0x1

    iput v1, v0, Lcom/flurry/android/z;->A:I

    .line 267
    iget v1, v0, Lcom/flurry/android/z;->A:I

    .line 268
    invoke-direct {p0, v1}, Lcom/flurry/android/bo;->a(I)J

    move-result-wide v1

    .line 270
    iget-object v3, p0, Lcom/flurry/android/bo;->Q:Ljava/util/HashMap;

    invoke-virtual {v3, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 272
    iget-object v0, p0, Lcom/flurry/android/bo;->mCollectionName:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Lcom/flurry/android/AppCloudUser;

    invoke-direct {v0}, Lcom/flurry/android/AppCloudUser;-><init>()V

    iget-object v3, p0, Lcom/flurry/android/bo;->mId:Ljava/lang/String;

    invoke-virtual {v0, v3}, Lcom/flurry/android/AppCloudUser;->setId(Ljava/lang/String;)V

    :try_start_0
    new-instance v3, Lcom/flurry/android/az;

    invoke-direct {v3, p0, p1, v1, v2}, Lcom/flurry/android/az;-><init>(Lcom/flurry/android/bo;Ljava/lang/String;J)V

    invoke-virtual {v0, v3}, Lcom/flurry/android/AppCloudUser;->getObjectOrUser(Lcom/flurry/android/AppCloudResponseHandler;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/flurry/android/bo;->mCollectionName:Ljava/lang/String;

    invoke-static {v0}, Lcom/flurry/android/AppCloudObject;->create(Ljava/lang/String;)Lcom/flurry/android/AppCloudObject;

    move-result-object v0

    iget-object v3, p0, Lcom/flurry/android/bo;->mId:Ljava/lang/String;

    invoke-virtual {v0, v3}, Lcom/flurry/android/AppCloudObject;->setId(Ljava/lang/String;)V

    :try_start_1
    new-instance v3, Lcom/flurry/android/ay;

    invoke-direct {v3, p0, p1, v1, v2}, Lcom/flurry/android/ay;-><init>(Lcom/flurry/android/bo;Ljava/lang/String;J)V

    invoke-virtual {v0, v3}, Lcom/flurry/android/AppCloudObject;->getObjectOrUser(Lcom/flurry/android/AppCloudResponseHandler;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    :catch_1
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public final removeObserver(Lcom/flurry/android/AppCloudValueUpdateHandler;)Z
    .locals 4

    .prologue
    .line 194
    const/4 v0, 0x0

    .line 195
    iget-object v1, p0, Lcom/flurry/android/bo;->Q:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    move v1, v0

    .line 197
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 198
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 199
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/z;

    iget-object v0, v0, Lcom/flurry/android/z;->bT:Ljava/util/List;

    .line 200
    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 202
    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 204
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_0

    .line 205
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    .line 208
    :cond_0
    const/4 v0, 0x1

    :goto_1
    move v1, v0

    .line 210
    goto :goto_0

    .line 212
    :cond_1
    return v1

    :cond_2
    move v0, v1

    goto :goto_1
.end method

.method protected final removeObserverForKey(Ljava/lang/String;)Z
    .locals 1

    .prologue
    .line 216
    iget-object v0, p0, Lcom/flurry/android/bo;->Q:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 217
    const/4 v0, 0x0

    .line 222
    :goto_0
    return v0

    .line 219
    :cond_0
    invoke-direct {p0, p1}, Lcom/flurry/android/bo;->k(Ljava/lang/String;)V

    .line 221
    iget-object v0, p0, Lcom/flurry/android/bo;->Q:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 222
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public final size()I
    .locals 1

    .prologue
    .line 86
    iget-object v0, p0, Lcom/flurry/android/bo;->Q:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v0

    return v0
.end method
