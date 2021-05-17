.class Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity$3;
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
    iput-object p1, p0, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity$3;->this$0:Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;

    .line 226
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 231
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity$3;->this$0:Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;

    invoke-static {v0}, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->access$1(Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;)Lcom/google/android/vending/expansion/downloader/IDownloaderService;

    move-result-object v0

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lcom/google/android/vending/expansion/downloader/IDownloaderService;->setDownloadFlags(I)V

    .line 232
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity$3;->this$0:Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;

    invoke-static {v0}, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->access$1(Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;)Lcom/google/android/vending/expansion/downloader/IDownloaderService;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/vending/expansion/downloader/IDownloaderService;->requestContinueDownload()V

    .line 233
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity$3;->this$0:Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;

    invoke-static {v0}, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;->access$3(Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;)Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 234
    return-void
.end method
