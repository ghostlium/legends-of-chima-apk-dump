.class public Lcom/flurry/android/FlurryAppCloud;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static UserSession:Ljava/lang/String;

.field private static bA:Z

.field private static bB:Ljava/lang/String;

.field private static bC:Ljava/lang/String;

.field private static bD:Ljava/lang/String;

.field private static bE:Z

.field private static bF:Lcom/flurry/android/dx;

.field private static br:Ljava/lang/String;

.field private static bs:Ljava/lang/String;

.field private static bt:Ljava/lang/String;

.field private static bu:Lcom/flurry/android/caching/CachingManager;

.field private static bv:Lcom/flurry/android/CacheSyncManager;

.field private static bw:Lcom/flurry/android/en;

.field private static bx:Lcom/flurry/android/o;

.field private static by:Lcom/flurry/android/CacheSearchData;

.field private static bz:Lcom/flurry/android/CacheSearchItemsData;

.field private static d:Lcom/flurry/android/at;

.field private static e:Lcom/flurry/android/ao;

.field private static f:Lcom/flurry/android/cq;

.field public static fInternalApi:Z

.field private static m:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 20
    const-string v0, ""

    sput-object v0, Lcom/flurry/android/FlurryAppCloud;->UserSession:Ljava/lang/String;

    .line 21
    const-string v0, ""

    sput-object v0, Lcom/flurry/android/FlurryAppCloud;->br:Ljava/lang/String;

    .line 23
    const-string v0, "appcloud.flurry.com"

    sput-object v0, Lcom/flurry/android/FlurryAppCloud;->bs:Ljava/lang/String;

    .line 24
    const-string v0, "appcloud-node-stage.corp.flurry.com"

    sput-object v0, Lcom/flurry/android/FlurryAppCloud;->bt:Ljava/lang/String;

    .line 25
    const-string v0, "FlurryAgent"

    sput-object v0, Lcom/flurry/android/FlurryAppCloud;->m:Ljava/lang/String;

    .line 26
    sput-object v1, Lcom/flurry/android/FlurryAppCloud;->bu:Lcom/flurry/android/caching/CachingManager;

    .line 30
    sput-object v1, Lcom/flurry/android/FlurryAppCloud;->bv:Lcom/flurry/android/CacheSyncManager;

    .line 31
    sput-object v1, Lcom/flurry/android/FlurryAppCloud;->bw:Lcom/flurry/android/en;

    .line 32
    sput-object v1, Lcom/flurry/android/FlurryAppCloud;->bx:Lcom/flurry/android/o;

    .line 35
    sput-object v1, Lcom/flurry/android/FlurryAppCloud;->e:Lcom/flurry/android/ao;

    .line 36
    sput-object v1, Lcom/flurry/android/FlurryAppCloud;->d:Lcom/flurry/android/at;

    .line 37
    sput-object v1, Lcom/flurry/android/FlurryAppCloud;->f:Lcom/flurry/android/cq;

    .line 38
    sput-object v1, Lcom/flurry/android/FlurryAppCloud;->by:Lcom/flurry/android/CacheSearchData;

    .line 39
    sput-object v1, Lcom/flurry/android/FlurryAppCloud;->bz:Lcom/flurry/android/CacheSearchItemsData;

    .line 45
    const/4 v0, 0x1

    sput-boolean v0, Lcom/flurry/android/FlurryAppCloud;->bA:Z

    .line 47
    sput-boolean v2, Lcom/flurry/android/FlurryAppCloud;->fInternalApi:Z

    .line 49
    const-string v0, "{code: \"400\", note: \"Please use FlurryAppCloud.saveOrCreateUser() for updating users.\"}"

    sput-object v0, Lcom/flurry/android/FlurryAppCloud;->bB:Ljava/lang/String;

    .line 50
    const-string v0, "{code: \"400\", note: \"Please use FlurryAppCloud.saveOrCreateUser() for creating users.\"}"

    sput-object v0, Lcom/flurry/android/FlurryAppCloud;->bC:Ljava/lang/String;

    .line 51
    const-string v0, "{code: \"400\", note: \"Please use FlurryAppCloud.deleteUser() for deleting users.\"}"

    sput-object v0, Lcom/flurry/android/FlurryAppCloud;->bD:Ljava/lang/String;

    .line 53
    sput-boolean v2, Lcom/flurry/android/FlurryAppCloud;->bE:Z

    .line 55
    invoke-static {}, Lcom/flurry/android/dx;->an()Lcom/flurry/android/dx;

    move-result-object v0

    sput-object v0, Lcom/flurry/android/FlurryAppCloud;->bF:Lcom/flurry/android/dx;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static A()Lcom/flurry/android/CacheSyncManager;
    .locals 1

    .prologue
    .line 126
    sget-object v0, Lcom/flurry/android/FlurryAppCloud;->bv:Lcom/flurry/android/CacheSyncManager;

    return-object v0
.end method

.method static B()Lcom/flurry/android/en;
    .locals 1

    .prologue
    .line 130
    sget-object v0, Lcom/flurry/android/FlurryAppCloud;->bw:Lcom/flurry/android/en;

    return-object v0
.end method

.method static C()Lcom/flurry/android/o;
    .locals 1

    .prologue
    .line 134
    sget-object v0, Lcom/flurry/android/FlurryAppCloud;->bx:Lcom/flurry/android/o;

    return-object v0
.end method

.method static D()Ljava/lang/String;
    .locals 1

    .prologue
    .line 254
    sget-boolean v0, Lcom/flurry/android/FlurryAppCloud;->bA:Z

    if-eqz v0, :cond_0

    .line 256
    sget-object v0, Lcom/flurry/android/FlurryAppCloud;->bs:Ljava/lang/String;

    .line 260
    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/flurry/android/FlurryAppCloud;->bt:Ljava/lang/String;

    goto :goto_0
.end method

.method public static Delete(Ljava/lang/String;Lcom/flurry/android/AppCloudResponseHandler;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 224
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 225
    invoke-static {v0}, Lcom/flurry/android/FlurryAppCloud;->a(Ljava/util/HashMap;)V

    .line 226
    const-string v1, "del"

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 227
    const-string v1, "url"

    invoke-virtual {v0, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 229
    const-string v1, "v1/user"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    sget-boolean v1, Lcom/flurry/android/FlurryAppCloud;->fInternalApi:Z

    if-nez v1, :cond_0

    .line 230
    new-instance v0, Lorg/json/JSONObject;

    sget-object v1, Lcom/flurry/android/FlurryAppCloud;->bD:Ljava/lang/String;

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 231
    new-instance v1, Lcom/flurry/android/AppCloudResponse;

    invoke-direct {v1, v0}, Lcom/flurry/android/AppCloudResponse;-><init>(Lorg/json/JSONObject;)V

    .line 232
    invoke-interface {p1, v1}, Lcom/flurry/android/AppCloudResponseHandler;->handleResponse(Lcom/flurry/android/AppCloudResponse;)V

    .line 238
    :goto_0
    return-void

    .line 235
    :cond_0
    new-instance v1, Lcom/flurry/android/eg;

    invoke-direct {v1}, Lcom/flurry/android/eg;-><init>()V

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/util/HashMap;

    aput-object v0, v2, v3

    invoke-virtual {v1, v2}, Lcom/flurry/android/eg;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 236
    sput-boolean v3, Lcom/flurry/android/FlurryAppCloud;->fInternalApi:Z

    goto :goto_0
.end method

.method public static Get(Ljava/lang/String;Ljava/util/List;Lcom/flurry/android/AppCloudResponseHandler;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;",
            "Lcom/flurry/android/AppCloudResponseHandler;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 211
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 212
    invoke-static {v0}, Lcom/flurry/android/FlurryAppCloud;->a(Ljava/util/HashMap;)V

    .line 213
    const-string v1, "del"

    invoke-virtual {v0, v1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 214
    if-eqz p1, :cond_0

    .line 215
    const-string v1, "url"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p1}, Lcom/flurry/android/dm;->e(Ljava/util/List;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 220
    :goto_0
    new-instance v1, Lcom/flurry/android/ew;

    invoke-direct {v1}, Lcom/flurry/android/ew;-><init>()V

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/util/HashMap;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    invoke-virtual {v1, v2}, Lcom/flurry/android/ew;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 221
    return-void

    .line 217
    :cond_0
    const-string v1, "url"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public static Post(Ljava/lang/String;Ljava/util/List;Lcom/flurry/android/AppCloudResponseHandler;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;",
            "Lcom/flurry/android/AppCloudResponseHandler;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 166
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 167
    invoke-static {v0}, Lcom/flurry/android/FlurryAppCloud;->a(Ljava/util/HashMap;)V

    .line 168
    const-string v1, "del"

    invoke-virtual {v0, v1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 169
    const-string v1, "url"

    invoke-virtual {v0, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 170
    const-string v1, "data"

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 173
    const-string v1, "v1/user"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    sget-boolean v1, Lcom/flurry/android/FlurryAppCloud;->fInternalApi:Z

    if-nez v1, :cond_0

    .line 174
    new-instance v0, Lorg/json/JSONObject;

    sget-object v1, Lcom/flurry/android/FlurryAppCloud;->bC:Ljava/lang/String;

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 175
    new-instance v1, Lcom/flurry/android/AppCloudResponse;

    invoke-direct {v1, v0}, Lcom/flurry/android/AppCloudResponse;-><init>(Lorg/json/JSONObject;)V

    .line 176
    invoke-interface {p2, v1}, Lcom/flurry/android/AppCloudResponseHandler;->handleResponse(Lcom/flurry/android/AppCloudResponse;)V

    .line 183
    :goto_0
    return-void

    .line 179
    :cond_0
    new-instance v1, Lcom/flurry/android/ak;

    invoke-direct {v1}, Lcom/flurry/android/ak;-><init>()V

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/util/HashMap;

    aput-object v0, v2, v3

    invoke-virtual {v1, v2}, Lcom/flurry/android/ak;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 180
    sput-boolean v3, Lcom/flurry/android/FlurryAppCloud;->fInternalApi:Z

    goto :goto_0
.end method

.method public static Put(Ljava/lang/String;Ljava/util/List;Lcom/flurry/android/AppCloudResponseHandler;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;",
            "Lcom/flurry/android/AppCloudResponseHandler;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 187
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 188
    invoke-static {v0}, Lcom/flurry/android/FlurryAppCloud;->a(Ljava/util/HashMap;)V

    .line 189
    const-string v1, "del"

    invoke-virtual {v0, v1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 190
    const-string v1, "url"

    invoke-virtual {v0, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 191
    if-nez p1, :cond_0

    .line 192
    const-string v1, "data"

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 197
    :goto_0
    const-string v1, "v1/user"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    sget-boolean v1, Lcom/flurry/android/FlurryAppCloud;->fInternalApi:Z

    if-nez v1, :cond_1

    .line 198
    new-instance v0, Lorg/json/JSONObject;

    sget-object v1, Lcom/flurry/android/FlurryAppCloud;->bB:Ljava/lang/String;

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 199
    new-instance v1, Lcom/flurry/android/AppCloudResponse;

    invoke-direct {v1, v0}, Lcom/flurry/android/AppCloudResponse;-><init>(Lorg/json/JSONObject;)V

    .line 200
    invoke-interface {p2, v1}, Lcom/flurry/android/AppCloudResponseHandler;->handleResponse(Lcom/flurry/android/AppCloudResponse;)V

    .line 207
    :goto_1
    return-void

    .line 194
    :cond_0
    const-string v1, "data"

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 203
    :cond_1
    new-instance v1, Lcom/flurry/android/bm;

    invoke-direct {v1}, Lcom/flurry/android/bm;-><init>()V

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/util/HashMap;

    aput-object v0, v2, v3

    invoke-virtual {v1, v2}, Lcom/flurry/android/bm;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 204
    sput-boolean v3, Lcom/flurry/android/FlurryAppCloud;->fInternalApi:Z

    goto :goto_1
.end method

.method static a(Lcom/flurry/android/fo;)Ljava/lang/Object;
    .locals 2

    .prologue
    .line 78
    sget-object v0, Lcom/flurry/android/ee;->fL:[I

    invoke-virtual {p0}, Lcom/flurry/android/fo;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 95
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 80
    :pswitch_0
    sget-object v0, Lcom/flurry/android/FlurryAppCloud;->e:Lcom/flurry/android/ao;

    goto :goto_0

    .line 83
    :pswitch_1
    sget-object v0, Lcom/flurry/android/FlurryAppCloud;->d:Lcom/flurry/android/at;

    goto :goto_0

    .line 86
    :pswitch_2
    sget-object v0, Lcom/flurry/android/FlurryAppCloud;->f:Lcom/flurry/android/cq;

    goto :goto_0

    .line 89
    :pswitch_3
    sget-object v0, Lcom/flurry/android/FlurryAppCloud;->by:Lcom/flurry/android/CacheSearchData;

    goto :goto_0

    .line 92
    :pswitch_4
    sget-object v0, Lcom/flurry/android/FlurryAppCloud;->bz:Lcom/flurry/android/CacheSearchItemsData;

    goto :goto_0

    .line 78
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method private static a(Ljava/util/HashMap;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 160
    const-string v0, "session"

    sget-object v1, Lcom/flurry/android/FlurryAppCloud;->UserSession:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 161
    const-string v0, "auth"

    sget-object v1, Lcom/flurry/android/FlurryAppCloud;->br:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 162
    return-void
.end method

.method static e(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 62
    new-instance v0, Lcom/flurry/android/ao;

    invoke-direct {v0, p0, p1}, Lcom/flurry/android/ao;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    sput-object v0, Lcom/flurry/android/FlurryAppCloud;->e:Lcom/flurry/android/ao;

    new-instance v0, Lcom/flurry/android/at;

    invoke-direct {v0, p0, p1}, Lcom/flurry/android/at;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    sput-object v0, Lcom/flurry/android/FlurryAppCloud;->d:Lcom/flurry/android/at;

    new-instance v0, Lcom/flurry/android/cq;

    invoke-direct {v0, p0, p1}, Lcom/flurry/android/cq;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    sput-object v0, Lcom/flurry/android/FlurryAppCloud;->f:Lcom/flurry/android/cq;

    new-instance v0, Lcom/flurry/android/CacheSearchData;

    invoke-direct {v0, p0, p1}, Lcom/flurry/android/CacheSearchData;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    sput-object v0, Lcom/flurry/android/FlurryAppCloud;->by:Lcom/flurry/android/CacheSearchData;

    new-instance v0, Lcom/flurry/android/CacheSearchItemsData;

    invoke-direct {v0, p0, p1}, Lcom/flurry/android/CacheSearchItemsData;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    sput-object v0, Lcom/flurry/android/FlurryAppCloud;->bz:Lcom/flurry/android/CacheSearchItemsData;

    .line 64
    sget-object v0, Lcom/flurry/android/FlurryAppCloud;->bv:Lcom/flurry/android/CacheSyncManager;

    invoke-virtual {v0}, Lcom/flurry/android/CacheSyncManager;->a()V

    .line 65
    sget-object v0, Lcom/flurry/android/FlurryAppCloud;->bv:Lcom/flurry/android/CacheSyncManager;

    invoke-virtual {v0}, Lcom/flurry/android/CacheSyncManager;->synchronize()V

    .line 66
    return-void
.end method

.method public static getPushToken()Ljava/lang/String;
    .locals 1

    .prologue
    .line 308
    sget-object v0, Lcom/flurry/android/FlurryAppCloud;->bF:Lcom/flurry/android/dx;

    invoke-virtual {v0}, Lcom/flurry/android/dx;->getPushToken()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static initAppCloudModule(Landroid/content/Context;)V
    .locals 3

    .prologue
    .line 282
    if-nez p0, :cond_0

    .line 283
    :try_start_0
    sget-object v0, Lcom/flurry/android/FlurryAppCloud;->m:Ljava/lang/String;

    const-string v1, "Context passed to getAppCloud was null."

    invoke-static {v0, v1}, Lcom/flurry/android/cm;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 286
    :cond_0
    sget-boolean v0, Lcom/flurry/android/FlurryAppCloud;->bE:Z

    if-nez v0, :cond_2

    sget-object v0, Lcom/flurry/android/FlurryAppCloud;->bF:Lcom/flurry/android/dx;

    invoke-virtual {v0}, Lcom/flurry/android/dx;->isInitialized()Z

    move-result v0

    if-nez v0, :cond_1

    sget-object v0, Lcom/flurry/android/FlurryAppCloud;->m:Ljava/lang/String;

    const-string v1, "Initializing Flurry AppCloud"

    invoke-static {v0, v1}, Lcom/flurry/android/cm;->c(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lcom/flurry/android/ds;

    invoke-direct {v0}, Lcom/flurry/android/ds;-><init>()V

    invoke-static {}, Lcom/flurry/android/FlurryAgent;->v()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/flurry/android/ds;->aA:Ljava/lang/String;

    invoke-static {}, Lcom/flurry/android/dx;->an()Lcom/flurry/android/dx;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/flurry/android/dx;->a(Lcom/flurry/android/ds;)V

    sget-object v0, Lcom/flurry/android/FlurryAppCloud;->m:Ljava/lang/String;

    const-string v1, "Flurry AppCloud initialized"

    invoke-static {v0, v1}, Lcom/flurry/android/cm;->c(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    const/4 v0, 0x1

    sput-boolean v0, Lcom/flurry/android/FlurryAppCloud;->bE:Z

    .line 288
    :cond_2
    new-instance v0, Lcom/flurry/android/en;

    invoke-direct {v0}, Lcom/flurry/android/en;-><init>()V

    sput-object v0, Lcom/flurry/android/FlurryAppCloud;->bw:Lcom/flurry/android/en;

    .line 289
    new-instance v0, Lcom/flurry/android/o;

    invoke-direct {v0}, Lcom/flurry/android/o;-><init>()V

    sput-object v0, Lcom/flurry/android/FlurryAppCloud;->bx:Lcom/flurry/android/o;

    .line 291
    new-instance v0, Lcom/flurry/android/caching/CachingManager;

    invoke-direct {v0, p0}, Lcom/flurry/android/caching/CachingManager;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/flurry/android/FlurryAppCloud;->bu:Lcom/flurry/android/caching/CachingManager;

    .line 292
    new-instance v0, Lcom/flurry/android/CacheSyncManager;

    invoke-direct {v0, p0}, Lcom/flurry/android/CacheSyncManager;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/flurry/android/FlurryAppCloud;->bv:Lcom/flurry/android/CacheSyncManager;

    .line 294
    invoke-static {p0}, Lcom/flurry/android/dy;->f(Landroid/content/Context;)V

    .line 295
    invoke-static {p0}, Lcom/flurry/android/FlurryWallet;->f(Landroid/content/Context;)V

    .line 297
    invoke-static {}, Lcom/flurry/android/dy;->aq()Ljava/lang/String;

    move-result-object v0

    .line 299
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 300
    invoke-static {p0, v0}, Lcom/flurry/android/FlurryAppCloud;->e(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 305
    :cond_3
    :goto_0
    return-void

    .line 302
    :catch_0
    move-exception v0

    .line 303
    sget-object v1, Lcom/flurry/android/FlurryAppCloud;->m:Ljava/lang/String;

    const-string v2, ""

    invoke-static {v1, v2, v0}, Lcom/flurry/android/cm;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method static j(Ljava/lang/String;)V
    .locals 3

    .prologue
    .line 58
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Basic "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    const/16 v2, 0xa

    invoke-static {v0, v2}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/flurry/android/FlurryAppCloud;->br:Ljava/lang/String;

    .line 59
    return-void
.end method

.method public static printDB()V
    .locals 1

    .prologue
    .line 139
    sget-object v0, Lcom/flurry/android/FlurryAppCloud;->bv:Lcom/flurry/android/CacheSyncManager;

    invoke-virtual {v0}, Lcom/flurry/android/CacheSyncManager;->toStringAndPrint()V

    .line 140
    invoke-static {}, Lcom/flurry/android/AppCloudSearch;->toStringAndPrint()V

    .line 141
    return-void
.end method

.method public static setAppCloudServerToStaging(Z)V
    .locals 1

    .prologue
    .line 242
    if-nez p0, :cond_0

    .line 244
    const/4 v0, 0x1

    sput-boolean v0, Lcom/flurry/android/FlurryAppCloud;->bA:Z

    .line 250
    :goto_0
    return-void

    .line 248
    :cond_0
    const/4 v0, 0x0

    sput-boolean v0, Lcom/flurry/android/FlurryAppCloud;->bA:Z

    goto :goto_0
.end method

.method public static setPushToken(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 312
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "NP"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 313
    :cond_0
    sget-object v0, Lcom/flurry/android/FlurryAppCloud;->m:Ljava/lang/String;

    const-string v1, "setting push token."

    invoke-static {v0, v1}, Lcom/flurry/android/cm;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 315
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_1

    .line 316
    sget-object v0, Lcom/flurry/android/FlurryAppCloud;->bF:Lcom/flurry/android/dx;

    invoke-virtual {v0, p0}, Lcom/flurry/android/dx;->setPushToken(Ljava/lang/String;)V

    .line 321
    :cond_1
    :goto_0
    return-void

    .line 318
    :cond_2
    const-string v0, "NP"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 319
    sget-object v0, Lcom/flurry/android/FlurryAppCloud;->bF:Lcom/flurry/android/dx;

    invoke-virtual {v0, p0}, Lcom/flurry/android/dx;->setPushToken(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static synchronize()V
    .locals 1

    .prologue
    .line 145
    sget-object v0, Lcom/flurry/android/FlurryAppCloud;->bv:Lcom/flurry/android/CacheSyncManager;

    invoke-virtual {v0}, Lcom/flurry/android/CacheSyncManager;->synchronize()V

    .line 146
    return-void
.end method

.method static z()Lcom/flurry/android/caching/CachingManager;
    .locals 1

    .prologue
    .line 122
    sget-object v0, Lcom/flurry/android/FlurryAppCloud;->bu:Lcom/flurry/android/caching/CachingManager;

    return-object v0
.end method
