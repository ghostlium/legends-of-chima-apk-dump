.class Lcom/prime31/GoogleIABPlugin$1;
.super Ljava/lang/Object;
.source "GoogleIABPlugin.java"

# interfaces
.implements Lcom/prime31/util/IabHelper$OnIabSetupFinishedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/prime31/GoogleIABPlugin;->init(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/prime31/GoogleIABPlugin;


# direct methods
.method constructor <init>(Lcom/prime31/GoogleIABPlugin;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/prime31/GoogleIABPlugin$1;->this$0:Lcom/prime31/GoogleIABPlugin;

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onIabSetupFinished(Lcom/prime31/util/IabResult;)V
    .locals 4
    .param p1, "result"    # Lcom/prime31/util/IabResult;

    .prologue
    .line 72
    invoke-virtual {p1}, Lcom/prime31/util/IabResult;->isSuccess()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 74
    iget-object v0, p0, Lcom/prime31/GoogleIABPlugin$1;->this$0:Lcom/prime31/GoogleIABPlugin;

    const-string v1, "GoogleIABManager"

    const-string v2, "billingSupported"

    const-string v3, ""

    invoke-virtual {v0, v1, v2, v3}, Lcom/prime31/GoogleIABPlugin;->UnitySendMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    :goto_0
    return-void

    .line 78
    :cond_0
    const-string v0, "Prime31"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "billing not supported: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/prime31/util/IabResult;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    iget-object v0, p0, Lcom/prime31/GoogleIABPlugin$1;->this$0:Lcom/prime31/GoogleIABPlugin;

    const-string v1, "GoogleIABManager"

    const-string v2, "billingNotSupported"

    invoke-virtual {p1}, Lcom/prime31/util/IabResult;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Lcom/prime31/GoogleIABPlugin;->UnitySendMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
