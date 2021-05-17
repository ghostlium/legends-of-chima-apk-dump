.class final Lcom/unity3d/plugin/downloader/b;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field final synthetic a:Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;


# direct methods
.method constructor <init>(Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/unity3d/plugin/downloader/b;->a:Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b;->a:Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;

    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.settings.WIFI_SETTINGS"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/unity3d/plugin/downloader/UnityDownloaderActivity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method
