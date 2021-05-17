.class Lcom/cobra/zufflin/facebook/ZufflinFacebook$3;
.super Ljava/lang/Object;
.source "ZufflinFacebook.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cobra/zufflin/facebook/ZufflinFacebook;->postStatusUpdate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

.field private final synthetic val$caption:Ljava/lang/String;

.field private final synthetic val$description:Ljava/lang/String;

.field private final synthetic val$link:Ljava/lang/String;

.field private final synthetic val$name:Ljava/lang/String;

.field private final synthetic val$picture:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/cobra/zufflin/facebook/ZufflinFacebook;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$3;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    iput-object p2, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$3;->val$name:Ljava/lang/String;

    iput-object p3, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$3;->val$caption:Ljava/lang/String;

    iput-object p4, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$3;->val$description:Ljava/lang/String;

    iput-object p5, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$3;->val$picture:Ljava/lang/String;

    iput-object p6, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$3;->val$link:Ljava/lang/String;

    .line 489
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    .line 493
    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/facebook/widget/FacebookDialog$ShareDialogFeature;

    const/4 v2, 0x0

    .line 494
    sget-object v3, Lcom/facebook/widget/FacebookDialog$ShareDialogFeature;->SHARE_DIALOG:Lcom/facebook/widget/FacebookDialog$ShareDialogFeature;

    aput-object v3, v1, v2

    .line 493
    invoke-static {v0, v1}, Lcom/facebook/widget/FacebookDialog;->canPresentShareDialog(Landroid/content/Context;[Lcom/facebook/widget/FacebookDialog$ShareDialogFeature;)Z

    move-result v0

    .line 494
    if-eqz v0, :cond_0

    .line 496
    new-instance v0, Lcom/facebook/widget/FacebookDialog$ShareDialogBuilder;

    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/facebook/widget/FacebookDialog$ShareDialogBuilder;-><init>(Landroid/app/Activity;)V

    .line 497
    const-string v1, "https://developers.facebook.com/android"

    invoke-virtual {v0, v1}, Lcom/facebook/widget/FacebookDialog$ShareDialogBuilder;->setLink(Ljava/lang/String;)Lcom/facebook/widget/FacebookDialog$ShareDialogBuilder;

    move-result-object v0

    .line 498
    invoke-virtual {v0}, Lcom/facebook/widget/FacebookDialog$ShareDialogBuilder;->build()Lcom/facebook/widget/FacebookDialog;

    move-result-object v6

    .line 499
    .local v6, "shareDialog":Lcom/facebook/widget/FacebookDialog;
    iget-object v0, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$3;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    invoke-static {v0}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->access$9(Lcom/cobra/zufflin/facebook/ZufflinFacebook;)Lcom/facebook/UiLifecycleHelper;

    move-result-object v0

    invoke-virtual {v6}, Lcom/facebook/widget/FacebookDialog;->present()Lcom/facebook/widget/FacebookDialog$PendingCall;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/facebook/UiLifecycleHelper;->trackPendingDialogCall(Lcom/facebook/widget/FacebookDialog$PendingCall;)V

    .line 504
    .end local v6    # "shareDialog":Lcom/facebook/widget/FacebookDialog;
    :goto_0
    return-void

    .line 502
    :cond_0
    iget-object v0, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$3;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    iget-object v1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$3;->val$name:Ljava/lang/String;

    iget-object v2, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$3;->val$caption:Ljava/lang/String;

    iget-object v3, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$3;->val$description:Ljava/lang/String;

    iget-object v4, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$3;->val$picture:Ljava/lang/String;

    iget-object v5, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$3;->val$link:Ljava/lang/String;

    invoke-static/range {v0 .. v5}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->access$10(Lcom/cobra/zufflin/facebook/ZufflinFacebook;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
