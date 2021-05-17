.class Lcom/playhaven/android/view/HTMLView$4;
.super Ljava/lang/Object;
.source "HTMLView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/playhaven/android/view/HTMLView;->load(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/playhaven/android/view/HTMLView;

.field private final synthetic val$url:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/playhaven/android/view/HTMLView;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/playhaven/android/view/HTMLView$4;->this$0:Lcom/playhaven/android/view/HTMLView;

    iput-object p2, p0, Lcom/playhaven/android/view/HTMLView$4;->val$url:Ljava/lang/String;

    .line 380
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InlinedApi"
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 384
    const/4 v2, 0x0

    .line 386
    .local v2, "fileUrl":Ljava/lang/String;
    :try_start_0
    new-instance v0, Lcom/playhaven/android/cache/Cache;

    iget-object v4, p0, Lcom/playhaven/android/view/HTMLView$4;->this$0:Lcom/playhaven/android/view/HTMLView;

    invoke-virtual {v4}, Lcom/playhaven/android/view/HTMLView;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v0, v4}, Lcom/playhaven/android/cache/Cache;-><init>(Landroid/content/Context;)V

    .line 387
    .local v0, "cache":Lcom/playhaven/android/cache/Cache;
    new-instance v4, Ljava/net/URL;

    iget-object v5, p0, Lcom/playhaven/android/view/HTMLView$4;->val$url:Ljava/lang/String;

    invoke-direct {v4, v5}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v4}, Lcom/playhaven/android/cache/Cache;->getFile(Ljava/net/URL;)Ljava/io/File;

    move-result-object v3

    .line 388
    .local v3, "template":Ljava/io/File;
    invoke-virtual {v0}, Lcom/playhaven/android/cache/Cache;->close()V

    .line 389
    if-eqz v3, :cond_0

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 390
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "file:///"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 396
    .end local v0    # "cache":Lcom/playhaven/android/cache/Cache;
    .end local v3    # "template":Ljava/io/File;
    :cond_0
    :goto_0
    if-eqz v2, :cond_2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    if-le v4, v6, :cond_2

    .line 397
    const-string v4, "Loading from cache: %s."

    new-array v5, v6, [Ljava/lang/Object;

    aput-object v2, v5, v7

    invoke-static {v4, v5}, Lcom/playhaven/android/PlayHaven;->v(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 398
    iget-object v4, p0, Lcom/playhaven/android/view/HTMLView$4;->this$0:Lcom/playhaven/android/view/HTMLView;

    invoke-virtual {v4, v2}, Lcom/playhaven/android/view/HTMLView;->loadUrl(Ljava/lang/String;)V

    .line 403
    :goto_1
    iget-object v4, p0, Lcom/playhaven/android/view/HTMLView$4;->this$0:Lcom/playhaven/android/view/HTMLView;

    invoke-virtual {v4, v7}, Lcom/playhaven/android/view/HTMLView;->setBackgroundColor(I)V

    .line 406
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0xb

    if-lt v4, v5, :cond_1

    .line 407
    iget-object v4, p0, Lcom/playhaven/android/view/HTMLView$4;->this$0:Lcom/playhaven/android/view/HTMLView;

    const/4 v5, 0x0

    invoke-virtual {v4, v6, v5}, Lcom/playhaven/android/view/HTMLView;->setLayerType(ILandroid/graphics/Paint;)V

    .line 409
    :cond_1
    return-void

    .line 392
    :catch_0
    move-exception v1

    .line 393
    .local v1, "e":Ljava/lang/Exception;
    invoke-static {v1}, Lcom/playhaven/android/PlayHaven;->e(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 400
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_2
    iget-object v4, p0, Lcom/playhaven/android/view/HTMLView$4;->this$0:Lcom/playhaven/android/view/HTMLView;

    iget-object v5, p0, Lcom/playhaven/android/view/HTMLView$4;->val$url:Ljava/lang/String;

    invoke-virtual {v4, v5}, Lcom/playhaven/android/view/HTMLView;->loadUrl(Ljava/lang/String;)V

    goto :goto_1
.end method
