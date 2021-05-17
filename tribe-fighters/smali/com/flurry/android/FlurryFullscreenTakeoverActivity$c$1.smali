.class Lcom/flurry/android/FlurryFullscreenTakeoverActivity$c$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flurry/android/FlurryFullscreenTakeoverActivity$c;->a(Lcom/flurry/sdk/m;Ljava/lang/String;Z)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/flurry/sdk/m;

.field final synthetic b:Lcom/flurry/android/FlurryFullscreenTakeoverActivity$c;


# direct methods
.method constructor <init>(Lcom/flurry/android/FlurryFullscreenTakeoverActivity$c;Lcom/flurry/sdk/m;)V
    .locals 0

    .prologue
    .line 449
    iput-object p1, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity$c$1;->b:Lcom/flurry/android/FlurryFullscreenTakeoverActivity$c;

    iput-object p2, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity$c$1;->a:Lcom/flurry/sdk/m;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 452
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity$c$1;->a:Lcom/flurry/sdk/m;

    invoke-virtual {v0}, Lcom/flurry/sdk/m;->a()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 453
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity$c$1;->a:Lcom/flurry/sdk/m;

    invoke-virtual {v0}, Lcom/flurry/sdk/m;->b()V

    .line 457
    :goto_0
    return-void

    .line 455
    :cond_0
    iget-object v0, p0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity$c$1;->b:Lcom/flurry/android/FlurryFullscreenTakeoverActivity$c;

    iget-object v0, v0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity$c;->a:Lcom/flurry/android/FlurryFullscreenTakeoverActivity;

    invoke-virtual {v0}, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->finish()V

    goto :goto_0
.end method
