.class Lcom/flurry/sdk/t$1;
.super Lcom/flurry/sdk/fi;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flurry/sdk/t;->f(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/flurry/sdk/t;


# direct methods
.method constructor <init>(Lcom/flurry/sdk/t;)V
    .locals 0

    .prologue
    .line 83
    iput-object p1, p0, Lcom/flurry/sdk/t$1;->a:Lcom/flurry/sdk/t;

    invoke-direct {p0}, Lcom/flurry/sdk/fi;-><init>()V

    return-void
.end method


# virtual methods
.method public a()V
    .locals 4

    .prologue
    .line 87
    :try_start_0
    invoke-static {}, Lcom/flurry/sdk/em;->a()[B

    move-result-object v0

    .line 89
    if-eqz v0, :cond_0

    .line 90
    const/4 v1, 0x3

    invoke-static {}, Lcom/flurry/sdk/t;->b()Ljava/lang/String;

    move-result-object v2

    const-string v3, "Fetched hashed IMEI"

    invoke-static {v1, v2, v3}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 91
    iget-object v1, p0, Lcom/flurry/sdk/t$1;->a:Lcom/flurry/sdk/t;

    invoke-static {v1}, Lcom/flurry/sdk/t;->a(Lcom/flurry/sdk/t;)Ljava/util/Map;

    move-result-object v1

    sget-object v2, Lcom/flurry/sdk/ej;->b:Lcom/flurry/sdk/ej;

    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 98
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/flurry/sdk/t$1;->a:Lcom/flurry/sdk/t;

    invoke-static {v0}, Lcom/flurry/sdk/t;->b(Lcom/flurry/sdk/t;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 99
    iget-object v0, p0, Lcom/flurry/sdk/t$1;->a:Lcom/flurry/sdk/t;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/flurry/sdk/t;->a(Lcom/flurry/sdk/t;Z)Z

    .line 101
    iget-object v0, p0, Lcom/flurry/sdk/t$1;->a:Lcom/flurry/sdk/t;

    invoke-static {v0}, Lcom/flurry/sdk/t;->c(Lcom/flurry/sdk/t;)Lcom/flurry/android/impl/ads/FlurryAdModule;

    move-result-object v0

    iget-object v1, p0, Lcom/flurry/sdk/t$1;->a:Lcom/flurry/sdk/t;

    invoke-static {v1}, Lcom/flurry/sdk/t;->a(Lcom/flurry/sdk/t;)Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/android/impl/ads/FlurryAdModule;->a(Ljava/util/Map;)V

    .line 103
    :cond_1
    return-void

    .line 94
    :catch_0
    move-exception v0

    .line 95
    const/4 v1, 0x6

    invoke-static {}, Lcom/flurry/sdk/t;->b()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-static {v1, v2, v3, v0}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
