.class Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity$1;
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
    iput-object p1, p0, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity$1;->this$0:Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;

    .line 196
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 201
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity$1;->this$0:Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;

    invoke-static {v0}, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->access$0(Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 203
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity$1;->this$0:Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;

    invoke-static {v0}, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->access$1(Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;)Lcom/google/android/vending/expansion/downloader/IDownloaderService;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 204
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity$1;->this$0:Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;

    invoke-static {v0}, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->access$1(Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;)Lcom/google/android/vending/expansion/downloader/IDownloaderService;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/vending/expansion/downloader/IDownloaderService;->requestContinueDownload()V

    .line 211
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity$1;->this$0:Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;

    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity$1;->this$0:Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;

    invoke-static {v0}, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->access$0(Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;)Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x0

    :goto_1
    invoke-static {v1, v0}, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->access$2(Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;Z)V

    .line 212
    return-void

    .line 208
    :cond_1
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity$1;->this$0:Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;

    invoke-static {v0}, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->access$1(Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;)Lcom/google/android/vending/expansion/downloader/IDownloaderService;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 209
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity$1;->this$0:Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;

    invoke-static {v0}, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->access$1(Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;)Lcom/google/android/vending/expansion/downloader/IDownloaderService;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/vending/expansion/downloader/IDownloaderService;->requestPauseDownload()V

    goto :goto_0

    .line 211
    :cond_2
    const/4 v0, 0x1

    goto :goto_1
.end method
