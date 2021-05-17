.class final Lcom/unity3d/plugin/downloader/b/d;
.super Ljava/lang/Object;

# interfaces
.implements Lorg/apache/http/HttpRequestInterceptor;


# instance fields
.field final synthetic a:Lcom/unity3d/plugin/downloader/b/a;


# direct methods
.method private constructor <init>(Lcom/unity3d/plugin/downloader/b/a;)V
    .locals 0

    iput-object p1, p0, Lcom/unity3d/plugin/downloader/b/d;->a:Lcom/unity3d/plugin/downloader/b/a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/unity3d/plugin/downloader/b/a;B)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/unity3d/plugin/downloader/b/d;-><init>(Lcom/unity3d/plugin/downloader/b/a;)V

    return-void
.end method


# virtual methods
.method public final process(Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)V
    .locals 2

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/d;->a:Lcom/unity3d/plugin/downloader/b/a;

    invoke-static {v0}, Lcom/unity3d/plugin/downloader/b/a;->a(Lcom/unity3d/plugin/downloader/b/a;)Lcom/unity3d/plugin/downloader/b/e;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {v0}, Lcom/unity3d/plugin/downloader/b/e;->a(Lcom/unity3d/plugin/downloader/b/e;)Z

    move-result v1

    if-eqz v1, :cond_0

    instance-of v1, p1, Lorg/apache/http/client/methods/HttpUriRequest;

    if-eqz v1, :cond_0

    check-cast p1, Lorg/apache/http/client/methods/HttpUriRequest;

    invoke-static {p1}, Lcom/unity3d/plugin/downloader/b/a;->a(Lorg/apache/http/client/methods/HttpUriRequest;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/unity3d/plugin/downloader/b/e;->a(Lcom/unity3d/plugin/downloader/b/e;Ljava/lang/String;)V

    :cond_0
    return-void
.end method
