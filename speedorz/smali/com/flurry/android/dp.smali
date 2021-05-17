.class final Lcom/flurry/android/dp;
.super Landroid/os/AsyncTask;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field private K:Landroid/content/Context;

.field private fi:Ljava/lang/String;

.field private final m:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/flurry/android/FlurryAds;Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 2872
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 2866
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/android/dp;->m:Ljava/lang/String;

    .line 2874
    iput-object p2, p0, Lcom/flurry/android/dp;->K:Landroid/content/Context;

    .line 2875
    iput-object p3, p0, Lcom/flurry/android/dp;->fi:Ljava/lang/String;

    .line 2876
    return-void
.end method

.method private varargs ak()Ljava/lang/String;
    .locals 6

    .prologue
    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 2884
    .line 2887
    :goto_0
    const/4 v2, 0x5

    if-ge v1, v2, :cond_0

    .line 2891
    :try_start_0
    iget-object v2, p0, Lcom/flurry/android/dp;->fi:Ljava/lang/String;

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v2

    const-string v3, "http"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 2893
    iget-object v2, p0, Lcom/flurry/android/dp;->K:Landroid/content/Context;

    invoke-static {v2}, Lcom/flurry/android/FlurryAds;->o(Landroid/content/Context;)Z

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_4

    iget-object v2, p0, Lcom/flurry/android/dp;->K:Landroid/content/Context;

    invoke-static {v2}, Lcom/flurry/android/FlurryAds;->m(Landroid/content/Context;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 2896
    iget-object v2, p0, Lcom/flurry/android/dp;->fi:Ljava/lang/String;

    const/16 v3, 0x2710

    const/16 v4, 0x3a98

    const/4 v5, 0x0

    invoke-static {v2, v3, v4, v5}, Lcom/flurry/android/eo;->a(Ljava/lang/String;IIZ)Lorg/apache/http/HttpResponse;

    move-result-object v2

    .line 2897
    if-eqz v2, :cond_2

    .line 2899
    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v3

    invoke-interface {v3}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v3

    .line 2900
    const/16 v4, 0xc8

    if-ne v3, v4, :cond_1

    .line 2902
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Redirect URL found for: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/flurry/android/dp;->fi:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 2903
    iget-object v0, p0, Lcom/flurry/android/dp;->fi:Ljava/lang/String;

    .line 2953
    :cond_0
    :goto_1
    return-object v0

    .line 2906
    :cond_1
    const/16 v4, 0x12c

    if-lt v3, v4, :cond_3

    const/16 v4, 0x190

    if-ge v3, v4, :cond_3

    .line 2908
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "NumRedirects: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    add-int/lit8 v4, v1, 0x1

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 2909
    const-string v3, "Location"

    invoke-interface {v2, v3}, Lorg/apache/http/HttpResponse;->containsHeader(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 2911
    const-string v3, "Location"

    invoke-interface {v2, v3}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/flurry/android/dp;->fi:Ljava/lang/String;

    .line 2945
    :cond_2
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_0

    .line 2916
    :cond_3
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Bad Response status code: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 2950
    :catch_0
    move-exception v1

    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_1

    .line 2925
    :cond_4
    const-wide/16 v2, 0x64

    :try_start_1
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2

    .line 2927
    :catch_1
    move-exception v2

    .line 2929
    :try_start_2
    invoke-virtual {v2}, Ljava/lang/InterruptedException;->getMessage()Ljava/lang/String;

    goto :goto_2

    .line 2936
    :cond_5
    iget-object v1, p0, Lcom/flurry/android/dp;->K:Landroid/content/Context;

    iget-object v2, p0, Lcom/flurry/android/dp;->fi:Ljava/lang/String;

    const-string v3, "android.intent.action.VIEW"

    invoke-static {v1, v2, v3}, Lcom/flurry/android/FlurryAds;->b(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2938
    iget-object v0, p0, Lcom/flurry/android/dp;->fi:Ljava/lang/String;
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_1
.end method


# virtual methods
.method protected final bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 2864
    invoke-direct {p0}, Lcom/flurry/android/dp;->ak()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
