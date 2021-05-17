.class public Lcom/flurry/android/AppCloudUser;
.super Lcom/flurry/android/cl;
.source "SourceFile"


# static fields
.field private static cH:Lcom/flurry/android/AppCloudUser;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 24
    const/4 v0, 0x0

    sput-object v0, Lcom/flurry/android/AppCloudUser;->cH:Lcom/flurry/android/AppCloudUser;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Lcom/flurry/android/cl;-><init>()V

    .line 29
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Lcom/flurry/android/cl;-><init>()V

    .line 34
    iput-object p1, p0, Lcom/flurry/android/AppCloudUser;->mUsername:Ljava/lang/String;

    .line 35
    iput-object p2, p0, Lcom/flurry/android/AppCloudUser;->mEmail:Ljava/lang/String;

    .line 36
    iput-object p3, p0, Lcom/flurry/android/AppCloudUser;->password:Ljava/lang/String;

    .line 37
    return-void
.end method

.method constructor <init>(Lorg/json/JSONObject;)V
    .locals 0

    .prologue
    .line 41
    invoke-direct {p0}, Lcom/flurry/android/cl;-><init>()V

    .line 42
    invoke-virtual {p0, p1}, Lcom/flurry/android/AppCloudUser;->createUser(Lorg/json/JSONObject;)V

    .line 43
    return-void
.end method

.method static synthetic P()Lcom/flurry/android/AppCloudUser;
    .locals 1

    .prologue
    .line 21
    const/4 v0, 0x0

    sput-object v0, Lcom/flurry/android/AppCloudUser;->cH:Lcom/flurry/android/AppCloudUser;

    return-object v0
.end method

.method protected static Search()Lcom/flurry/android/AppCloudSearch;
    .locals 1

    .prologue
    .line 86
    invoke-static {}, Lcom/flurry/android/AppCloudUser;->getCurrentUser()Lcom/flurry/android/AppCloudUser;

    move-result-object v0

    if-nez v0, :cond_0

    .line 87
    const/4 v0, 0x0

    .line 92
    :goto_0
    return-object v0

    .line 90
    :cond_0
    new-instance v0, Lcom/flurry/android/AppCloudSearch;

    invoke-direct {v0}, Lcom/flurry/android/AppCloudSearch;-><init>()V

    goto :goto_0
.end method

.method private static a(Ljava/lang/String;Ljava/lang/String;Lcom/flurry/android/responses/AppCloudCommonOperationResponseHandler;)V
    .locals 3

    .prologue
    .line 451
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 453
    if-eqz p0, :cond_1

    .line 454
    new-instance v1, Lorg/apache/http/message/BasicNameValuePair;

    const-string v2, "username"

    invoke-direct {v1, v2, p0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 463
    :cond_0
    :goto_0
    const/4 v1, 0x1

    sput-boolean v1, Lcom/flurry/android/FlurryAppCloud;->fInternalApi:Z

    .line 464
    const-string v1, "v1/user/forgot"

    new-instance v2, Lcom/flurry/android/cw;

    invoke-direct {v2, p2}, Lcom/flurry/android/cw;-><init>(Lcom/flurry/android/responses/AppCloudCommonOperationResponseHandler;)V

    invoke-static {v1, v0, v2}, Lcom/flurry/android/FlurryAppCloud;->Post(Ljava/lang/String;Ljava/util/List;Lcom/flurry/android/AppCloudResponseHandler;)V

    .line 491
    :goto_1
    return-void

    .line 456
    :cond_1
    if-eqz p1, :cond_0

    .line 457
    new-instance v1, Lorg/apache/http/message/BasicNameValuePair;

    const-string v2, "email"

    invoke-direct {v1, v2, p1}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 486
    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method public static getCurrentUser()Lcom/flurry/android/AppCloudUser;
    .locals 1

    .prologue
    .line 71
    sget-object v0, Lcom/flurry/android/AppCloudUser;->cH:Lcom/flurry/android/AppCloudUser;

    return-object v0
.end method

.method public static getUserById(Ljava/lang/String;Lcom/flurry/android/responses/AppCloudGetUserByIDResponseHandler;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 502
    new-instance v0, Lcom/flurry/android/AppCloudUser;

    invoke-direct {v0}, Lcom/flurry/android/AppCloudUser;-><init>()V

    .line 503
    invoke-virtual {v0, p0}, Lcom/flurry/android/AppCloudUser;->setId(Ljava/lang/String;)V

    .line 504
    new-instance v1, Lcom/flurry/android/cx;

    invoke-direct {v1, p1}, Lcom/flurry/android/cx;-><init>(Lcom/flurry/android/responses/AppCloudGetUserByIDResponseHandler;)V

    invoke-virtual {v0, v1}, Lcom/flurry/android/AppCloudUser;->getObjectOrUser(Lcom/flurry/android/AppCloudResponseHandler;)V

    .line 526
    return-void
.end method

.method public static login(Ljava/lang/String;Ljava/lang/String;Lcom/flurry/android/responses/AppCloudLoginResponseHandler;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 172
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 173
    new-instance v1, Lorg/apache/http/message/BasicNameValuePair;

    const-string v2, "username"

    invoke-direct {v1, v2, p0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 174
    new-instance v1, Lorg/apache/http/message/BasicNameValuePair;

    const-string v2, "password"

    invoke-direct {v1, v2, p1}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 178
    :try_start_0
    const-string v1, "v1/user/login"

    new-instance v2, Lcom/flurry/android/cn;

    invoke-direct {v2, p1, p2}, Lcom/flurry/android/cn;-><init>(Ljava/lang/String;Lcom/flurry/android/responses/AppCloudLoginResponseHandler;)V

    invoke-static {v1, v0, v2}, Lcom/flurry/android/FlurryAppCloud;->Get(Ljava/lang/String;Ljava/util/List;Lcom/flurry/android/AppCloudResponseHandler;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 226
    :goto_0
    return-void

    .line 223
    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public static loginUserWithName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLcom/flurry/android/responses/AppCloudLoginResponseHandler;)V
    .locals 6

    .prologue
    const/16 v2, 0x190

    .line 246
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 247
    new-instance v0, Lcom/flurry/android/responses/AppCloudError;

    const-string v1, "User name is not set."

    invoke-direct {v0, v2, v1}, Lcom/flurry/android/responses/AppCloudError;-><init>(ILjava/lang/String;)V

    invoke-interface {p4, v0}, Lcom/flurry/android/responses/AppCloudLoginResponseHandler;->onError(Lcom/flurry/android/responses/AppCloudError;)V

    .line 314
    :goto_0
    return-void

    .line 251
    :cond_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 252
    new-instance v0, Lcom/flurry/android/responses/AppCloudError;

    const-string v1, "Password is not set."

    invoke-direct {v0, v2, v1}, Lcom/flurry/android/responses/AppCloudError;-><init>(ILjava/lang/String;)V

    invoke-interface {p4, v0}, Lcom/flurry/android/responses/AppCloudLoginResponseHandler;->onError(Lcom/flurry/android/responses/AppCloudError;)V

    goto :goto_0

    .line 256
    :cond_1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 257
    new-instance v0, Lcom/flurry/android/responses/AppCloudError;

    const-string v1, "Email is not set."

    invoke-direct {v0, v2, v1}, Lcom/flurry/android/responses/AppCloudError;-><init>(ILjava/lang/String;)V

    invoke-interface {p4, v0}, Lcom/flurry/android/responses/AppCloudLoginResponseHandler;->onError(Lcom/flurry/android/responses/AppCloudError;)V

    goto :goto_0

    .line 262
    :cond_2
    if-nez p3, :cond_3

    .line 263
    :try_start_0
    invoke-static {p0, p1, p4}, Lcom/flurry/android/AppCloudUser;->login(Ljava/lang/String;Ljava/lang/String;Lcom/flurry/android/responses/AppCloudLoginResponseHandler;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 310
    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 266
    :cond_3
    :try_start_1
    new-instance v0, Lcom/flurry/android/cr;

    move-object v1, p4

    move-object v2, p0

    move-object v3, p2

    move-object v4, p1

    move v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/flurry/android/cr;-><init>(Lcom/flurry/android/responses/AppCloudLoginResponseHandler;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    invoke-static {p0, p1, v0}, Lcom/flurry/android/AppCloudUser;->login(Ljava/lang/String;Ljava/lang/String;Lcom/flurry/android/responses/AppCloudLoginResponseHandler;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method

.method public static loginWithEmail(Ljava/lang/String;Ljava/lang/String;Lcom/flurry/android/responses/AppCloudLoginResponseHandler;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 105
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 106
    new-instance v1, Lorg/apache/http/message/BasicNameValuePair;

    const-string v2, "email"

    invoke-direct {v1, v2, p0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 107
    new-instance v1, Lorg/apache/http/message/BasicNameValuePair;

    const-string v2, "password"

    invoke-direct {v1, v2, p1}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 111
    :try_start_0
    const-string v1, "v1/user/login"

    new-instance v2, Lcom/flurry/android/cu;

    invoke-direct {v2, p1, p2}, Lcom/flurry/android/cu;-><init>(Ljava/lang/String;Lcom/flurry/android/responses/AppCloudLoginResponseHandler;)V

    invoke-static {v1, v0, v2}, Lcom/flurry/android/FlurryAppCloud;->Get(Ljava/lang/String;Ljava/util/List;Lcom/flurry/android/AppCloudResponseHandler;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 160
    :goto_0
    return-void

    .line 156
    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public static resetPasswordForUserViaEmail(Ljava/lang/String;Lcom/flurry/android/responses/AppCloudCommonOperationResponseHandler;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 426
    const/4 v0, 0x0

    invoke-static {v0, p0, p1}, Lcom/flurry/android/AppCloudUser;->a(Ljava/lang/String;Ljava/lang/String;Lcom/flurry/android/responses/AppCloudCommonOperationResponseHandler;)V

    .line 427
    return-void
.end method

.method public static resetPasswordForUserViaUsername(Ljava/lang/String;Lcom/flurry/android/responses/AppCloudCommonOperationResponseHandler;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 413
    const/4 v0, 0x0

    invoke-static {p0, v0, p1}, Lcom/flurry/android/AppCloudUser;->a(Ljava/lang/String;Ljava/lang/String;Lcom/flurry/android/responses/AppCloudCommonOperationResponseHandler;)V

    .line 414
    return-void
.end method

.method protected static setCurrentUser(Lcom/flurry/android/AppCloudUser;)V
    .locals 0

    .prologue
    .line 76
    sput-object p0, Lcom/flurry/android/AppCloudUser;->cH:Lcom/flurry/android/AppCloudUser;

    .line 77
    return-void
.end method


# virtual methods
.method public addObserverForKey(Ljava/lang/String;Lcom/flurry/android/AppCloudValueUpdateHandler;)V
    .locals 3

    .prologue
    .line 668
    iget-object v0, p0, Lcom/flurry/android/AppCloudUser;->mId:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 670
    const-string v0, "AppCloudUser"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mId of user is  = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/flurry/android/AppCloudUser;->mId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 671
    new-instance v0, Lcom/flurry/android/responses/AppCloudError;

    const/16 v1, 0x190

    const-string v2, "Please assign an object id."

    invoke-direct {v0, v1, v2}, Lcom/flurry/android/responses/AppCloudError;-><init>(ILjava/lang/String;)V

    invoke-interface {p2, v0}, Lcom/flurry/android/AppCloudValueUpdateHandler;->onError(Lcom/flurry/android/responses/AppCloudError;)V

    .line 676
    :goto_0
    return-void

    .line 675
    :cond_0
    invoke-static {}, Lcom/flurry/android/FlurryAppCloud;->C()Lcom/flurry/android/o;

    move-result-object v0

    iget-object v1, p0, Lcom/flurry/android/AppCloudUser;->mId:Ljava/lang/String;

    invoke-virtual {v0, v1, p1, p2}, Lcom/flurry/android/o;->a(Ljava/lang/String;Ljava/lang/String;Lcom/flurry/android/AppCloudValueUpdateHandler;)V

    goto :goto_0
.end method

.method public bridge synthetic containsObserver()Z
    .locals 1

    .prologue
    .line 21
    invoke-super {p0}, Lcom/flurry/android/cl;->containsObserver()Z

    move-result v0

    return v0
.end method

.method public decrement(Ljava/lang/String;FLcom/flurry/android/responses/AppCloudCommonOperationResponseHandler;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 656
    iget-object v0, p0, Lcom/flurry/android/AppCloudUser;->mId:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 657
    new-instance v0, Lorg/json/JSONObject;

    const-string v1, "{code:\"400\",note:\"Please assign an object id.\"}"

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 658
    new-instance v1, Lcom/flurry/android/AppCloudResponse;

    invoke-direct {v1, v0}, Lcom/flurry/android/AppCloudResponse;-><init>(Lorg/json/JSONObject;)V

    .line 659
    new-instance v0, Lcom/flurry/android/responses/AppCloudError;

    invoke-virtual {v1}, Lcom/flurry/android/AppCloudResponse;->getHTTPResponseCode()I

    move-result v2

    invoke-virtual {v1}, Lcom/flurry/android/AppCloudResponse;->getResponseMessage()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v2, v1}, Lcom/flurry/android/responses/AppCloudError;-><init>(ILjava/lang/String;)V

    invoke-interface {p3, v0}, Lcom/flurry/android/responses/AppCloudCommonOperationResponseHandler;->onError(Lcom/flurry/android/responses/AppCloudError;)V

    .line 664
    :goto_0
    return-void

    .line 662
    :cond_0
    invoke-static {p2}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v0

    invoke-super {p0, p1, v0, p3}, Lcom/flurry/android/cl;->decrement(Ljava/lang/String;Ljava/lang/String;Lcom/flurry/android/responses/AppCloudCommonOperationResponseHandler;)V

    goto :goto_0
.end method

.method public decrement(Ljava/lang/String;ILcom/flurry/android/responses/AppCloudCommonOperationResponseHandler;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 642
    iget-object v0, p0, Lcom/flurry/android/AppCloudUser;->mId:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 643
    new-instance v0, Lorg/json/JSONObject;

    const-string v1, "{code:\"400\",note:\"Please assign an object id.\"}"

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 644
    new-instance v1, Lcom/flurry/android/AppCloudResponse;

    invoke-direct {v1, v0}, Lcom/flurry/android/AppCloudResponse;-><init>(Lorg/json/JSONObject;)V

    .line 646
    new-instance v0, Lcom/flurry/android/responses/AppCloudError;

    invoke-virtual {v1}, Lcom/flurry/android/AppCloudResponse;->getHTTPResponseCode()I

    move-result v2

    invoke-virtual {v1}, Lcom/flurry/android/AppCloudResponse;->getResponseMessage()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v2, v1}, Lcom/flurry/android/responses/AppCloudError;-><init>(ILjava/lang/String;)V

    invoke-interface {p3, v0}, Lcom/flurry/android/responses/AppCloudCommonOperationResponseHandler;->onError(Lcom/flurry/android/responses/AppCloudError;)V

    .line 651
    :goto_0
    return-void

    .line 649
    :cond_0
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-super {p0, p1, v0, p3}, Lcom/flurry/android/cl;->decrement(Ljava/lang/String;Ljava/lang/String;Lcom/flurry/android/responses/AppCloudCommonOperationResponseHandler;)V

    goto :goto_0
.end method

.method public deleteWithCompletionHandler(Lcom/flurry/android/responses/AppCloudCommonOperationResponseHandler;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 563
    :try_start_0
    iget-object v0, p0, Lcom/flurry/android/AppCloudUser;->mId:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 565
    new-instance v0, Lorg/json/JSONObject;

    const-string v1, "{code:\"400\",note:\"Please assign an object id.\"}"

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 566
    new-instance v1, Lcom/flurry/android/AppCloudResponse;

    invoke-direct {v1, v0}, Lcom/flurry/android/AppCloudResponse;-><init>(Lorg/json/JSONObject;)V

    .line 567
    new-instance v0, Lcom/flurry/android/responses/AppCloudError;

    invoke-virtual {v1}, Lcom/flurry/android/AppCloudResponse;->getHTTPResponseCode()I

    move-result v2

    invoke-virtual {v1}, Lcom/flurry/android/AppCloudResponse;->getResponseMessage()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v2, v1}, Lcom/flurry/android/responses/AppCloudError;-><init>(ILjava/lang/String;)V

    invoke-interface {p1, v0}, Lcom/flurry/android/responses/AppCloudCommonOperationResponseHandler;->onError(Lcom/flurry/android/responses/AppCloudError;)V

    .line 609
    :goto_0
    return-void

    .line 571
    :cond_0
    new-instance v0, Lcom/flurry/android/cz;

    invoke-direct {v0, p0, p1}, Lcom/flurry/android/cz;-><init>(Lcom/flurry/android/AppCloudUser;Lcom/flurry/android/responses/AppCloudCommonOperationResponseHandler;)V

    invoke-virtual {p0, v0}, Lcom/flurry/android/AppCloudUser;->delete(Lcom/flurry/android/AppCloudResponseHandler;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 606
    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public bridge synthetic get(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 21
    invoke-super {p0, p1}, Lcom/flurry/android/cl;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getEmail()Ljava/lang/String;
    .locals 1

    .prologue
    .line 46
    iget-object v0, p0, Lcom/flurry/android/AppCloudUser;->mEmail:Ljava/lang/String;

    return-object v0
.end method

.method public bridge synthetic getFloat(Ljava/lang/String;)F
    .locals 1

    .prologue
    .line 21
    invoke-super {p0, p1}, Lcom/flurry/android/cl;->getFloat(Ljava/lang/String;)F

    move-result v0

    return v0
.end method

.method public bridge synthetic getId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 21
    invoke-super {p0}, Lcom/flurry/android/cl;->getId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getInt(Ljava/lang/String;)I
    .locals 1

    .prologue
    .line 21
    invoke-super {p0, p1}, Lcom/flurry/android/cl;->getInt(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public bridge synthetic getKeyValues()Ljava/util/Vector;
    .locals 1

    .prologue
    .line 21
    invoke-super {p0}, Lcom/flurry/android/cl;->getKeyValues()Ljava/util/Vector;

    move-result-object v0

    return-object v0
.end method

.method public getPassword()Ljava/lang/String;
    .locals 1

    .prologue
    .line 62
    iget-object v0, p0, Lcom/flurry/android/AppCloudUser;->password:Ljava/lang/String;

    return-object v0
.end method

.method public getUsername()Ljava/lang/String;
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lcom/flurry/android/AppCloudUser;->mUsername:Ljava/lang/String;

    return-object v0
.end method

.method public getWithCompletionHandler(Lcom/flurry/android/responses/AppCloudCommonOperationResponseHandler;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 530
    iget-object v0, p0, Lcom/flurry/android/AppCloudUser;->mId:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 532
    new-instance v0, Lorg/json/JSONObject;

    const-string v1, "{code:\"400\",note:\"Please assign an object id.\"}"

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 533
    new-instance v1, Lcom/flurry/android/AppCloudResponse;

    invoke-direct {v1, v0}, Lcom/flurry/android/AppCloudResponse;-><init>(Lorg/json/JSONObject;)V

    .line 534
    new-instance v0, Lcom/flurry/android/responses/AppCloudError;

    invoke-virtual {v1}, Lcom/flurry/android/AppCloudResponse;->getHTTPResponseCode()I

    move-result v2

    invoke-virtual {v1}, Lcom/flurry/android/AppCloudResponse;->getResponseMessage()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v2, v1}, Lcom/flurry/android/responses/AppCloudError;-><init>(ILjava/lang/String;)V

    invoke-interface {p1, v0}, Lcom/flurry/android/responses/AppCloudCommonOperationResponseHandler;->onError(Lcom/flurry/android/responses/AppCloudError;)V

    .line 556
    :goto_0
    return-void

    .line 537
    :cond_0
    new-instance v0, Lcom/flurry/android/cy;

    invoke-direct {v0, p1}, Lcom/flurry/android/cy;-><init>(Lcom/flurry/android/responses/AppCloudCommonOperationResponseHandler;)V

    invoke-virtual {p0, v0}, Lcom/flurry/android/AppCloudUser;->getObjectOrUser(Lcom/flurry/android/AppCloudResponseHandler;)V

    goto :goto_0
.end method

.method public increment(Ljava/lang/String;FLcom/flurry/android/responses/AppCloudCommonOperationResponseHandler;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 628
    iget-object v0, p0, Lcom/flurry/android/AppCloudUser;->mId:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 629
    new-instance v0, Lorg/json/JSONObject;

    const-string v1, "{code:\"400\",note:\"Please assign an object id.\"}"

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 630
    new-instance v1, Lcom/flurry/android/AppCloudResponse;

    invoke-direct {v1, v0}, Lcom/flurry/android/AppCloudResponse;-><init>(Lorg/json/JSONObject;)V

    .line 632
    new-instance v0, Lcom/flurry/android/responses/AppCloudError;

    invoke-virtual {v1}, Lcom/flurry/android/AppCloudResponse;->getHTTPResponseCode()I

    move-result v2

    invoke-virtual {v1}, Lcom/flurry/android/AppCloudResponse;->getResponseMessage()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v2, v1}, Lcom/flurry/android/responses/AppCloudError;-><init>(ILjava/lang/String;)V

    invoke-interface {p3, v0}, Lcom/flurry/android/responses/AppCloudCommonOperationResponseHandler;->onError(Lcom/flurry/android/responses/AppCloudError;)V

    .line 637
    :goto_0
    return-void

    .line 635
    :cond_0
    invoke-static {p2}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v0

    invoke-super {p0, p1, v0, p3}, Lcom/flurry/android/cl;->increment(Ljava/lang/String;Ljava/lang/String;Lcom/flurry/android/responses/AppCloudCommonOperationResponseHandler;)V

    goto :goto_0
.end method

.method public increment(Ljava/lang/String;ILcom/flurry/android/responses/AppCloudCommonOperationResponseHandler;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 614
    iget-object v0, p0, Lcom/flurry/android/AppCloudUser;->mId:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 615
    new-instance v0, Lorg/json/JSONObject;

    const-string v1, "{code:\"400\",note:\"Please assign an object id.\"}"

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 616
    new-instance v1, Lcom/flurry/android/AppCloudResponse;

    invoke-direct {v1, v0}, Lcom/flurry/android/AppCloudResponse;-><init>(Lorg/json/JSONObject;)V

    .line 618
    new-instance v0, Lcom/flurry/android/responses/AppCloudError;

    invoke-virtual {v1}, Lcom/flurry/android/AppCloudResponse;->getHTTPResponseCode()I

    move-result v2

    invoke-virtual {v1}, Lcom/flurry/android/AppCloudResponse;->getResponseMessage()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v2, v1}, Lcom/flurry/android/responses/AppCloudError;-><init>(ILjava/lang/String;)V

    invoke-interface {p3, v0}, Lcom/flurry/android/responses/AppCloudCommonOperationResponseHandler;->onError(Lcom/flurry/android/responses/AppCloudError;)V

    .line 623
    :goto_0
    return-void

    .line 621
    :cond_0
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-super {p0, p1, v0, p3}, Lcom/flurry/android/cl;->increment(Ljava/lang/String;Ljava/lang/String;Lcom/flurry/android/responses/AppCloudCommonOperationResponseHandler;)V

    goto :goto_0
.end method

.method public bridge synthetic isAutoSyncEnabled()Z
    .locals 1

    .prologue
    .line 21
    invoke-super {p0}, Lcom/flurry/android/cl;->isAutoSyncEnabled()Z

    move-result v0

    return v0
.end method

.method public loginCreatingIfNewWithCompletionHandler(Lcom/flurry/android/responses/AppCloudLoginResponseHandler;)V
    .locals 4

    .prologue
    .line 324
    invoke-static {}, Lcom/flurry/android/dy;->ar()Ljava/lang/String;

    move-result-object v0

    .line 325
    invoke-static {}, Lcom/flurry/android/dy;->at()Ljava/lang/String;

    move-result-object v1

    .line 326
    invoke-static {}, Lcom/flurry/android/dy;->as()Ljava/lang/String;

    move-result-object v2

    .line 329
    const/4 v3, 0x1

    :try_start_0
    invoke-static {v0, v1, v2, v3, p1}, Lcom/flurry/android/AppCloudUser;->loginUserWithName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLcom/flurry/android/responses/AppCloudLoginResponseHandler;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 333
    :goto_0
    return-void

    .line 330
    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public logoutWithCompletionHandler(Lcom/flurry/android/responses/AppCloudCommonOperationResponseHandler;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 342
    const/4 v0, 0x1

    sput-boolean v0, Lcom/flurry/android/FlurryAppCloud;->fInternalApi:Z

    .line 344
    const-string v0, "AppCloudUser"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Logout, mId = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/flurry/android/AppCloudUser;->mId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 345
    const-string v0, "v1/user/logout"

    const/4 v1, 0x0

    new-instance v2, Lcom/flurry/android/cs;

    invoke-direct {v2, p1}, Lcom/flurry/android/cs;-><init>(Lcom/flurry/android/responses/AppCloudCommonOperationResponseHandler;)V

    invoke-static {v0, v1, v2}, Lcom/flurry/android/FlurryAppCloud;->Put(Ljava/lang/String;Ljava/util/List;Lcom/flurry/android/AppCloudResponseHandler;)V

    .line 370
    return-void
.end method

.method public bridge synthetic removeAllObservers()Z
    .locals 1

    .prologue
    .line 21
    invoke-super {p0}, Lcom/flurry/android/cl;->removeAllObservers()Z

    move-result v0

    return v0
.end method

.method public bridge synthetic removeObserver(Lcom/flurry/android/AppCloudValueUpdateHandler;)Z
    .locals 1

    .prologue
    .line 21
    invoke-super {p0, p1}, Lcom/flurry/android/cl;->removeObserver(Lcom/flurry/android/AppCloudValueUpdateHandler;)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic removeObserverForKey(Ljava/lang/String;)Z
    .locals 1

    .prologue
    .line 21
    invoke-super {p0, p1}, Lcom/flurry/android/cl;->removeObserverForKey(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public resendSignupValidationEmailWithCompletionHandler(Lcom/flurry/android/responses/AppCloudCommonOperationResponseHandler;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 379
    const/4 v0, 0x1

    sput-boolean v0, Lcom/flurry/android/FlurryAppCloud;->fInternalApi:Z

    .line 380
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "v1/user/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/flurry/android/AppCloudUser;->mId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/resend"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    new-instance v2, Lcom/flurry/android/ct;

    invoke-direct {v2, p1}, Lcom/flurry/android/ct;-><init>(Lcom/flurry/android/responses/AppCloudCommonOperationResponseHandler;)V

    invoke-static {v0, v1, v2}, Lcom/flurry/android/FlurryAppCloud;->Post(Ljava/lang/String;Ljava/util/List;Lcom/flurry/android/AppCloudResponseHandler;)V

    .line 401
    return-void
.end method

.method public resetPasswordWithCompletionHandler(Lcom/flurry/android/responses/AppCloudCommonOperationResponseHandler;)V
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 435
    iget-object v0, p0, Lcom/flurry/android/AppCloudUser;->mUsername:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flurry/android/AppCloudUser;->mEmail:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 436
    new-instance v0, Lcom/flurry/android/responses/AppCloudError;

    const/16 v1, 0x190

    const-string v2, "Current user has neither username nor email"

    invoke-direct {v0, v1, v2}, Lcom/flurry/android/responses/AppCloudError;-><init>(ILjava/lang/String;)V

    invoke-interface {p1, v0}, Lcom/flurry/android/responses/AppCloudCommonOperationResponseHandler;->onError(Lcom/flurry/android/responses/AppCloudError;)V

    .line 446
    :goto_0
    return-void

    .line 439
    :cond_0
    iget-object v0, p0, Lcom/flurry/android/AppCloudUser;->mEmail:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 440
    iget-object v0, p0, Lcom/flurry/android/AppCloudUser;->mEmail:Ljava/lang/String;

    invoke-static {v1, v0, p1}, Lcom/flurry/android/AppCloudUser;->a(Ljava/lang/String;Ljava/lang/String;Lcom/flurry/android/responses/AppCloudCommonOperationResponseHandler;)V

    goto :goto_0

    .line 443
    :cond_1
    iget-object v0, p0, Lcom/flurry/android/AppCloudUser;->mUsername:Ljava/lang/String;

    invoke-static {v0, v1, p1}, Lcom/flurry/android/AppCloudUser;->a(Ljava/lang/String;Ljava/lang/String;Lcom/flurry/android/responses/AppCloudCommonOperationResponseHandler;)V

    goto :goto_0
.end method

.method public bridge synthetic saveOrCreateWithCompletionHandler(Lcom/flurry/android/responses/AppCloudApplyOperationResonseHandler;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 21
    invoke-super {p0, p1}, Lcom/flurry/android/cl;->saveOrCreateWithCompletionHandler(Lcom/flurry/android/responses/AppCloudApplyOperationResonseHandler;)V

    return-void
.end method

.method public bridge synthetic saveToCache()V
    .locals 0

    .prologue
    .line 21
    invoke-super {p0}, Lcom/flurry/android/cl;->saveToCache()V

    return-void
.end method

.method public bridge synthetic set(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 21
    invoke-super {p0, p1, p2}, Lcom/flurry/android/cl;->set(Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public bridge synthetic setAutoSyncEnabled(Z)Z
    .locals 1

    .prologue
    .line 21
    invoke-super {p0, p1}, Lcom/flurry/android/cl;->setAutoSyncEnabled(Z)Z

    move-result v0

    return v0
.end method

.method public setEmail(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 50
    iput-object p1, p0, Lcom/flurry/android/AppCloudUser;->mEmail:Ljava/lang/String;

    .line 51
    return-void
.end method

.method public setPassword(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 66
    iput-object p1, p0, Lcom/flurry/android/AppCloudUser;->password:Ljava/lang/String;

    .line 67
    return-void
.end method

.method public setUsername(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 58
    iput-object p1, p0, Lcom/flurry/android/AppCloudUser;->mUsername:Ljava/lang/String;

    .line 59
    return-void
.end method

.method public bridge synthetic toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 21
    invoke-super {p0}, Lcom/flurry/android/cl;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
