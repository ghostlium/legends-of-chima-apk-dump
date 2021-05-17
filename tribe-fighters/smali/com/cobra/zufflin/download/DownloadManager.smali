.class public Lcom/cobra/zufflin/download/DownloadManager;
.super Ljava/lang/Object;
.source "DownloadManager.java"


# static fields
.field public static singleton:Lcom/cobra/zufflin/download/DownloadManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 25
    const/4 v0, 0x0

    sput-object v0, Lcom/cobra/zufflin/download/DownloadManager;->singleton:Lcom/cobra/zufflin/download/DownloadManager;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    sput-object p0, Lcom/cobra/zufflin/download/DownloadManager;->singleton:Lcom/cobra/zufflin/download/DownloadManager;

    .line 31
    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 1

    .prologue
    .line 35
    const/4 v0, 0x0

    sput-object v0, Lcom/cobra/zufflin/download/DownloadManager;->singleton:Lcom/cobra/zufflin/download/DownloadManager;

    .line 36
    return-void
.end method

.method public native doGetComplete(ILjava/lang/String;Z)V
.end method

.method public native doPostComplete(ILjava/lang/String;Z)V
.end method

.method public getData(ILjava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "id"    # I
    .param p2, "userAgent"    # Ljava/lang/String;
    .param p3, "TARGET_URL"    # Ljava/lang/String;

    .prologue
    .line 147
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/cobra/zufflin/download/DownloadManager$3;

    invoke-direct {v1, p0, p2, p3, p1}, Lcom/cobra/zufflin/download/DownloadManager$3;-><init>(Lcom/cobra/zufflin/download/DownloadManager;Ljava/lang/String;Ljava/lang/String;I)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 187
    .local v0, "background":Ljava/lang/Thread;
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 189
    return-void
.end method

.method public postData(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p1, "id"    # I
    .param p2, "userAgent"    # Ljava/lang/String;
    .param p3, "TARGET_URL"    # Ljava/lang/String;
    .param p4, "postData"    # Ljava/lang/String;

    .prologue
    .line 98
    new-instance v6, Ljava/lang/Thread;

    new-instance v0, Lcom/cobra/zufflin/download/DownloadManager$2;

    move-object v1, p0

    move-object v2, p3

    move-object v3, p2

    move-object v4, p4

    move v5, p1

    invoke-direct/range {v0 .. v5}, Lcom/cobra/zufflin/download/DownloadManager$2;-><init>(Lcom/cobra/zufflin/download/DownloadManager;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    invoke-direct {v6, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 139
    .local v6, "background":Ljava/lang/Thread;
    invoke-virtual {v6}, Ljava/lang/Thread;->start()V

    .line 141
    return-void
.end method

.method public postData(ILjava/lang/String;Ljava/lang/String;Ljava/util/Vector;Ljava/util/Vector;)V
    .locals 8
    .param p1, "id"    # I
    .param p2, "userAgent"    # Ljava/lang/String;
    .param p3, "TARGET_URL"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Vector",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Vector",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 42
    .local p4, "keys":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .local p5, "values":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    new-instance v7, Ljava/lang/Thread;

    new-instance v0, Lcom/cobra/zufflin/download/DownloadManager$1;

    move-object v1, p0

    move-object v2, p3

    move-object v3, p2

    move-object v4, p4

    move-object v5, p5

    move v6, p1

    invoke-direct/range {v0 .. v6}, Lcom/cobra/zufflin/download/DownloadManager$1;-><init>(Lcom/cobra/zufflin/download/DownloadManager;Ljava/lang/String;Ljava/lang/String;Ljava/util/Vector;Ljava/util/Vector;I)V

    invoke-direct {v7, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 89
    .local v7, "background":Ljava/lang/Thread;
    invoke-virtual {v7}, Ljava/lang/Thread;->start()V

    .line 91
    return-void
.end method
