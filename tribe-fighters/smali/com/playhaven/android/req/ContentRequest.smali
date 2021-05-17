.class public Lcom/playhaven/android/req/ContentRequest;
.super Lcom/playhaven/android/req/PlayHavenRequest;
.source "ContentRequest.java"


# static fields
.field private static final SSTART:Ljava/lang/String; = "sstart"

.field private static final STIME:Ljava/lang/String; = "stime"


# instance fields
.field private placementResId:I

.field private placementTag:Ljava/lang/String;

.field private preload:Z


# direct methods
.method public constructor <init>(I)V
    .locals 1
    .param p1, "placementResId"    # I

    .prologue
    .line 49
    invoke-direct {p0}, Lcom/playhaven/android/req/PlayHavenRequest;-><init>()V

    .line 37
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/playhaven/android/req/ContentRequest;->placementTag:Ljava/lang/String;

    .line 38
    const/4 v0, -0x1

    iput v0, p0, Lcom/playhaven/android/req/ContentRequest;->placementResId:I

    .line 39
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/playhaven/android/req/ContentRequest;->preload:Z

    .line 50
    iput p1, p0, Lcom/playhaven/android/req/ContentRequest;->placementResId:I

    .line 51
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "placementTag"    # Ljava/lang/String;

    .prologue
    .line 43
    invoke-direct {p0}, Lcom/playhaven/android/req/PlayHavenRequest;-><init>()V

    .line 37
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/playhaven/android/req/ContentRequest;->placementTag:Ljava/lang/String;

    .line 38
    const/4 v0, -0x1

    iput v0, p0, Lcom/playhaven/android/req/ContentRequest;->placementResId:I

    .line 39
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/playhaven/android/req/ContentRequest;->preload:Z

    .line 44
    iput-object p1, p0, Lcom/playhaven/android/req/ContentRequest;->placementTag:Ljava/lang/String;

    .line 45
    return-void
.end method


# virtual methods
.method protected createUrl(Landroid/content/Context;)Lorg/springframework/web/util/UriComponentsBuilder;
    .locals 15
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/playhaven/android/PlayHavenException;
        }
    .end annotation

    .prologue
    .line 55
    invoke-super/range {p0 .. p1}, Lcom/playhaven/android/req/PlayHavenRequest;->createUrl(Landroid/content/Context;)Lorg/springframework/web/util/UriComponentsBuilder;

    move-result-object v0

    .line 56
    .local v0, "builder":Lorg/springframework/web/util/UriComponentsBuilder;
    iget v11, p0, Lcom/playhaven/android/req/ContentRequest;->placementResId:I

    const/4 v12, -0x1

    if-eq v11, v12, :cond_0

    .line 57
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    iget v12, p0, Lcom/playhaven/android/req/ContentRequest;->placementResId:I

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v11

    iput-object v11, p0, Lcom/playhaven/android/req/ContentRequest;->placementTag:Ljava/lang/String;

    .line 59
    :cond_0
    iget-object v11, p0, Lcom/playhaven/android/req/ContentRequest;->placementTag:Ljava/lang/String;

    if-eqz v11, :cond_1

    .line 60
    const-string v11, "placement_id"

    const/4 v12, 0x1

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    iget-object v14, p0, Lcom/playhaven/android/req/ContentRequest;->placementTag:Ljava/lang/String;

    aput-object v14, v12, v13

    invoke-virtual {v0, v11, v12}, Lorg/springframework/web/util/UriComponentsBuilder;->queryParam(Ljava/lang/String;[Ljava/lang/Object;)Lorg/springframework/web/util/UriComponentsBuilder;

    .line 62
    :cond_1
    const-string v12, "preload"

    const/4 v11, 0x1

    new-array v13, v11, [Ljava/lang/Object;

    const/4 v14, 0x0

    invoke-virtual {p0}, Lcom/playhaven/android/req/ContentRequest;->isPreload()Z

    move-result v11

    if-eqz v11, :cond_2

    const-string v11, "1"

    :goto_0
    aput-object v11, v13, v14

    invoke-virtual {v0, v12, v13}, Lorg/springframework/web/util/UriComponentsBuilder;->queryParam(Ljava/lang/String;[Ljava/lang/Object;)Lorg/springframework/web/util/UriComponentsBuilder;

    .line 64
    invoke-static/range {p1 .. p1}, Lcom/playhaven/android/PlayHaven;->getPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v5

    .line 65
    .local v5, "pref":Landroid/content/SharedPreferences;
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v6

    .line 66
    .local v6, "rightNow":Ljava/util/Calendar;
    invoke-virtual {v6}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v1

    .line 67
    .local v1, "date":Ljava/util/Date;
    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v3

    .line 68
    .local v3, "end":J
    const-string v11, "sstart"

    invoke-interface {v5, v11, v3, v4}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v7

    .line 69
    .local v7, "start":J
    sub-long v11, v3, v7

    const-wide/16 v13, 0x3e8

    div-long v9, v11, v13

    .line 71
    .local v9, "stime":J
    const-string v11, "stime"

    const/4 v12, 0x1

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v14

    aput-object v14, v12, v13

    invoke-virtual {v0, v11, v12}, Lorg/springframework/web/util/UriComponentsBuilder;->queryParam(Ljava/lang/String;[Ljava/lang/Object;)Lorg/springframework/web/util/UriComponentsBuilder;

    .line 74
    invoke-interface {v5}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    .line 75
    .local v2, "edit":Landroid/content/SharedPreferences$Editor;
    const-string v11, "stime"

    invoke-interface {v2, v11, v9, v10}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 76
    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 78
    return-object v0

    .line 62
    .end local v1    # "date":Ljava/util/Date;
    .end local v2    # "edit":Landroid/content/SharedPreferences$Editor;
    .end local v3    # "end":J
    .end local v5    # "pref":Landroid/content/SharedPreferences;
    .end local v6    # "rightNow":Ljava/util/Calendar;
    .end local v7    # "start":J
    .end local v9    # "stime":J
    :cond_2
    const-string v11, "0"

    goto :goto_0
.end method

.method protected getApiPath(Landroid/content/Context;)I
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 83
    invoke-virtual {p0, p1}, Lcom/playhaven/android/req/ContentRequest;->getCompat(Landroid/content/Context;)Lcom/playhaven/android/compat/VendorCompat;

    move-result-object v0

    sget-object v1, Lcom/playhaven/android/compat/VendorCompat$ResourceType;->string:Lcom/playhaven/android/compat/VendorCompat$ResourceType;

    const-string v2, "playhaven_request_content"

    invoke-virtual {v0, p1, v1, v2}, Lcom/playhaven/android/compat/VendorCompat;->getResourceId(Landroid/content/Context;Lcom/playhaven/android/compat/VendorCompat$ResourceType;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public isPreload()Z
    .locals 1

    .prologue
    .line 87
    iget-boolean v0, p0, Lcom/playhaven/android/req/ContentRequest;->preload:Z

    return v0
.end method

.method public setPreload(Z)V
    .locals 0
    .param p1, "preload"    # Z

    .prologue
    .line 91
    iput-boolean p1, p0, Lcom/playhaven/android/req/ContentRequest;->preload:Z

    .line 92
    return-void
.end method
