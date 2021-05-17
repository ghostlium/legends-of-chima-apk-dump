.class Lcom/cobra/zufflin/facebook/ZufflinFacebook$8;
.super Ljava/lang/Object;
.source "ZufflinFacebook.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cobra/zufflin/facebook/ZufflinFacebook;->postPhoto(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

.field private final synthetic val$picture_path:Ljava/lang/String;

.field private final synthetic val$title:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/cobra/zufflin/facebook/ZufflinFacebook;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$8;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    iput-object p2, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$8;->val$picture_path:Ljava/lang/String;

    iput-object p3, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$8;->val$title:Ljava/lang/String;

    .line 813
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/cobra/zufflin/facebook/ZufflinFacebook$8;)Lcom/cobra/zufflin/facebook/ZufflinFacebook;
    .locals 1

    .prologue
    .line 813
    iget-object v0, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$8;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 15

    .prologue
    .line 817
    new-instance v3, Landroid/os/Bundle;

    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    .line 821
    .local v3, "params":Landroid/os/Bundle;
    new-instance v11, Ljava/io/File;

    iget-object v1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$8;->val$picture_path:Ljava/lang/String;

    invoke-direct {v11, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 826
    .local v11, "localImage":Ljava/io/File;
    :try_start_0
    new-instance v9, Ljava/io/FileInputStream;

    invoke-direct {v9, v11}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 827
    .local v9, "fis":Ljava/io/FileInputStream;
    new-instance v6, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v6}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 828
    .local v6, "bos":Ljava/io/ByteArrayOutputStream;
    const/16 v1, 0x400

    new-array v7, v1, [B
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    .line 830
    .local v7, "buf":[B
    :goto_0
    :try_start_1
    invoke-virtual {v9, v7}, Ljava/io/FileInputStream;->read([B)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2

    move-result v12

    .local v12, "readNum":I
    const/4 v1, -0x1

    if-ne v12, v1, :cond_0

    .line 836
    .end local v12    # "readNum":I
    :goto_1
    :try_start_2
    invoke-virtual {v6}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v10

    .line 837
    .local v10, "imageBytes":[B
    invoke-virtual {v9}, Ljava/io/FileInputStream;->close()V
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    .line 858
    const-string v1, "picture"

    invoke-virtual {v3, v1, v10}, Landroid/os/Bundle;->putByteArray(Ljava/lang/String;[B)V

    .line 860
    new-instance v0, Lcom/facebook/Request;

    invoke-static {}, Lcom/facebook/Session;->getActiveSession()Lcom/facebook/Session;

    move-result-object v1

    .line 861
    const-string v2, "me/photos"

    .line 863
    sget-object v4, Lcom/facebook/HttpMethod;->POST:Lcom/facebook/HttpMethod;

    .line 864
    new-instance v5, Lcom/cobra/zufflin/facebook/ZufflinFacebook$8$1;

    iget-object v13, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$8;->val$title:Ljava/lang/String;

    iget-object v14, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$8;->val$picture_path:Ljava/lang/String;

    invoke-direct {v5, p0, v13, v14}, Lcom/cobra/zufflin/facebook/ZufflinFacebook$8$1;-><init>(Lcom/cobra/zufflin/facebook/ZufflinFacebook$8;Ljava/lang/String;Ljava/lang/String;)V

    .line 860
    invoke-direct/range {v0 .. v5}, Lcom/facebook/Request;-><init>(Lcom/facebook/Session;Ljava/lang/String;Landroid/os/Bundle;Lcom/facebook/HttpMethod;Lcom/facebook/Request$Callback;)V

    .local v0, "postPhoto":Lcom/facebook/Request;
    const/4 v1, 0x1

    new-array v1, v1, [Lcom/facebook/Request;

    const/4 v2, 0x0

    .line 894
    aput-object v0, v1, v2

    invoke-static {v1}, Lcom/facebook/Request;->executeBatchAsync([Lcom/facebook/Request;)Lcom/facebook/RequestAsyncTask;

    .line 895
    .end local v0    # "postPhoto":Lcom/facebook/Request;
    .end local v6    # "bos":Ljava/io/ByteArrayOutputStream;
    .end local v7    # "buf":[B
    .end local v9    # "fis":Ljava/io/FileInputStream;
    .end local v10    # "imageBytes":[B
    :goto_2
    return-void

    .line 831
    .restart local v6    # "bos":Ljava/io/ByteArrayOutputStream;
    .restart local v7    # "buf":[B
    .restart local v9    # "fis":Ljava/io/FileInputStream;
    .restart local v12    # "readNum":I
    :cond_0
    const/4 v1, 0x0

    :try_start_3
    invoke-virtual {v6, v7, v1, v12}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/io/FileNotFoundException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_0

    .line 833
    .end local v12    # "readNum":I
    :catch_0
    move-exception v1

    goto :goto_1

    .line 839
    .end local v6    # "bos":Ljava/io/ByteArrayOutputStream;
    .end local v7    # "buf":[B
    .end local v9    # "fis":Ljava/io/FileInputStream;
    :catch_1
    move-exception v8

    .line 841
    .local v8, "e":Ljava/io/FileNotFoundException;
    iget-object v1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$8;->val$title:Ljava/lang/String;

    const-string v2, "delete"

    if-ne v1, v2, :cond_1

    .line 842
    iget-object v1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$8;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    const/4 v2, 0x0

    iget-object v4, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$8;->val$picture_path:Ljava/lang/String;

    invoke-virtual {v1, v2, v4}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->passOnScreenshotEvent(ZLjava/lang/String;)V

    .line 845
    :goto_3
    invoke-virtual {v8}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto :goto_2

    .line 844
    :cond_1
    iget-object v1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$8;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->passOnPhotoEvent(Z)V

    goto :goto_3

    .line 848
    .end local v8    # "e":Ljava/io/FileNotFoundException;
    :catch_2
    move-exception v8

    .line 850
    .local v8, "e":Ljava/io/IOException;
    iget-object v1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$8;->val$title:Ljava/lang/String;

    const-string v2, "delete"

    if-ne v1, v2, :cond_2

    .line 851
    iget-object v1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$8;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    const/4 v2, 0x0

    iget-object v4, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$8;->val$picture_path:Ljava/lang/String;

    invoke-virtual {v1, v2, v4}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->passOnScreenshotEvent(ZLjava/lang/String;)V

    .line 854
    :goto_4
    invoke-virtual {v8}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_2

    .line 853
    :cond_2
    iget-object v1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$8;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->passOnPhotoEvent(Z)V

    goto :goto_4
.end method
