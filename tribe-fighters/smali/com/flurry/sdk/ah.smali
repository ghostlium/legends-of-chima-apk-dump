.class public final Lcom/flurry/sdk/ah;
.super Lcom/flurry/sdk/ag;
.source "SourceFile"


# instance fields
.field private final a:Lcom/flurry/sdk/ai;


# direct methods
.method public constructor <init>(Lcom/flurry/sdk/ai;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0, p2}, Lcom/flurry/sdk/ag;-><init>(Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)V

    .line 14
    iput-object p1, p0, Lcom/flurry/sdk/ah;->a:Lcom/flurry/sdk/ai;

    .line 15
    return-void
.end method


# virtual methods
.method public a(Landroid/content/Context;Landroid/view/ViewGroup;)V
    .locals 1

    .prologue
    .line 19
    iget-object v0, p0, Lcom/flurry/sdk/ah;->a:Lcom/flurry/sdk/ai;

    if-eqz v0, :cond_0

    .line 20
    iget-object v0, p0, Lcom/flurry/sdk/ah;->a:Lcom/flurry/sdk/ai;

    invoke-virtual {v0}, Lcom/flurry/sdk/ai;->a()V

    .line 22
    :cond_0
    return-void
.end method
