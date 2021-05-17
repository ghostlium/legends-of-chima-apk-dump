.class public Lcom/amazon/insights/core/io/EncryptedBufferedReader;
.super Ljava/io/BufferedReader;
.source "EncryptedBufferedReader.java"


# static fields
.field private static final BUFFER_SIZE:I = 0x400


# instance fields
.field private cipher:Ljavax/crypto/Cipher;

.field private final reader:Ljava/io/BufferedReader;


# direct methods
.method public constructor <init>(Ljava/io/BufferedReader;Ljavax/crypto/SecretKey;)V
    .locals 4
    .param p1, "reader"    # Ljava/io/BufferedReader;
    .param p2, "secretKey"    # Ljavax/crypto/SecretKey;

    .prologue
    const/4 v3, 0x0

    .line 30
    invoke-direct {p0, p1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 31
    iput-object p1, p0, Lcom/amazon/insights/core/io/EncryptedBufferedReader;->reader:Ljava/io/BufferedReader;

    .line 33
    :try_start_0
    invoke-interface {p2}, Ljavax/crypto/SecretKey;->getAlgorithm()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v1

    iput-object v1, p0, Lcom/amazon/insights/core/io/EncryptedBufferedReader;->cipher:Ljavax/crypto/Cipher;

    .line 34
    iget-object v1, p0, Lcom/amazon/insights/core/io/EncryptedBufferedReader;->cipher:Ljavax/crypto/Cipher;

    const/4 v2, 0x2

    invoke-virtual {v1, v2, p2}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljavax/crypto/NoSuchPaddingException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/security/InvalidKeyException; {:try_start_0 .. :try_end_0} :catch_2

    .line 45
    return-void

    .line 35
    :catch_0
    move-exception v0

    .line 36
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    iput-object v3, p0, Lcom/amazon/insights/core/io/EncryptedBufferedReader;->cipher:Ljavax/crypto/Cipher;

    .line 37
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 38
    .end local v0    # "e":Ljava/security/NoSuchAlgorithmException;
    :catch_1
    move-exception v0

    .line 39
    .local v0, "e":Ljavax/crypto/NoSuchPaddingException;
    iput-object v3, p0, Lcom/amazon/insights/core/io/EncryptedBufferedReader;->cipher:Ljavax/crypto/Cipher;

    .line 40
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 41
    .end local v0    # "e":Ljavax/crypto/NoSuchPaddingException;
    :catch_2
    move-exception v0

    .line 42
    .local v0, "e":Ljava/security/InvalidKeyException;
    iput-object v3, p0, Lcom/amazon/insights/core/io/EncryptedBufferedReader;->cipher:Ljavax/crypto/Cipher;

    .line 43
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 105
    iget-object v0, p0, Lcom/amazon/insights/core/io/EncryptedBufferedReader;->reader:Ljava/io/BufferedReader;

    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    .line 106
    return-void
.end method

.method public mark(I)V
    .locals 2
    .param p1, "arg0"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 145
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "This writer does not support the mark(int) method"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public markSupported()Z
    .locals 1

    .prologue
    .line 150
    const/4 v0, 0x0

    return v0
.end method

.method public read()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 110
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "This writer does not support the read() method"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public read(Ljava/nio/CharBuffer;)I
    .locals 2
    .param p1, "arg0"    # Ljava/nio/CharBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 125
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "This writer does not support the read(CharBuffer) method"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public read([C)I
    .locals 2
    .param p1, "arg0"    # [C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 115
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "This writer does not support the read(char[]) method"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public read([CII)I
    .locals 2
    .param p1, "arg0"    # [C
    .param p2, "arg1"    # I
    .param p3, "arg2"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 120
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "This writer does not support the read(char[],int,int) method"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public readLine()Ljava/lang/String;
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/amazon/insights/core/io/DecryptionException;
        }
    .end annotation

    .prologue
    .line 49
    iget-object v11, p0, Lcom/amazon/insights/core/io/EncryptedBufferedReader;->cipher:Ljavax/crypto/Cipher;

    if-nez v11, :cond_0

    .line 50
    new-instance v11, Ljava/io/IOException;

    const-string v12, "Could not build a Cipher to decrpyt the underlying writer"

    invoke-direct {v11, v12}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 53
    :cond_0
    const/4 v1, 0x0

    .line 54
    .local v1, "byteInStream":Ljava/io/ByteArrayInputStream;
    const/4 v3, 0x0

    .line 55
    .local v3, "byteOutStream":Ljava/io/ByteArrayOutputStream;
    const/4 v6, 0x0

    .line 57
    .local v6, "gzipStream":Ljava/util/zip/GZIPInputStream;
    :try_start_0
    iget-object v11, p0, Lcom/amazon/insights/core/io/EncryptedBufferedReader;->reader:Ljava/io/BufferedReader;

    invoke-virtual {v11}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    :try_end_0
    .catch Ljavax/crypto/IllegalBlockSizeException; {:try_start_0 .. :try_end_0} :catch_e
    .catch Ljavax/crypto/BadPaddingException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Lcom/amazon/insights/core/io/DecryptionException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v8

    .line 58
    .local v8, "line":Ljava/lang/String;
    if-nez v8, :cond_4

    .line 59
    const/4 v11, 0x0

    .line 88
    if-eqz v6, :cond_1

    .line 89
    invoke-virtual {v6}, Ljava/util/zip/GZIPInputStream;->close()V

    .line 91
    :cond_1
    if-eqz v1, :cond_2

    .line 92
    invoke-virtual {v1}, Ljava/io/ByteArrayInputStream;->close()V

    .line 94
    :cond_2
    if-eqz v3, :cond_3

    .line 95
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 97
    :cond_3
    const/4 v1, 0x0

    .line 98
    const/4 v6, 0x0

    .line 99
    const/4 v3, 0x0

    :goto_0
    return-object v11

    .line 62
    :cond_4
    :try_start_1
    iget-object v11, p0, Lcom/amazon/insights/core/io/EncryptedBufferedReader;->cipher:Ljavax/crypto/Cipher;

    const-string v12, "UTF-8"

    invoke-virtual {v8, v12}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v12

    invoke-static {v12}, Lorg/apache/commons/codec/binary/Base64;->decodeBase64([B)[B

    move-result-object v12

    invoke-virtual {v11, v12}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v9

    .line 64
    .local v9, "originalBytes":[B
    new-instance v2, Ljava/io/ByteArrayInputStream;

    invoke-direct {v2, v9}, Ljava/io/ByteArrayInputStream;-><init>([B)V
    :try_end_1
    .catch Ljavax/crypto/IllegalBlockSizeException; {:try_start_1 .. :try_end_1} :catch_e
    .catch Ljavax/crypto/BadPaddingException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Lcom/amazon/insights/core/io/DecryptionException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_4
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 65
    .end local v1    # "byteInStream":Ljava/io/ByteArrayInputStream;
    .local v2, "byteInStream":Ljava/io/ByteArrayInputStream;
    :try_start_2
    new-instance v4, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v4}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_2
    .catch Ljavax/crypto/IllegalBlockSizeException; {:try_start_2 .. :try_end_2} :catch_f
    .catch Ljavax/crypto/BadPaddingException; {:try_start_2 .. :try_end_2} :catch_b
    .catch Lcom/amazon/insights/core/io/DecryptionException; {:try_start_2 .. :try_end_2} :catch_8
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_5
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 67
    .end local v3    # "byteOutStream":Ljava/io/ByteArrayOutputStream;
    .local v4, "byteOutStream":Ljava/io/ByteArrayOutputStream;
    const/4 v10, 0x0

    .line 68
    .local v10, "readBytes":I
    const/16 v11, 0x400

    :try_start_3
    new-array v0, v11, [B
    :try_end_3
    .catch Ljavax/crypto/IllegalBlockSizeException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljavax/crypto/BadPaddingException; {:try_start_3 .. :try_end_3} :catch_c
    .catch Lcom/amazon/insights/core/io/DecryptionException; {:try_start_3 .. :try_end_3} :catch_9
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_6
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 70
    .local v0, "buffer":[B
    :try_start_4
    new-instance v7, Ljava/util/zip/GZIPInputStream;

    invoke-direct {v7, v2}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_11
    .catch Ljavax/crypto/IllegalBlockSizeException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljavax/crypto/BadPaddingException; {:try_start_4 .. :try_end_4} :catch_c
    .catch Lcom/amazon/insights/core/io/DecryptionException; {:try_start_4 .. :try_end_4} :catch_9
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 71
    .end local v6    # "gzipStream":Ljava/util/zip/GZIPInputStream;
    .local v7, "gzipStream":Ljava/util/zip/GZIPInputStream;
    :goto_1
    :try_start_5
    invoke-virtual {v7, v0}, Ljava/util/zip/GZIPInputStream;->read([B)I

    move-result v10

    if-lez v10, :cond_8

    .line 72
    const/4 v11, 0x0

    invoke-virtual {v4, v0, v11, v10}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0
    .catch Ljavax/crypto/IllegalBlockSizeException; {:try_start_5 .. :try_end_5} :catch_10
    .catch Ljavax/crypto/BadPaddingException; {:try_start_5 .. :try_end_5} :catch_d
    .catch Lcom/amazon/insights/core/io/DecryptionException; {:try_start_5 .. :try_end_5} :catch_a
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    goto :goto_1

    .line 74
    :catch_0
    move-exception v5

    move-object v6, v7

    .line 75
    .end local v7    # "gzipStream":Ljava/util/zip/GZIPInputStream;
    .local v5, "e":Ljava/lang/Exception;
    .restart local v6    # "gzipStream":Ljava/util/zip/GZIPInputStream;
    :goto_2
    :try_start_6
    new-instance v11, Lcom/amazon/insights/core/io/DecryptionException;

    invoke-direct {v11, v5}, Lcom/amazon/insights/core/io/DecryptionException;-><init>(Ljava/lang/Exception;)V

    throw v11
    :try_end_6
    .catch Ljavax/crypto/IllegalBlockSizeException; {:try_start_6 .. :try_end_6} :catch_1
    .catch Ljavax/crypto/BadPaddingException; {:try_start_6 .. :try_end_6} :catch_c
    .catch Lcom/amazon/insights/core/io/DecryptionException; {:try_start_6 .. :try_end_6} :catch_9
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 79
    .end local v0    # "buffer":[B
    .end local v5    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v5

    move-object v3, v4

    .end local v4    # "byteOutStream":Ljava/io/ByteArrayOutputStream;
    .restart local v3    # "byteOutStream":Ljava/io/ByteArrayOutputStream;
    move-object v1, v2

    .line 80
    .end local v2    # "byteInStream":Ljava/io/ByteArrayInputStream;
    .end local v8    # "line":Ljava/lang/String;
    .end local v9    # "originalBytes":[B
    .end local v10    # "readBytes":I
    .restart local v1    # "byteInStream":Ljava/io/ByteArrayInputStream;
    .local v5, "e":Ljavax/crypto/IllegalBlockSizeException;
    :goto_3
    :try_start_7
    new-instance v11, Lcom/amazon/insights/core/io/DecryptionException;

    invoke-direct {v11, v5}, Lcom/amazon/insights/core/io/DecryptionException;-><init>(Ljava/lang/Exception;)V

    throw v11
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 88
    .end local v5    # "e":Ljavax/crypto/IllegalBlockSizeException;
    :catchall_0
    move-exception v11

    :goto_4
    if-eqz v6, :cond_5

    .line 89
    invoke-virtual {v6}, Ljava/util/zip/GZIPInputStream;->close()V

    .line 91
    :cond_5
    if-eqz v1, :cond_6

    .line 92
    invoke-virtual {v1}, Ljava/io/ByteArrayInputStream;->close()V

    .line 94
    :cond_6
    if-eqz v3, :cond_7

    .line 95
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 97
    :cond_7
    const/4 v1, 0x0

    .line 98
    const/4 v6, 0x0

    .line 99
    const/4 v3, 0x0

    throw v11

    .line 78
    .end local v1    # "byteInStream":Ljava/io/ByteArrayInputStream;
    .end local v3    # "byteOutStream":Ljava/io/ByteArrayOutputStream;
    .end local v6    # "gzipStream":Ljava/util/zip/GZIPInputStream;
    .restart local v0    # "buffer":[B
    .restart local v2    # "byteInStream":Ljava/io/ByteArrayInputStream;
    .restart local v4    # "byteOutStream":Ljava/io/ByteArrayOutputStream;
    .restart local v7    # "gzipStream":Ljava/util/zip/GZIPInputStream;
    .restart local v8    # "line":Ljava/lang/String;
    .restart local v9    # "originalBytes":[B
    .restart local v10    # "readBytes":I
    :cond_8
    :try_start_8
    new-instance v11, Ljava/lang/String;

    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v12

    const-string v13, "UTF-8"

    invoke-direct {v11, v12, v13}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_8
    .catch Ljavax/crypto/IllegalBlockSizeException; {:try_start_8 .. :try_end_8} :catch_10
    .catch Ljavax/crypto/BadPaddingException; {:try_start_8 .. :try_end_8} :catch_d
    .catch Lcom/amazon/insights/core/io/DecryptionException; {:try_start_8 .. :try_end_8} :catch_a
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_7
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    .line 88
    if-eqz v7, :cond_9

    .line 89
    invoke-virtual {v7}, Ljava/util/zip/GZIPInputStream;->close()V

    .line 91
    :cond_9
    if-eqz v2, :cond_a

    .line 92
    invoke-virtual {v2}, Ljava/io/ByteArrayInputStream;->close()V

    .line 94
    :cond_a
    if-eqz v4, :cond_b

    .line 95
    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 97
    :cond_b
    const/4 v1, 0x0

    .line 98
    .end local v2    # "byteInStream":Ljava/io/ByteArrayInputStream;
    .restart local v1    # "byteInStream":Ljava/io/ByteArrayInputStream;
    const/4 v6, 0x0

    .line 99
    .end local v7    # "gzipStream":Ljava/util/zip/GZIPInputStream;
    .restart local v6    # "gzipStream":Ljava/util/zip/GZIPInputStream;
    const/4 v3, 0x0

    .end local v4    # "byteOutStream":Ljava/io/ByteArrayOutputStream;
    .restart local v3    # "byteOutStream":Ljava/io/ByteArrayOutputStream;
    goto :goto_0

    .line 81
    .end local v0    # "buffer":[B
    .end local v8    # "line":Ljava/lang/String;
    .end local v9    # "originalBytes":[B
    .end local v10    # "readBytes":I
    :catch_2
    move-exception v5

    .line 82
    .local v5, "e":Ljavax/crypto/BadPaddingException;
    :goto_5
    :try_start_9
    new-instance v11, Lcom/amazon/insights/core/io/DecryptionException;

    invoke-direct {v11, v5}, Lcom/amazon/insights/core/io/DecryptionException;-><init>(Ljava/lang/Exception;)V

    throw v11

    .line 83
    .end local v5    # "e":Ljavax/crypto/BadPaddingException;
    :catch_3
    move-exception v5

    .line 84
    .local v5, "e":Lcom/amazon/insights/core/io/DecryptionException;
    :goto_6
    throw v5

    .line 85
    .end local v5    # "e":Lcom/amazon/insights/core/io/DecryptionException;
    :catch_4
    move-exception v5

    .line 86
    .local v5, "e":Ljava/lang/Exception;
    :goto_7
    new-instance v11, Ljava/io/IOException;

    invoke-virtual {v5}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v11
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 88
    .end local v1    # "byteInStream":Ljava/io/ByteArrayInputStream;
    .end local v5    # "e":Ljava/lang/Exception;
    .restart local v2    # "byteInStream":Ljava/io/ByteArrayInputStream;
    .restart local v8    # "line":Ljava/lang/String;
    .restart local v9    # "originalBytes":[B
    :catchall_1
    move-exception v11

    move-object v1, v2

    .end local v2    # "byteInStream":Ljava/io/ByteArrayInputStream;
    .restart local v1    # "byteInStream":Ljava/io/ByteArrayInputStream;
    goto :goto_4

    .end local v1    # "byteInStream":Ljava/io/ByteArrayInputStream;
    .end local v3    # "byteOutStream":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "byteInStream":Ljava/io/ByteArrayInputStream;
    .restart local v4    # "byteOutStream":Ljava/io/ByteArrayOutputStream;
    .restart local v10    # "readBytes":I
    :catchall_2
    move-exception v11

    move-object v3, v4

    .end local v4    # "byteOutStream":Ljava/io/ByteArrayOutputStream;
    .restart local v3    # "byteOutStream":Ljava/io/ByteArrayOutputStream;
    move-object v1, v2

    .end local v2    # "byteInStream":Ljava/io/ByteArrayInputStream;
    .restart local v1    # "byteInStream":Ljava/io/ByteArrayInputStream;
    goto :goto_4

    .end local v1    # "byteInStream":Ljava/io/ByteArrayInputStream;
    .end local v3    # "byteOutStream":Ljava/io/ByteArrayOutputStream;
    .end local v6    # "gzipStream":Ljava/util/zip/GZIPInputStream;
    .restart local v0    # "buffer":[B
    .restart local v2    # "byteInStream":Ljava/io/ByteArrayInputStream;
    .restart local v4    # "byteOutStream":Ljava/io/ByteArrayOutputStream;
    .restart local v7    # "gzipStream":Ljava/util/zip/GZIPInputStream;
    :catchall_3
    move-exception v11

    move-object v6, v7

    .end local v7    # "gzipStream":Ljava/util/zip/GZIPInputStream;
    .restart local v6    # "gzipStream":Ljava/util/zip/GZIPInputStream;
    move-object v3, v4

    .end local v4    # "byteOutStream":Ljava/io/ByteArrayOutputStream;
    .restart local v3    # "byteOutStream":Ljava/io/ByteArrayOutputStream;
    move-object v1, v2

    .end local v2    # "byteInStream":Ljava/io/ByteArrayInputStream;
    .restart local v1    # "byteInStream":Ljava/io/ByteArrayInputStream;
    goto :goto_4

    .line 85
    .end local v0    # "buffer":[B
    .end local v1    # "byteInStream":Ljava/io/ByteArrayInputStream;
    .end local v10    # "readBytes":I
    .restart local v2    # "byteInStream":Ljava/io/ByteArrayInputStream;
    :catch_5
    move-exception v5

    move-object v1, v2

    .end local v2    # "byteInStream":Ljava/io/ByteArrayInputStream;
    .restart local v1    # "byteInStream":Ljava/io/ByteArrayInputStream;
    goto :goto_7

    .end local v1    # "byteInStream":Ljava/io/ByteArrayInputStream;
    .end local v3    # "byteOutStream":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "byteInStream":Ljava/io/ByteArrayInputStream;
    .restart local v4    # "byteOutStream":Ljava/io/ByteArrayOutputStream;
    .restart local v10    # "readBytes":I
    :catch_6
    move-exception v5

    move-object v3, v4

    .end local v4    # "byteOutStream":Ljava/io/ByteArrayOutputStream;
    .restart local v3    # "byteOutStream":Ljava/io/ByteArrayOutputStream;
    move-object v1, v2

    .end local v2    # "byteInStream":Ljava/io/ByteArrayInputStream;
    .restart local v1    # "byteInStream":Ljava/io/ByteArrayInputStream;
    goto :goto_7

    .end local v1    # "byteInStream":Ljava/io/ByteArrayInputStream;
    .end local v3    # "byteOutStream":Ljava/io/ByteArrayOutputStream;
    .end local v6    # "gzipStream":Ljava/util/zip/GZIPInputStream;
    .restart local v0    # "buffer":[B
    .restart local v2    # "byteInStream":Ljava/io/ByteArrayInputStream;
    .restart local v4    # "byteOutStream":Ljava/io/ByteArrayOutputStream;
    .restart local v7    # "gzipStream":Ljava/util/zip/GZIPInputStream;
    :catch_7
    move-exception v5

    move-object v6, v7

    .end local v7    # "gzipStream":Ljava/util/zip/GZIPInputStream;
    .restart local v6    # "gzipStream":Ljava/util/zip/GZIPInputStream;
    move-object v3, v4

    .end local v4    # "byteOutStream":Ljava/io/ByteArrayOutputStream;
    .restart local v3    # "byteOutStream":Ljava/io/ByteArrayOutputStream;
    move-object v1, v2

    .end local v2    # "byteInStream":Ljava/io/ByteArrayInputStream;
    .restart local v1    # "byteInStream":Ljava/io/ByteArrayInputStream;
    goto :goto_7

    .line 83
    .end local v0    # "buffer":[B
    .end local v1    # "byteInStream":Ljava/io/ByteArrayInputStream;
    .end local v10    # "readBytes":I
    .restart local v2    # "byteInStream":Ljava/io/ByteArrayInputStream;
    :catch_8
    move-exception v5

    move-object v1, v2

    .end local v2    # "byteInStream":Ljava/io/ByteArrayInputStream;
    .restart local v1    # "byteInStream":Ljava/io/ByteArrayInputStream;
    goto :goto_6

    .end local v1    # "byteInStream":Ljava/io/ByteArrayInputStream;
    .end local v3    # "byteOutStream":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "byteInStream":Ljava/io/ByteArrayInputStream;
    .restart local v4    # "byteOutStream":Ljava/io/ByteArrayOutputStream;
    .restart local v10    # "readBytes":I
    :catch_9
    move-exception v5

    move-object v3, v4

    .end local v4    # "byteOutStream":Ljava/io/ByteArrayOutputStream;
    .restart local v3    # "byteOutStream":Ljava/io/ByteArrayOutputStream;
    move-object v1, v2

    .end local v2    # "byteInStream":Ljava/io/ByteArrayInputStream;
    .restart local v1    # "byteInStream":Ljava/io/ByteArrayInputStream;
    goto :goto_6

    .end local v1    # "byteInStream":Ljava/io/ByteArrayInputStream;
    .end local v3    # "byteOutStream":Ljava/io/ByteArrayOutputStream;
    .end local v6    # "gzipStream":Ljava/util/zip/GZIPInputStream;
    .restart local v0    # "buffer":[B
    .restart local v2    # "byteInStream":Ljava/io/ByteArrayInputStream;
    .restart local v4    # "byteOutStream":Ljava/io/ByteArrayOutputStream;
    .restart local v7    # "gzipStream":Ljava/util/zip/GZIPInputStream;
    :catch_a
    move-exception v5

    move-object v6, v7

    .end local v7    # "gzipStream":Ljava/util/zip/GZIPInputStream;
    .restart local v6    # "gzipStream":Ljava/util/zip/GZIPInputStream;
    move-object v3, v4

    .end local v4    # "byteOutStream":Ljava/io/ByteArrayOutputStream;
    .restart local v3    # "byteOutStream":Ljava/io/ByteArrayOutputStream;
    move-object v1, v2

    .end local v2    # "byteInStream":Ljava/io/ByteArrayInputStream;
    .restart local v1    # "byteInStream":Ljava/io/ByteArrayInputStream;
    goto :goto_6

    .line 81
    .end local v0    # "buffer":[B
    .end local v1    # "byteInStream":Ljava/io/ByteArrayInputStream;
    .end local v10    # "readBytes":I
    .restart local v2    # "byteInStream":Ljava/io/ByteArrayInputStream;
    :catch_b
    move-exception v5

    move-object v1, v2

    .end local v2    # "byteInStream":Ljava/io/ByteArrayInputStream;
    .restart local v1    # "byteInStream":Ljava/io/ByteArrayInputStream;
    goto :goto_5

    .end local v1    # "byteInStream":Ljava/io/ByteArrayInputStream;
    .end local v3    # "byteOutStream":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "byteInStream":Ljava/io/ByteArrayInputStream;
    .restart local v4    # "byteOutStream":Ljava/io/ByteArrayOutputStream;
    .restart local v10    # "readBytes":I
    :catch_c
    move-exception v5

    move-object v3, v4

    .end local v4    # "byteOutStream":Ljava/io/ByteArrayOutputStream;
    .restart local v3    # "byteOutStream":Ljava/io/ByteArrayOutputStream;
    move-object v1, v2

    .end local v2    # "byteInStream":Ljava/io/ByteArrayInputStream;
    .restart local v1    # "byteInStream":Ljava/io/ByteArrayInputStream;
    goto :goto_5

    .end local v1    # "byteInStream":Ljava/io/ByteArrayInputStream;
    .end local v3    # "byteOutStream":Ljava/io/ByteArrayOutputStream;
    .end local v6    # "gzipStream":Ljava/util/zip/GZIPInputStream;
    .restart local v0    # "buffer":[B
    .restart local v2    # "byteInStream":Ljava/io/ByteArrayInputStream;
    .restart local v4    # "byteOutStream":Ljava/io/ByteArrayOutputStream;
    .restart local v7    # "gzipStream":Ljava/util/zip/GZIPInputStream;
    :catch_d
    move-exception v5

    move-object v6, v7

    .end local v7    # "gzipStream":Ljava/util/zip/GZIPInputStream;
    .restart local v6    # "gzipStream":Ljava/util/zip/GZIPInputStream;
    move-object v3, v4

    .end local v4    # "byteOutStream":Ljava/io/ByteArrayOutputStream;
    .restart local v3    # "byteOutStream":Ljava/io/ByteArrayOutputStream;
    move-object v1, v2

    .end local v2    # "byteInStream":Ljava/io/ByteArrayInputStream;
    .restart local v1    # "byteInStream":Ljava/io/ByteArrayInputStream;
    goto :goto_5

    .line 79
    .end local v0    # "buffer":[B
    .end local v8    # "line":Ljava/lang/String;
    .end local v9    # "originalBytes":[B
    .end local v10    # "readBytes":I
    :catch_e
    move-exception v5

    goto :goto_3

    .end local v1    # "byteInStream":Ljava/io/ByteArrayInputStream;
    .restart local v2    # "byteInStream":Ljava/io/ByteArrayInputStream;
    .restart local v8    # "line":Ljava/lang/String;
    .restart local v9    # "originalBytes":[B
    :catch_f
    move-exception v5

    move-object v1, v2

    .end local v2    # "byteInStream":Ljava/io/ByteArrayInputStream;
    .restart local v1    # "byteInStream":Ljava/io/ByteArrayInputStream;
    goto :goto_3

    .end local v1    # "byteInStream":Ljava/io/ByteArrayInputStream;
    .end local v3    # "byteOutStream":Ljava/io/ByteArrayOutputStream;
    .end local v6    # "gzipStream":Ljava/util/zip/GZIPInputStream;
    .restart local v0    # "buffer":[B
    .restart local v2    # "byteInStream":Ljava/io/ByteArrayInputStream;
    .restart local v4    # "byteOutStream":Ljava/io/ByteArrayOutputStream;
    .restart local v7    # "gzipStream":Ljava/util/zip/GZIPInputStream;
    .restart local v10    # "readBytes":I
    :catch_10
    move-exception v5

    move-object v6, v7

    .end local v7    # "gzipStream":Ljava/util/zip/GZIPInputStream;
    .restart local v6    # "gzipStream":Ljava/util/zip/GZIPInputStream;
    move-object v3, v4

    .end local v4    # "byteOutStream":Ljava/io/ByteArrayOutputStream;
    .restart local v3    # "byteOutStream":Ljava/io/ByteArrayOutputStream;
    move-object v1, v2

    .end local v2    # "byteInStream":Ljava/io/ByteArrayInputStream;
    .restart local v1    # "byteInStream":Ljava/io/ByteArrayInputStream;
    goto/16 :goto_3

    .line 74
    .end local v1    # "byteInStream":Ljava/io/ByteArrayInputStream;
    .end local v3    # "byteOutStream":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "byteInStream":Ljava/io/ByteArrayInputStream;
    .restart local v4    # "byteOutStream":Ljava/io/ByteArrayOutputStream;
    :catch_11
    move-exception v5

    goto/16 :goto_2
.end method

.method public ready()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 130
    iget-object v0, p0, Lcom/amazon/insights/core/io/EncryptedBufferedReader;->reader:Ljava/io/BufferedReader;

    invoke-virtual {v0}, Ljava/io/BufferedReader;->ready()Z

    move-result v0

    return v0
.end method

.method public reset()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 135
    iget-object v0, p0, Lcom/amazon/insights/core/io/EncryptedBufferedReader;->reader:Ljava/io/BufferedReader;

    invoke-virtual {v0}, Ljava/io/BufferedReader;->reset()V

    .line 136
    return-void
.end method

.method public skip(J)J
    .locals 2
    .param p1, "arg0"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 140
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "This writer does not support the skip(long) method"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
