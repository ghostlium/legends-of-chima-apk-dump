.class Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity$2;
.super Ljava/lang/Object;
.source "ZufflinObbDownloaderActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->initializeDownloadUI()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;


# direct methods
.method constructor <init>(Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity$2;->this$0:Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;

    .line 215
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 221
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity$2;->this$0:Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;

    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.settings.WIFI_SETTINGS"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->startActivity(Landroid/content/Intent;)V

    .line 222
    return-void
.end method
