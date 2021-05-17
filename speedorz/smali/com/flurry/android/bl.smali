.class final Lcom/flurry/android/bl;
.super Lcom/flurry/android/ep;
.source "SourceFile"


# instance fields
.field private final dE:Lcom/flurry/android/ab;


# direct methods
.method public constructor <init>(Lcom/flurry/android/ab;Lcom/flurry/android/AdUnit;)V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0, p2}, Lcom/flurry/android/ep;-><init>(Lcom/flurry/android/AdUnit;)V

    .line 12
    iput-object p1, p0, Lcom/flurry/android/bl;->dE:Lcom/flurry/android/ab;

    .line 13
    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;Landroid/view/ViewGroup;)V
    .locals 1

    .prologue
    .line 17
    iget-object v0, p0, Lcom/flurry/android/bl;->dE:Lcom/flurry/android/ab;

    if-eqz v0, :cond_0

    .line 18
    iget-object v0, p0, Lcom/flurry/android/bl;->dE:Lcom/flurry/android/ab;

    invoke-virtual {v0}, Lcom/flurry/android/ab;->H()V

    .line 20
    :cond_0
    return-void
.end method
