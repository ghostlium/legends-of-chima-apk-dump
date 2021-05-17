.class public Lcom/cobra/zufflin/ZufflinSettings;
.super Ljava/lang/Object;
.source "ZufflinSettings.java"


# instance fields
.field public colorBufferSize:I

.field public debug:Z

.field public depthBufferSize:I

.field public orientationLandscape:Z

.field public orientationPortrait:Z

.field public stencilBufferSize:I


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput-boolean v1, p0, Lcom/cobra/zufflin/ZufflinSettings;->debug:Z

    .line 18
    const/16 v0, 0x20

    iput v0, p0, Lcom/cobra/zufflin/ZufflinSettings;->colorBufferSize:I

    .line 19
    iput v1, p0, Lcom/cobra/zufflin/ZufflinSettings;->depthBufferSize:I

    .line 20
    iput v1, p0, Lcom/cobra/zufflin/ZufflinSettings;->stencilBufferSize:I

    .line 21
    iput-boolean v2, p0, Lcom/cobra/zufflin/ZufflinSettings;->orientationLandscape:Z

    .line 22
    iput-boolean v2, p0, Lcom/cobra/zufflin/ZufflinSettings;->orientationPortrait:Z

    .line 15
    return-void
.end method


# virtual methods
.method public load(Landroid/app/Activity;)V
    .locals 5
    .param p1, "ac"    # Landroid/app/Activity;

    .prologue
    .line 30
    :try_start_0
    invoke-virtual {p1}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {p1}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0x80

    invoke-virtual {v2, v3, v4}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 31
    .local v0, "ai":Landroid/content/pm/ApplicationInfo;
    iget-object v2, v0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    const-string v3, "debug"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, p0, Lcom/cobra/zufflin/ZufflinSettings;->debug:Z

    .line 32
    iget-object v2, v0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    const-string v3, "depth_buffer_size"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v2

    iput v2, p0, Lcom/cobra/zufflin/ZufflinSettings;->depthBufferSize:I

    .line 33
    iget-object v2, v0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    const-string v3, "color_buffer_size"

    const/16 v4, 0x20

    invoke-virtual {v2, v3, v4}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v2

    iput v2, p0, Lcom/cobra/zufflin/ZufflinSettings;->colorBufferSize:I

    .line 34
    iget-object v2, v0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    const-string v3, "stencil_buffer_size"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v2

    iput v2, p0, Lcom/cobra/zufflin/ZufflinSettings;->stencilBufferSize:I

    .line 35
    iget-object v2, v0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    const-string v3, "orientation_landscape"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, p0, Lcom/cobra/zufflin/ZufflinSettings;->orientationLandscape:Z

    .line 36
    iget-object v2, v0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    const-string v3, "orientation_portrait"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, p0, Lcom/cobra/zufflin/ZufflinSettings;->orientationPortrait:Z
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 42
    .end local v0    # "ai":Landroid/content/pm/ApplicationInfo;
    :goto_0
    return-void

    .line 38
    :catch_0
    move-exception v1

    .line 40
    .local v1, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-virtual {v1}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    goto :goto_0
.end method

.method public load(Ljava/io/InputStream;)V
    .locals 7
    .param p1, "is"    # Ljava/io/InputStream;

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 46
    const/4 v1, 0x0

    .line 49
    .local v1, "jr":Lcom/cobra/zufflin/json/JsonReader;
    :try_start_0
    new-instance v2, Lcom/cobra/zufflin/json/JsonReader;

    new-instance v4, Ljava/io/InputStreamReader;

    invoke-direct {v4, p1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v2, v4}, Lcom/cobra/zufflin/json/JsonReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 50
    .end local v1    # "jr":Lcom/cobra/zufflin/json/JsonReader;
    .local v2, "jr":Lcom/cobra/zufflin/json/JsonReader;
    :try_start_1
    invoke-virtual {v2}, Lcom/cobra/zufflin/json/JsonReader;->beginObject()V

    .line 51
    :goto_0
    invoke-virtual {v2}, Lcom/cobra/zufflin/json/JsonReader;->hasNext()Z

    move-result v4

    if-nez v4, :cond_0

    .line 120
    invoke-virtual {v2}, Lcom/cobra/zufflin/json/JsonReader;->endObject()V

    move-object v1, v2

    .line 127
    .end local v2    # "jr":Lcom/cobra/zufflin/json/JsonReader;
    .restart local v1    # "jr":Lcom/cobra/zufflin/json/JsonReader;
    :goto_1
    return-void

    .line 53
    .end local v1    # "jr":Lcom/cobra/zufflin/json/JsonReader;
    .restart local v2    # "jr":Lcom/cobra/zufflin/json/JsonReader;
    :cond_0
    invoke-virtual {v2}, Lcom/cobra/zufflin/json/JsonReader;->nextName()Ljava/lang/String;

    move-result-object v3

    .line 55
    .local v3, "name":Ljava/lang/String;
    const-string v4, "zufflin_startup"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_d

    .line 57
    invoke-virtual {v2}, Lcom/cobra/zufflin/json/JsonReader;->beginObject()V

    .line 58
    :goto_2
    invoke-virtual {v2}, Lcom/cobra/zufflin/json/JsonReader;->hasNext()Z

    move-result v4

    if-nez v4, :cond_1

    .line 113
    invoke-virtual {v2}, Lcom/cobra/zufflin/json/JsonReader;->endObject()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 123
    .end local v3    # "name":Ljava/lang/String;
    :catch_0
    move-exception v0

    move-object v1, v2

    .line 125
    .end local v2    # "jr":Lcom/cobra/zufflin/json/JsonReader;
    .local v0, "e":Ljava/io/IOException;
    .restart local v1    # "jr":Lcom/cobra/zufflin/json/JsonReader;
    :goto_3
    const-string v4, "Zufflin"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "Zufflin: Error loading Zufflin settings: "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 60
    .end local v0    # "e":Ljava/io/IOException;
    .end local v1    # "jr":Lcom/cobra/zufflin/json/JsonReader;
    .restart local v2    # "jr":Lcom/cobra/zufflin/json/JsonReader;
    .restart local v3    # "name":Ljava/lang/String;
    :cond_1
    :try_start_2
    invoke-virtual {v2}, Lcom/cobra/zufflin/json/JsonReader;->nextName()Ljava/lang/String;

    move-result-object v3

    .line 71
    const-string v4, "debug"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 73
    invoke-virtual {v2}, Lcom/cobra/zufflin/json/JsonReader;->nextInt()I

    move-result v4

    if-nez v4, :cond_2

    move v4, v5

    :goto_4
    iput-boolean v4, p0, Lcom/cobra/zufflin/ZufflinSettings;->debug:Z

    goto :goto_2

    :cond_2
    move v4, v6

    goto :goto_4

    .line 75
    :cond_3
    const-string v4, "orientation_landscape"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 77
    invoke-virtual {v2}, Lcom/cobra/zufflin/json/JsonReader;->nextInt()I

    move-result v4

    if-nez v4, :cond_4

    move v4, v5

    :goto_5
    iput-boolean v4, p0, Lcom/cobra/zufflin/ZufflinSettings;->orientationLandscape:Z

    goto :goto_2

    :cond_4
    move v4, v6

    goto :goto_5

    .line 79
    :cond_5
    const-string v4, "orientation_portrait"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_7

    .line 81
    invoke-virtual {v2}, Lcom/cobra/zufflin/json/JsonReader;->nextInt()I

    move-result v4

    if-nez v4, :cond_6

    move v4, v5

    :goto_6
    iput-boolean v4, p0, Lcom/cobra/zufflin/ZufflinSettings;->orientationPortrait:Z

    goto :goto_2

    :cond_6
    move v4, v6

    goto :goto_6

    .line 83
    :cond_7
    const-string v4, "renderer"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_c

    .line 85
    invoke-virtual {v2}, Lcom/cobra/zufflin/json/JsonReader;->beginObject()V

    .line 86
    :goto_7
    invoke-virtual {v2}, Lcom/cobra/zufflin/json/JsonReader;->hasNext()Z

    move-result v4

    if-nez v4, :cond_8

    .line 106
    invoke-virtual {v2}, Lcom/cobra/zufflin/json/JsonReader;->endObject()V

    goto :goto_2

    .line 88
    :cond_8
    invoke-virtual {v2}, Lcom/cobra/zufflin/json/JsonReader;->nextName()Ljava/lang/String;

    move-result-object v3

    .line 89
    const-string v4, "color_buffer"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_9

    .line 91
    invoke-virtual {v2}, Lcom/cobra/zufflin/json/JsonReader;->nextInt()I

    move-result v4

    iput v4, p0, Lcom/cobra/zufflin/ZufflinSettings;->colorBufferSize:I

    goto :goto_7

    .line 93
    :cond_9
    const-string v4, "depth_buffer"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_a

    .line 95
    invoke-virtual {v2}, Lcom/cobra/zufflin/json/JsonReader;->nextInt()I

    move-result v4

    iput v4, p0, Lcom/cobra/zufflin/ZufflinSettings;->depthBufferSize:I

    goto :goto_7

    .line 97
    :cond_a
    const-string v4, "stencil_buffer"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_b

    .line 99
    invoke-virtual {v2}, Lcom/cobra/zufflin/json/JsonReader;->nextInt()I

    move-result v4

    iput v4, p0, Lcom/cobra/zufflin/ZufflinSettings;->stencilBufferSize:I

    goto :goto_7

    .line 103
    :cond_b
    invoke-virtual {v2}, Lcom/cobra/zufflin/json/JsonReader;->skipValue()V

    goto :goto_7

    .line 110
    :cond_c
    invoke-virtual {v2}, Lcom/cobra/zufflin/json/JsonReader;->skipValue()V

    goto/16 :goto_2

    .line 117
    :cond_d
    invoke-virtual {v2}, Lcom/cobra/zufflin/json/JsonReader;->skipValue()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    goto/16 :goto_0

    .line 123
    .end local v2    # "jr":Lcom/cobra/zufflin/json/JsonReader;
    .end local v3    # "name":Ljava/lang/String;
    .restart local v1    # "jr":Lcom/cobra/zufflin/json/JsonReader;
    :catch_1
    move-exception v0

    goto/16 :goto_3
.end method
