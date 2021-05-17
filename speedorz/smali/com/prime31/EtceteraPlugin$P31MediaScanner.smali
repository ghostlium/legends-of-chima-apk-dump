.class public Lcom/prime31/EtceteraPlugin$P31MediaScanner;
.super Ljava/lang/Object;
.source "EtceteraPlugin.java"

# interfaces
.implements Landroid/media/MediaScannerConnection$MediaScannerConnectionClient;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/prime31/EtceteraPlugin;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "P31MediaScanner"
.end annotation


# instance fields
.field private _file:Ljava/io/File;

.field private _scanner:Landroid/media/MediaScannerConnection;

.field private _scannerConnected:Z

.field final synthetic this$0:Lcom/prime31/EtceteraPlugin;


# direct methods
.method public constructor <init>(Lcom/prime31/EtceteraPlugin;Ljava/io/File;)V
    .locals 0
    .param p2, "f"    # Ljava/io/File;

    .prologue
    .line 853
    iput-object p1, p0, Lcom/prime31/EtceteraPlugin$P31MediaScanner;->this$0:Lcom/prime31/EtceteraPlugin;

    .line 852
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 854
    iput-object p2, p0, Lcom/prime31/EtceteraPlugin$P31MediaScanner;->_file:Ljava/io/File;

    .line 855
    return-void
.end method


# virtual methods
.method public onMediaScannerConnected()V
    .locals 3

    .prologue
    .line 871
    sget-object v0, Lcom/prime31/EtceteraPlugin;->TAG:Ljava/lang/String;

    const-string v1, "scanner connected"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 872
    iget-object v0, p0, Lcom/prime31/EtceteraPlugin$P31MediaScanner;->_scanner:Landroid/media/MediaScannerConnection;

    if-eqz v0, :cond_0

    .line 873
    iget-object v0, p0, Lcom/prime31/EtceteraPlugin$P31MediaScanner;->_scanner:Landroid/media/MediaScannerConnection;

    iget-object v1, p0, Lcom/prime31/EtceteraPlugin$P31MediaScanner;->_file:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    const-string v2, "image/png"

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaScannerConnection;->scanFile(Ljava/lang/String;Ljava/lang/String;)V

    .line 875
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/prime31/EtceteraPlugin$P31MediaScanner;->_scannerConnected:Z

    .line 876
    return-void
.end method

.method public onScanCompleted(Ljava/lang/String;Landroid/net/Uri;)V
    .locals 3
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "arg1"    # Landroid/net/Uri;

    .prologue
    .line 882
    sget-object v0, Lcom/prime31/EtceteraPlugin;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "scanner finished for file: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 883
    return-void
.end method

.method public setScanner(Landroid/media/MediaScannerConnection;)V
    .locals 3
    .param p1, "scanner"    # Landroid/media/MediaScannerConnection;

    .prologue
    .line 860
    sget-object v0, Lcom/prime31/EtceteraPlugin;->TAG:Ljava/lang/String;

    const-string v1, "scanner set"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 861
    iput-object p1, p0, Lcom/prime31/EtceteraPlugin$P31MediaScanner;->_scanner:Landroid/media/MediaScannerConnection;

    .line 863
    iget-boolean v0, p0, Lcom/prime31/EtceteraPlugin$P31MediaScanner;->_scannerConnected:Z

    if-eqz v0, :cond_0

    .line 864
    iget-object v0, p0, Lcom/prime31/EtceteraPlugin$P31MediaScanner;->_scanner:Landroid/media/MediaScannerConnection;

    iget-object v1, p0, Lcom/prime31/EtceteraPlugin$P31MediaScanner;->_file:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    const-string v2, "image/png"

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaScannerConnection;->scanFile(Ljava/lang/String;Ljava/lang/String;)V

    .line 865
    :cond_0
    return-void
.end method
