.class public abstract Lcom/flurry/sdk/h;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# static fields
.field private static final a:Ljava/lang/String;


# instance fields
.field private b:Lcom/flurry/android/impl/ads/FlurryAdModule;

.field private c:Lcom/flurry/sdk/e;

.field private d:Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

.field private e:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 14
    const-class v0, Lcom/flurry/sdk/h;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/flurry/sdk/h;->a:Ljava/lang/String;

    return-void
.end method

.method protected constructor <init>(Landroid/content/Context;)V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 28
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/flurry/android/impl/ads/FlurryAdModule;Lcom/flurry/sdk/e;)V
    .locals 0

    .prologue
    .line 31
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 33
    iput-object p2, p0, Lcom/flurry/sdk/h;->b:Lcom/flurry/android/impl/ads/FlurryAdModule;

    .line 34
    iput-object p3, p0, Lcom/flurry/sdk/h;->c:Lcom/flurry/sdk/e;

    .line 35
    return-void
.end method


# virtual methods
.method e()Z
    .locals 2

    .prologue
    .line 80
    iget-object v0, p0, Lcom/flurry/sdk/h;->d:Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;->d()Ljava/util/List;

    move-result-object v0

    iget v1, p0, Lcom/flurry/sdk/h;->e:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;->e()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdSpaceLayout;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdSpaceLayout;->e()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "takeover"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 82
    const/4 v0, 0x0

    .line 84
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public getAdFrameIndex()I
    .locals 1

    .prologue
    .line 62
    iget v0, p0, Lcom/flurry/sdk/h;->e:I

    return v0
.end method

.method public getAdLog()Lcom/flurry/sdk/e;
    .locals 1

    .prologue
    .line 38
    iget-object v0, p0, Lcom/flurry/sdk/h;->c:Lcom/flurry/sdk/e;

    return-object v0
.end method

.method public getAdUnit()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lcom/flurry/sdk/h;->d:Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    return-object v0
.end method

.method public getPlatformModule()Lcom/flurry/android/impl/ads/FlurryAdModule;
    .locals 1

    .prologue
    .line 46
    iget-object v0, p0, Lcom/flurry/sdk/h;->b:Lcom/flurry/android/impl/ads/FlurryAdModule;

    return-object v0
.end method

.method public abstract initLayout()V
.end method

.method public onEvent(Ljava/lang/String;Ljava/util/Map;)V
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

    .line 70
    sget-object v0, Lcom/flurry/sdk/h;->a:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "AppSpotBannerView.onEvent "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v0, v1}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 71
    iget-object v0, p0, Lcom/flurry/sdk/h;->d:Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    if-eqz v0, :cond_0

    .line 72
    iget-object v7, p0, Lcom/flurry/sdk/h;->b:Lcom/flurry/android/impl/ads/FlurryAdModule;

    new-instance v0, Lcom/flurry/sdk/p;

    invoke-virtual {p0}, Lcom/flurry/sdk/h;->getContext()Landroid/content/Context;

    move-result-object v3

    iget-object v4, p0, Lcom/flurry/sdk/h;->d:Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    iget-object v5, p0, Lcom/flurry/sdk/h;->c:Lcom/flurry/sdk/e;

    iget v6, p0, Lcom/flurry/sdk/h;->e:I

    move-object v1, p1

    move-object v2, p2

    invoke-direct/range {v0 .. v6}, Lcom/flurry/sdk/p;-><init>(Ljava/lang/String;Ljava/util/Map;Landroid/content/Context;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;Lcom/flurry/sdk/e;I)V

    iget-object v1, p0, Lcom/flurry/sdk/h;->b:Lcom/flurry/android/impl/ads/FlurryAdModule;

    invoke-virtual {v1}, Lcom/flurry/android/impl/ads/FlurryAdModule;->a()Lcom/flurry/sdk/q;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v7, v0, v1, v2}, Lcom/flurry/android/impl/ads/FlurryAdModule;->a(Lcom/flurry/sdk/p;Lcom/flurry/sdk/ad;I)V

    .line 77
    :goto_0
    return-void

    .line 75
    :cond_0
    sget-object v0, Lcom/flurry/sdk/h;->a:Ljava/lang/String;

    const-string v1, "fAdUnit == null"

    invoke-static {v3, v0, v1}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public setAdFrameIndex(I)V
    .locals 0

    .prologue
    .line 66
    iput p1, p0, Lcom/flurry/sdk/h;->e:I

    .line 67
    return-void
.end method

.method public setAdLog(Lcom/flurry/sdk/e;)V
    .locals 0

    .prologue
    .line 42
    iput-object p1, p0, Lcom/flurry/sdk/h;->c:Lcom/flurry/sdk/e;

    .line 43
    return-void
.end method

.method public setAdUnit(Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)V
    .locals 0

    .prologue
    .line 58
    iput-object p1, p0, Lcom/flurry/sdk/h;->d:Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    .line 59
    return-void
.end method

.method public setPlatformModule(Lcom/flurry/android/impl/ads/FlurryAdModule;)V
    .locals 0

    .prologue
    .line 50
    iput-object p1, p0, Lcom/flurry/sdk/h;->b:Lcom/flurry/android/impl/ads/FlurryAdModule;

    .line 51
    return-void
.end method

.method public stop()V
    .locals 0

    .prologue
    .line 93
    return-void
.end method
