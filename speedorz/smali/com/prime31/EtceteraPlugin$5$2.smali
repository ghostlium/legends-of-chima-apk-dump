.class Lcom/prime31/EtceteraPlugin$5$2;
.super Ljava/lang/Object;
.source "EtceteraPlugin.java"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/prime31/EtceteraPlugin$5;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/prime31/EtceteraPlugin$5;


# direct methods
.method constructor <init>(Lcom/prime31/EtceteraPlugin$5;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/prime31/EtceteraPlugin$5$2;->this$1:Lcom/prime31/EtceteraPlugin$5;

    .line 302
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 4
    .param p1, "arg0"    # Landroid/content/DialogInterface;

    .prologue
    .line 306
    iget-object v0, p0, Lcom/prime31/EtceteraPlugin$5$2;->this$1:Lcom/prime31/EtceteraPlugin$5;

    invoke-static {v0}, Lcom/prime31/EtceteraPlugin$5;->access$0(Lcom/prime31/EtceteraPlugin$5;)Lcom/prime31/EtceteraPlugin;

    move-result-object v0

    const-string v1, "EtceteraAndroidManager"

    const-string v2, "promptCancelled"

    const-string v3, ""

    invoke-virtual {v0, v1, v2, v3}, Lcom/prime31/EtceteraPlugin;->UnitySendMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 307
    return-void
.end method
