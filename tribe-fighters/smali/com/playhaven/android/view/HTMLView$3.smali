.class Lcom/playhaven/android/view/HTMLView$3;
.super Ljava/lang/Object;
.source "HTMLView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/playhaven/android/view/HTMLView;->handleDispatch(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/playhaven/android/view/HTMLView;

.field private final synthetic val$initialUrl:Ljava/lang/String;

.field private final synthetic val$uriFuture:Ljava/util/concurrent/Future;


# direct methods
.method constructor <init>(Lcom/playhaven/android/view/HTMLView;Ljava/util/concurrent/Future;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/playhaven/android/view/HTMLView$3;->this$0:Lcom/playhaven/android/view/HTMLView;

    iput-object p2, p0, Lcom/playhaven/android/view/HTMLView$3;->val$uriFuture:Ljava/util/concurrent/Future;

    iput-object p3, p0, Lcom/playhaven/android/view/HTMLView$3;->val$initialUrl:Ljava/lang/String;

    .line 277
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 281
    const/4 v2, 0x0

    .line 283
    .local v2, "url":Ljava/lang/String;
    :try_start_0
    iget-object v3, p0, Lcom/playhaven/android/view/HTMLView$3;->val$uriFuture:Ljava/util/concurrent/Future;

    invoke-interface {v3}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "url":Ljava/lang/String;
    check-cast v2, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 292
    .restart local v2    # "url":Ljava/lang/String;
    :goto_0
    new-instance v1, Landroid/content/Intent;

    const-string v3, "android.intent.action.VIEW"

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-direct {v1, v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 293
    .local v1, "intent":Landroid/content/Intent;
    const/high16 v3, 0x10000000

    invoke-virtual {v1, v3}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 295
    :try_start_1
    iget-object v3, p0, Lcom/playhaven/android/view/HTMLView$3;->this$0:Lcom/playhaven/android/view/HTMLView;

    invoke-virtual {v3}, Lcom/playhaven/android/view/HTMLView;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 300
    :goto_1
    return-void

    .line 284
    .end local v1    # "intent":Landroid/content/Intent;
    .end local v2    # "url":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 285
    .local v0, "e":Ljava/lang/Exception;
    const-string v3, "Could not retrieve launch URL from server. Using initial url."

    new-array v4, v5, [Ljava/lang/Object;

    invoke-static {v3, v4}, Lcom/playhaven/android/PlayHaven;->v(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 288
    iget-object v2, p0, Lcom/playhaven/android/view/HTMLView$3;->val$initialUrl:Ljava/lang/String;

    .restart local v2    # "url":Ljava/lang/String;
    goto :goto_0

    .line 296
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v1    # "intent":Landroid/content/Intent;
    :catch_1
    move-exception v0

    .line 297
    .restart local v0    # "e":Ljava/lang/Exception;
    const-string v3, "Unable to launch URI from template."

    new-array v4, v5, [Ljava/lang/Object;

    invoke-static {v3, v4}, Lcom/playhaven/android/PlayHaven;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 298
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method
