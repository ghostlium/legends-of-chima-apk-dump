.class Lcom/prime31/EtceteraPlugin$4$1;
.super Ljava/lang/Object;
.source "EtceteraPlugin.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/prime31/EtceteraPlugin$4;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/prime31/EtceteraPlugin$4;

.field private final synthetic val$positiveButton:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/prime31/EtceteraPlugin$4;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/prime31/EtceteraPlugin$4$1;->this$1:Lcom/prime31/EtceteraPlugin$4;

    iput-object p2, p0, Lcom/prime31/EtceteraPlugin$4$1;->val$positiveButton:Ljava/lang/String;

    .line 261
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 4
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "whichButton"    # I

    .prologue
    .line 265
    iget-object v0, p0, Lcom/prime31/EtceteraPlugin$4$1;->this$1:Lcom/prime31/EtceteraPlugin$4;

    invoke-static {v0}, Lcom/prime31/EtceteraPlugin$4;->access$0(Lcom/prime31/EtceteraPlugin$4;)Lcom/prime31/EtceteraPlugin;

    move-result-object v0

    const-string v1, "EtceteraAndroidManager"

    const-string v2, "alertButtonClicked"

    iget-object v3, p0, Lcom/prime31/EtceteraPlugin$4$1;->val$positiveButton:Ljava/lang/String;

    invoke-virtual {v0, v1, v2, v3}, Lcom/prime31/EtceteraPlugin;->UnitySendMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 266
    return-void
.end method
