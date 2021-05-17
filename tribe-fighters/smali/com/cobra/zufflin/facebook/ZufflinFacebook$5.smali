.class Lcom/cobra/zufflin/facebook/ZufflinFacebook$5;
.super Ljava/lang/Object;
.source "ZufflinFacebook.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cobra/zufflin/facebook/ZufflinFacebook;->postRequest(Ljava/lang/String;Ljava/lang/String;Ljava/util/Vector;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

.field private final synthetic val$data:Ljava/util/Vector;

.field private final synthetic val$message:Ljava/lang/String;

.field private final synthetic val$title:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/cobra/zufflin/facebook/ZufflinFacebook;Ljava/lang/String;Ljava/lang/String;Ljava/util/Vector;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$5;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    iput-object p2, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$5;->val$message:Ljava/lang/String;

    iput-object p3, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$5;->val$title:Ljava/lang/String;

    iput-object p4, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$5;->val$data:Ljava/util/Vector;

    .line 567
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/cobra/zufflin/facebook/ZufflinFacebook$5;)Lcom/cobra/zufflin/facebook/ZufflinFacebook;
    .locals 1

    .prologue
    .line 567
    iget-object v0, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$5;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 572
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 573
    .local v1, "params":Landroid/os/Bundle;
    const-string v3, "message"

    iget-object v4, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$5;->val$message:Ljava/lang/String;

    invoke-virtual {v1, v3, v4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 574
    const-string v3, "title"

    iget-object v4, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$5;->val$title:Ljava/lang/String;

    invoke-virtual {v1, v3, v4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 576
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v3, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$5;->val$data:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v3

    if-lt v0, v3, :cond_0

    .line 583
    new-instance v3, Lcom/facebook/widget/WebDialog$RequestsDialogBuilder;

    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v4

    .line 584
    invoke-static {}, Lcom/facebook/Session;->getActiveSession()Lcom/facebook/Session;

    move-result-object v5

    .line 582
    invoke-direct {v3, v4, v5, v1}, Lcom/facebook/widget/WebDialog$RequestsDialogBuilder;-><init>(Landroid/content/Context;Lcom/facebook/Session;Landroid/os/Bundle;)V

    .line 586
    new-instance v4, Lcom/cobra/zufflin/facebook/ZufflinFacebook$5$1;

    invoke-direct {v4, p0}, Lcom/cobra/zufflin/facebook/ZufflinFacebook$5$1;-><init>(Lcom/cobra/zufflin/facebook/ZufflinFacebook$5;)V

    invoke-virtual {v3, v4}, Lcom/facebook/widget/WebDialog$RequestsDialogBuilder;->setOnCompleteListener(Lcom/facebook/widget/WebDialog$OnCompleteListener;)Lcom/facebook/widget/WebDialog$BuilderBase;

    move-result-object v3

    check-cast v3, Lcom/facebook/widget/WebDialog$RequestsDialogBuilder;

    .line 612
    invoke-virtual {v3}, Lcom/facebook/widget/WebDialog$RequestsDialogBuilder;->build()Lcom/facebook/widget/WebDialog;

    move-result-object v2

    .line 613
    .local v2, "requestsDialog":Lcom/facebook/widget/WebDialog;
    invoke-virtual {v2}, Lcom/facebook/widget/WebDialog;->show()V

    .line 614
    return-void

    .line 578
    .end local v2    # "requestsDialog":Lcom/facebook/widget/WebDialog;
    :cond_0
    const-string v4, "data"

    iget-object v3, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$5;->val$data:Ljava/util/Vector;

    invoke-virtual {v3, v0}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v1, v4, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 576
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method
