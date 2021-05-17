.class public abstract Lcom/flurry/sdk/ag;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private final a:Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

.field private final b:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)V
    .locals 1

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput-object p1, p0, Lcom/flurry/sdk/ag;->a:Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    .line 19
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;->b()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    iput-object v0, p0, Lcom/flurry/sdk/ag;->b:Ljava/lang/String;

    .line 20
    return-void

    .line 19
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public abstract a(Landroid/content/Context;Landroid/view/ViewGroup;)V
.end method

.method public b()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;
    .locals 1

    .prologue
    .line 23
    iget-object v0, p0, Lcom/flurry/sdk/ag;->a:Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    return-object v0
.end method

.method public c()Ljava/lang/String;
    .locals 1

    .prologue
    .line 27
    iget-object v0, p0, Lcom/flurry/sdk/ag;->b:Ljava/lang/String;

    return-object v0
.end method
