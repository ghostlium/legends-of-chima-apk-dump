.class Lcom/cobra/zufflin/facebook/ZufflinFacebook$7;
.super Ljava/lang/Object;
.source "ZufflinFacebook.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cobra/zufflin/facebook/ZufflinFacebook;->postScreenshot(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

.field private final synthetic val$picture_path:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/cobra/zufflin/facebook/ZufflinFacebook;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$7;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    iput-object p2, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$7;->val$picture_path:Ljava/lang/String;

    .line 711
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/cobra/zufflin/facebook/ZufflinFacebook$7;)Lcom/cobra/zufflin/facebook/ZufflinFacebook;
    .locals 1

    .prologue
    .line 711
    iget-object v0, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$7;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 15

    .prologue
    .line 715
    new-instance v3, Landroid/os/Bundle;

    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    .line 719
    .local v3, "params":Landroid/os/Bundle;
    new-instance v12, Ljava/io/File;

    iget-object v1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$7;->val$picture_path:Ljava/lang/String;

    invoke-direct {v12, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 724
    .local v12, "localImage":Ljava/io/File;
    :try_start_0
    new-instance v10, Ljava/io/FileInputStream;

    invoke-direct {v10, v12}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 725
    .local v10, "fis":Ljava/io/FileInputStream;
    new-instance v6, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v6}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 726
    .local v6, "bos":Ljava/io/ByteArrayOutputStream;
    const/16 v1, 0x400

    new-array v7, v1, [B
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    .line 728
    .local v7, "buf":[B
    :goto_0
    :try_start_1
    invoke-virtual {v10, v7}, Ljava/io/FileInputStream;->read([B)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2

    move-result v13

    .local v13, "readNum":I
    const/4 v1, -0x1

    if-ne v13, v1, :cond_0

    .line 736
    .end local v13    # "readNum":I
    :goto_1
    :try_start_2
    invoke-virtual {v6}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v11

    .line 737
    .local v11, "imageBytes":[B
    invoke-virtual {v10}, Ljava/io/FileInputStream;->close()V
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    .line 752
    const-string v1, "picture"

    invoke-virtual {v3, v1, v11}, Landroid/os/Bundle;->putByteArray(Ljava/lang/String;[B)V

    .line 754
    new-instance v0, Lcom/facebook/Request;

    invoke-static {}, Lcom/facebook/Session;->getActiveSession()Lcom/facebook/Session;

    move-result-object v1

    .line 755
    const-string v2, "me/photos"

    .line 757
    sget-object v4, Lcom/facebook/HttpMethod;->POST:Lcom/facebook/HttpMethod;

    .line 758
    new-instance v5, Lcom/cobra/zufflin/facebook/ZufflinFacebook$7$1;

    iget-object v14, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$7;->val$picture_path:Ljava/lang/String;

    invoke-direct {v5, p0, v14}, Lcom/cobra/zufflin/facebook/ZufflinFacebook$7$1;-><init>(Lcom/cobra/zufflin/facebook/ZufflinFacebook$7;Ljava/lang/String;)V

    .line 754
    invoke-direct/range {v0 .. v5}, Lcom/facebook/Request;-><init>(Lcom/facebook/Session;Ljava/lang/String;Landroid/os/Bundle;Lcom/facebook/HttpMethod;Lcom/facebook/Request$Callback;)V

    .local v0, "postScreenshot":Lcom/facebook/Request;
    const/4 v1, 0x1

    new-array v1, v1, [Lcom/facebook/Request;

    const/4 v2, 0x0

    .line 783
    aput-object v0, v1, v2

    invoke-static {v1}, Lcom/facebook/Request;->executeBatchAsync([Lcom/facebook/Request;)Lcom/facebook/RequestAsyncTask;

    .line 785
    .end local v0    # "postScreenshot":Lcom/facebook/Request;
    .end local v6    # "bos":Ljava/io/ByteArrayOutputStream;
    .end local v7    # "buf":[B
    .end local v10    # "fis":Ljava/io/FileInputStream;
    .end local v11    # "imageBytes":[B
    :goto_2
    return-void

    .line 729
    .restart local v6    # "bos":Ljava/io/ByteArrayOutputStream;
    .restart local v7    # "buf":[B
    .restart local v10    # "fis":Ljava/io/FileInputStream;
    .restart local v13    # "readNum":I
    :cond_0
    const/4 v1, 0x0

    :try_start_3
    invoke-virtual {v6, v7, v1, v13}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/io/FileNotFoundException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_0

    .line 732
    .end local v13    # "readNum":I
    :catch_0
    move-exception v9

    .line 734
    .local v9, "ex":Ljava/lang/Exception;
    :try_start_4
    iget-object v1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$7;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    const/4 v2, 0x0

    iget-object v4, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$7;->val$picture_path:Ljava/lang/String;

    invoke-virtual {v1, v2, v4}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->passOnScreenshotEvent(ZLjava/lang/String;)V
    :try_end_4
    .catch Ljava/io/FileNotFoundException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_1

    .line 739
    .end local v6    # "bos":Ljava/io/ByteArrayOutputStream;
    .end local v7    # "buf":[B
    .end local v9    # "ex":Ljava/lang/Exception;
    .end local v10    # "fis":Ljava/io/FileInputStream;
    :catch_1
    move-exception v8

    .line 741
    .local v8, "e":Ljava/io/FileNotFoundException;
    iget-object v1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$7;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    const/4 v2, 0x0

    iget-object v4, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$7;->val$picture_path:Ljava/lang/String;

    invoke-virtual {v1, v2, v4}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->passOnScreenshotEvent(ZLjava/lang/String;)V

    .line 742
    invoke-virtual {v8}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto :goto_2

    .line 745
    .end local v8    # "e":Ljava/io/FileNotFoundException;
    :catch_2
    move-exception v8

    .line 747
    .local v8, "e":Ljava/io/IOException;
    iget-object v1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$7;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    const/4 v2, 0x0

    iget-object v4, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$7;->val$picture_path:Ljava/lang/String;

    invoke-virtual {v1, v2, v4}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->passOnScreenshotEvent(ZLjava/lang/String;)V

    .line 748
    invoke-virtual {v8}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_2
.end method
