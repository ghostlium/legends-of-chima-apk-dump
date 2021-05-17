.class public Lcom/amazon/ags/html5/util/ImageManager;
.super Ljava/lang/Object;
.source "ImageManager.java"


# static fields
.field private static final MAX_BYTES_ALLOWED:I = 0x4c4b40

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final contentManager:Lcom/amazon/ags/html5/content/ContentManager;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 23
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "GC_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-class v1, Lcom/amazon/ags/html5/util/ImageManager;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/ags/html5/util/ImageManager;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/amazon/ags/html5/content/ContentManager;)V
    .locals 0
    .param p1, "contentManager"    # Lcom/amazon/ags/html5/content/ContentManager;

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput-object p1, p0, Lcom/amazon/ags/html5/util/ImageManager;->contentManager:Lcom/amazon/ags/html5/content/ContentManager;

    .line 30
    return-void
.end method


# virtual methods
.method public final downloadImage(Ljava/lang/String;)V
    .locals 17
    .param p1, "imageUrlString"    # Ljava/lang/String;

    .prologue
    .line 33
    invoke-static/range {p1 .. p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v14

    if-nez v14, :cond_3

    .line 35
    :try_start_0
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/amazon/ags/html5/util/ImageManager;->contentManager:Lcom/amazon/ags/html5/content/ContentManager;

    invoke-virtual {v14}, Lcom/amazon/ags/html5/content/ContentManager;->getImageDirectory()Ljava/lang/String;

    move-result-object v8

    .line 36
    .local v8, "imageDirectory":Ljava/lang/String;
    const/16 v14, 0x2f

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v14

    add-int/lit8 v14, v14, 0x1

    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v15

    move-object/from16 v0, p1

    invoke-virtual {v0, v14, v15}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    .line 37
    .local v10, "imageName":Ljava/lang/String;
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    sget-object v15, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 40
    .local v7, "imageDestination":Ljava/lang/String;
    new-instance v9, Ljava/io/File;

    invoke-direct {v9, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 41
    .local v9, "imageFile":Ljava/io/File;
    invoke-virtual {v9}, Ljava/io/File;->exists()Z

    move-result v14

    if-nez v14, :cond_1

    .line 42
    new-instance v11, Ljava/net/URL;

    move-object/from16 v0, p1

    invoke-direct {v11, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 44
    .local v11, "imageUrl":Ljava/net/URL;
    new-instance v12, Ljava/io/BufferedInputStream;

    invoke-virtual {v11}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v14

    invoke-direct {v12, v14}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 45
    .local v12, "inStream":Ljava/io/InputStream;
    new-instance v13, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v13}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 46
    .local v13, "outStream":Ljava/io/ByteArrayOutputStream;
    const/16 v14, 0x400

    new-array v1, v14, [B

    .line 47
    .local v1, "buffer":[B
    const/4 v3, 0x0

    .line 49
    .local v3, "dataLength":I
    const/4 v2, 0x0

    .line 50
    .local v2, "bytesRead":I
    :cond_0
    invoke-virtual {v12, v1}, Ljava/io/InputStream;->read([B)I

    move-result v3

    if-lez v3, :cond_2

    .line 51
    add-int/2addr v2, v3

    .line 52
    const/4 v14, 0x0

    invoke-virtual {v13, v1, v14, v3}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 53
    const v14, 0x4c4b40

    if-le v2, v14, :cond_0

    .line 54
    invoke-virtual {v12}, Ljava/io/InputStream;->close()V

    .line 55
    invoke-virtual {v13}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 56
    new-instance v14, Ljava/io/IOException;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Size of image exceeded maximum length: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p1

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v14
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    .line 69
    .end local v1    # "buffer":[B
    .end local v2    # "bytesRead":I
    .end local v3    # "dataLength":I
    .end local v7    # "imageDestination":Ljava/lang/String;
    .end local v8    # "imageDirectory":Ljava/lang/String;
    .end local v9    # "imageFile":Ljava/io/File;
    .end local v10    # "imageName":Ljava/lang/String;
    .end local v11    # "imageUrl":Ljava/net/URL;
    .end local v12    # "inStream":Ljava/io/InputStream;
    .end local v13    # "outStream":Ljava/io/ByteArrayOutputStream;
    :catch_0
    move-exception v4

    .line 70
    .local v4, "e":Ljava/net/MalformedURLException;
    sget-object v14, Lcom/amazon/ags/html5/util/ImageManager;->TAG:Ljava/lang/String;

    const-string v15, "Unable to download image due to improper URL"

    invoke-static {v14, v15, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 79
    .end local v4    # "e":Ljava/net/MalformedURLException;
    :cond_1
    :goto_0
    return-void

    .line 60
    .restart local v1    # "buffer":[B
    .restart local v2    # "bytesRead":I
    .restart local v3    # "dataLength":I
    .restart local v7    # "imageDestination":Ljava/lang/String;
    .restart local v8    # "imageDirectory":Ljava/lang/String;
    .restart local v9    # "imageFile":Ljava/io/File;
    .restart local v10    # "imageName":Ljava/lang/String;
    .restart local v11    # "imageUrl":Ljava/net/URL;
    .restart local v12    # "inStream":Ljava/io/InputStream;
    .restart local v13    # "outStream":Ljava/io/ByteArrayOutputStream;
    :cond_2
    :try_start_1
    invoke-virtual {v12}, Ljava/io/InputStream;->close()V

    .line 61
    invoke-virtual {v13}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 63
    invoke-virtual {v13}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v6

    .line 65
    .local v6, "imageBytes":[B
    new-instance v5, Ljava/io/FileOutputStream;

    invoke-direct {v5, v7}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 66
    .local v5, "fileOutputStream":Ljava/io/FileOutputStream;
    invoke-virtual {v5, v6}, Ljava/io/FileOutputStream;->write([B)V

    .line 67
    invoke-virtual {v5}, Ljava/io/FileOutputStream;->close()V
    :try_end_1
    .catch Ljava/net/MalformedURLException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    goto :goto_0

    .line 71
    .end local v1    # "buffer":[B
    .end local v2    # "bytesRead":I
    .end local v3    # "dataLength":I
    .end local v5    # "fileOutputStream":Ljava/io/FileOutputStream;
    .end local v6    # "imageBytes":[B
    .end local v7    # "imageDestination":Ljava/lang/String;
    .end local v8    # "imageDirectory":Ljava/lang/String;
    .end local v9    # "imageFile":Ljava/io/File;
    .end local v10    # "imageName":Ljava/lang/String;
    .end local v11    # "imageUrl":Ljava/net/URL;
    .end local v12    # "inStream":Ljava/io/InputStream;
    .end local v13    # "outStream":Ljava/io/ByteArrayOutputStream;
    :catch_1
    move-exception v4

    .line 72
    .local v4, "e":Ljava/io/IOException;
    sget-object v14, Lcom/amazon/ags/html5/util/ImageManager;->TAG:Ljava/lang/String;

    const-string v15, "Unable to download image due to IO problem"

    invoke-static {v14, v15, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 73
    .end local v4    # "e":Ljava/io/IOException;
    :catch_2
    move-exception v4

    .line 74
    .local v4, "e":Ljava/lang/Exception;
    sget-object v14, Lcom/amazon/ags/html5/util/ImageManager;->TAG:Ljava/lang/String;

    const-string v15, "Unable to download image due to unexpected problem"

    invoke-static {v14, v15, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 77
    .end local v4    # "e":Ljava/lang/Exception;
    :cond_3
    sget-object v14, Lcom/amazon/ags/html5/util/ImageManager;->TAG:Ljava/lang/String;

    const-string v15, "Unable to download image due to empty URL supplied"

    invoke-static {v14, v15}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
