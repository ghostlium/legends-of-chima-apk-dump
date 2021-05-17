.class public abstract Lcom/flurry/sdk/ao;
.super Lcom/flurry/sdk/ai;
.source "SourceFile"


# static fields
.field private static final b:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 22
    const-class v0, Lcom/flurry/sdk/ao;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/flurry/sdk/ao;->b:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/flurry/android/impl/ads/FlurryAdModule;Lcom/flurry/sdk/e;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/flurry/sdk/ai;-><init>(Landroid/content/Context;Lcom/flurry/android/impl/ads/FlurryAdModule;Lcom/flurry/sdk/e;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)V

    .line 27
    return-void
.end method

.method private a(Ljava/lang/String;Ljava/util/Map;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    const/4 v3, 0x3

    const/4 v6, 0x0

    .line 54
    sget-object v0, Lcom/flurry/sdk/ao;->b:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onEvent: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v0, v1}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 55
    invoke-virtual {p0}, Lcom/flurry/sdk/ao;->e()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 56
    invoke-virtual {p0}, Lcom/flurry/sdk/ao;->c()Lcom/flurry/android/impl/ads/FlurryAdModule;

    move-result-object v7

    new-instance v0, Lcom/flurry/sdk/p;

    invoke-virtual {p0}, Lcom/flurry/sdk/ao;->b()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {p0}, Lcom/flurry/sdk/ao;->e()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    move-result-object v4

    invoke-virtual {p0}, Lcom/flurry/sdk/ao;->d()Lcom/flurry/sdk/e;

    move-result-object v5

    move-object v1, p1

    move-object v2, p2

    invoke-direct/range {v0 .. v6}, Lcom/flurry/sdk/p;-><init>(Ljava/lang/String;Ljava/util/Map;Landroid/content/Context;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;Lcom/flurry/sdk/e;I)V

    invoke-virtual {p0}, Lcom/flurry/sdk/ao;->c()Lcom/flurry/android/impl/ads/FlurryAdModule;

    move-result-object v1

    invoke-virtual {v1}, Lcom/flurry/android/impl/ads/FlurryAdModule;->a()Lcom/flurry/sdk/q;

    move-result-object v1

    invoke-virtual {v7, v0, v1, v6}, Lcom/flurry/android/impl/ads/FlurryAdModule;->a(Lcom/flurry/sdk/p;Lcom/flurry/sdk/ad;I)V

    .line 62
    :goto_0
    return-void

    .line 60
    :cond_0
    sget-object v0, Lcom/flurry/sdk/ao;->b:Ljava/lang/String;

    const-string v1, "adUnit == null"

    invoke-static {v3, v0, v1}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method


# virtual methods
.method public a(Ljava/util/Map;)V
    .locals 1
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

    .prologue
    .line 38
    const-string v0, "rendered"

    invoke-direct {p0, v0, p1}, Lcom/flurry/sdk/ao;->a(Ljava/lang/String;Ljava/util/Map;)V

    .line 39
    return-void
.end method

.method public b(Ljava/util/Map;)V
    .locals 1
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

    .prologue
    .line 42
    const-string v0, "clicked"

    invoke-direct {p0, v0, p1}, Lcom/flurry/sdk/ao;->a(Ljava/lang/String;Ljava/util/Map;)V

    .line 43
    return-void
.end method

.method public c(Ljava/util/Map;)V
    .locals 1
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

    .prologue
    .line 46
    const-string v0, "adClosed"

    invoke-direct {p0, v0, p1}, Lcom/flurry/sdk/ao;->a(Ljava/lang/String;Ljava/util/Map;)V

    .line 47
    return-void
.end method

.method public d(Ljava/util/Map;)V
    .locals 1
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

    .prologue
    .line 50
    const-string v0, "renderFailed"

    invoke-direct {p0, v0, p1}, Lcom/flurry/sdk/ao;->a(Ljava/lang/String;Ljava/util/Map;)V

    .line 51
    return-void
.end method
