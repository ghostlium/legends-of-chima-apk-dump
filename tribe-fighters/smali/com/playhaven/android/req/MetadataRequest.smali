.class public Lcom/playhaven/android/req/MetadataRequest;
.super Lcom/playhaven/android/req/ContentRequest;
.source "MetadataRequest.java"


# direct methods
.method public constructor <init>(I)V
    .locals 0
    .param p1, "placementResId"    # I

    .prologue
    .line 33
    invoke-direct {p0, p1}, Lcom/playhaven/android/req/ContentRequest;-><init>(I)V

    .line 34
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "placementTag"    # Ljava/lang/String;

    .prologue
    .line 29
    invoke-direct {p0, p1}, Lcom/playhaven/android/req/ContentRequest;-><init>(Ljava/lang/String;)V

    .line 30
    return-void
.end method


# virtual methods
.method protected createUrl(Landroid/content/Context;)Lorg/springframework/web/util/UriComponentsBuilder;
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/playhaven/android/PlayHavenException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    .line 38
    invoke-super {p0, p1}, Lcom/playhaven/android/req/ContentRequest;->createUrl(Landroid/content/Context;)Lorg/springframework/web/util/UriComponentsBuilder;

    move-result-object v0

    .line 39
    .local v0, "builder":Lorg/springframework/web/util/UriComponentsBuilder;
    const-string v1, "metadata"

    new-array v2, v4, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Lorg/springframework/web/util/UriComponentsBuilder;->queryParam(Ljava/lang/String;[Ljava/lang/Object;)Lorg/springframework/web/util/UriComponentsBuilder;

    .line 40
    return-object v0
.end method
