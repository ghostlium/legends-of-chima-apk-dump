.class final Lcom/flurry/android/FlurryFullscreenTakeoverActivity$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/flurry/sdk/m$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/android/FlurryFullscreenTakeoverActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "a"
.end annotation


# instance fields
.field final synthetic a:Lcom/flurry/android/FlurryFullscreenTakeoverActivity;


# direct methods
.method private constructor <init>(Lcom/flurry/android/FlurryFullscreenTakeoverActivity;)V
    .locals 0

    .prologue
    .line 466
    iput-object p1, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity$a;->a:Lcom/flurry/android/FlurryFullscreenTakeoverActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/flurry/android/FlurryFullscreenTakeoverActivity;Lcom/flurry/android/FlurryFullscreenTakeoverActivity$1;)V
    .locals 0

    .prologue
    .line 466
    invoke-direct {p0, p1}, Lcom/flurry/android/FlurryFullscreenTakeoverActivity$a;-><init>(Lcom/flurry/android/FlurryFullscreenTakeoverActivity;)V

    return-void
.end method


# virtual methods
.method public a(Lcom/flurry/sdk/m;Lcom/flurry/sdk/m$e;)V
    .locals 1

    .prologue
    .line 469
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity$a;->a:Lcom/flurry/android/FlurryFullscreenTakeoverActivity;

    invoke-static {v0, p2}, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->a(Lcom/flurry/android/FlurryFullscreenTakeoverActivity;Lcom/flurry/sdk/m$e;)Lcom/flurry/sdk/m$e;

    .line 470
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity$a;->a:Lcom/flurry/android/FlurryFullscreenTakeoverActivity;

    invoke-virtual {v0}, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->finish()V

    .line 471
    return-void
.end method
