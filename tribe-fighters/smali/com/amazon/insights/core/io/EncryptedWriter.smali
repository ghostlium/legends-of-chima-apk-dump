.class public Lcom/amazon/insights/core/io/EncryptedWriter;
.super Ljava/io/Writer;
.source "EncryptedWriter.java"


# instance fields
.field private cipher:Ljavax/crypto/Cipher;

.field private final writer:Ljava/io/Writer;


# direct methods
.method public constructor <init>(Ljava/io/Writer;Ljavax/crypto/SecretKey;)V
    .locals 4
    .param p1, "writer"    # Ljava/io/Writer;
    .param p2, "secretKey"    # Ljavax/crypto/SecretKey;

    .prologue
    const/4 v3, 0x0

    .line 24
    invoke-direct {p0}, Ljava/io/Writer;-><init>()V

    .line 22
    iput-object v3, p0, Lcom/amazon/insights/core/io/EncryptedWriter;->cipher:Ljavax/crypto/Cipher;

    .line 25
    iput-object p1, p0, Lcom/amazon/insights/core/io/EncryptedWriter;->writer:Ljava/io/Writer;

    .line 27
    :try_start_0
    invoke-interface {p2}, Ljavax/crypto/SecretKey;->getAlgorithm()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v1

    iput-object v1, p0, Lcom/amazon/insights/core/io/EncryptedWriter;->cipher:Ljavax/crypto/Cipher;

    .line 28
    iget-object v1, p0, Lcom/amazon/insights/core/io/EncryptedWriter;->cipher:Ljavax/crypto/Cipher;

    const/4 v2, 0x1

    invoke-virtual {v1, v2, p2}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljavax/crypto/NoSuchPaddingException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/security/InvalidKeyException; {:try_start_0 .. :try_end_0} :catch_2

    .line 39
    return-void

    .line 29
    :catch_0
    move-exception v0

    .line 30
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    iput-object v3, p0, Lcom/amazon/insights/core/io/EncryptedWriter;->cipher:Ljavax/crypto/Cipher;

    .line 31
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 32
    .end local v0    # "e":Ljava/security/NoSuchAlgorithmException;
    :catch_1
    move-exception v0

    .line 33
    .local v0, "e":Ljavax/crypto/NoSuchPaddingException;
    iput-object v3, p0, Lcom/amazon/insights/core/io/EncryptedWriter;->cipher:Ljavax/crypto/Cipher;

    .line 34
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 35
    .end local v0    # "e":Ljavax/crypto/NoSuchPaddingException;
    :catch_2
    move-exception v0

    .line 36
    .local v0, "e":Ljava/security/InvalidKeyException;
    iput-object v3, p0, Lcom/amazon/insights/core/io/EncryptedWriter;->cipher:Ljavax/crypto/Cipher;

    .line 37
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method


# virtual methods
.method public append(C)Ljava/io/Writer;
    .locals 2
    .param p1, "arg0"    # C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 95
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "This writer does not support the write(char) method"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public append(Ljava/lang/CharSequence;)Ljava/io/Writer;
    .locals 2
    .param p1, "arg0"    # Ljava/lang/CharSequence;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 105
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "This writer does not support the write(CharSequence) method"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public append(Ljava/lang/CharSequence;II)Ljava/io/Writer;
    .locals 2
    .param p1, "arg0"    # Ljava/lang/CharSequence;
    .param p2, "arg1"    # I
    .param p3, "arg2"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 100
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "This writer does not support the write(CharSequence,int,int) method"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic append(C)Ljava/lang/Appendable;
    .locals 1
    .param p1, "x0"    # C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 20
    invoke-virtual {p0, p1}, Lcom/amazon/insights/core/io/EncryptedWriter;->append(C)Ljava/io/Writer;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;
    .locals 1
    .param p1, "x0"    # Ljava/lang/CharSequence;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 20
    invoke-virtual {p0, p1}, Lcom/amazon/insights/core/io/EncryptedWriter;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic append(Ljava/lang/CharSequence;II)Ljava/lang/Appendable;
    .locals 1
    .param p1, "x0"    # Ljava/lang/CharSequence;
    .param p2, "x1"    # I
    .param p3, "x2"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 20
    invoke-virtual {p0, p1, p2, p3}, Lcom/amazon/insights/core/io/EncryptedWriter;->append(Ljava/lang/CharSequence;II)Ljava/io/Writer;

    move-result-object v0

    return-object v0
.end method

.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 110
    iget-object v0, p0, Lcom/amazon/insights/core/io/EncryptedWriter;->writer:Ljava/io/Writer;

    invoke-virtual {v0}, Ljava/io/Writer;->close()V

    .line 111
    return-void
.end method

.method public flush()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 115
    iget-object v0, p0, Lcom/amazon/insights/core/io/EncryptedWriter;->writer:Ljava/io/Writer;

    invoke-virtual {v0}, Ljava/io/Writer;->flush()V

    .line 116
    return-void
.end method

.method public write(I)V
    .locals 2
    .param p1, "arg0"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 90
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "This writer does not support the write(int) method"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public write(Ljava/lang/String;)V
    .locals 10
    .param p1, "str"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 43
    iget-object v6, p0, Lcom/amazon/insights/core/io/EncryptedWriter;->cipher:Ljavax/crypto/Cipher;

    if-nez v6, :cond_0

    .line 44
    new-instance v6, Ljava/io/IOException;

    const-string v7, "Could not build a Cipher to encrpyt the string"

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 47
    :cond_0
    const/4 v0, 0x0

    .line 48
    .local v0, "byteStream":Ljava/io/ByteArrayOutputStream;
    const/4 v4, 0x0

    .line 50
    .local v4, "gzipStream":Ljava/util/zip/GZIPOutputStream;
    :try_start_0
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 51
    .end local v0    # "byteStream":Ljava/io/ByteArrayOutputStream;
    .local v1, "byteStream":Ljava/io/ByteArrayOutputStream;
    :try_start_1
    new-instance v5, Ljava/util/zip/GZIPOutputStream;

    invoke-direct {v5, v1}, Ljava/util/zip/GZIPOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 52
    .end local v4    # "gzipStream":Ljava/util/zip/GZIPOutputStream;
    .local v5, "gzipStream":Ljava/util/zip/GZIPOutputStream;
    :try_start_2
    const-string v6, "UTF-8"

    invoke-virtual {p1, v6}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/zip/GZIPOutputStream;->write([B)V

    .line 53
    invoke-virtual {v5}, Ljava/util/zip/GZIPOutputStream;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 56
    :try_start_3
    iget-object v6, p0, Lcom/amazon/insights/core/io/EncryptedWriter;->cipher:Ljavax/crypto/Cipher;

    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v7

    invoke-virtual {v6, v7}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v6

    invoke-static {v6}, Lorg/apache/commons/codec/binary/Base64;->encodeBase64([B)[B

    move-result-object v3

    .line 57
    .local v3, "encryptedBytes":[B
    iget-object v6, p0, Lcom/amazon/insights/core/io/EncryptedWriter;->writer:Ljava/io/Writer;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    new-instance v8, Ljava/lang/String;

    const-string v9, "UTF-8"

    invoke-direct {v8, v3, v9}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\n"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/io/Writer;->write(Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 62
    if-eqz v1, :cond_1

    .line 63
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 65
    :cond_1
    if-eqz v5, :cond_2

    .line 66
    invoke-virtual {v5}, Ljava/util/zip/GZIPOutputStream;->close()V

    .line 68
    :cond_2
    const/4 v0, 0x0

    .line 69
    .end local v1    # "byteStream":Ljava/io/ByteArrayOutputStream;
    .restart local v0    # "byteStream":Ljava/io/ByteArrayOutputStream;
    const/4 v4, 0x0

    .line 71
    .end local v5    # "gzipStream":Ljava/util/zip/GZIPOutputStream;
    .restart local v4    # "gzipStream":Ljava/util/zip/GZIPOutputStream;
    return-void

    .line 58
    .end local v0    # "byteStream":Ljava/io/ByteArrayOutputStream;
    .end local v3    # "encryptedBytes":[B
    .end local v4    # "gzipStream":Ljava/util/zip/GZIPOutputStream;
    .restart local v1    # "byteStream":Ljava/io/ByteArrayOutputStream;
    .restart local v5    # "gzipStream":Ljava/util/zip/GZIPOutputStream;
    :catch_0
    move-exception v2

    .line 59
    .local v2, "e":Ljava/lang/Exception;
    :try_start_4
    new-instance v6, Ljava/io/IOException;

    invoke-virtual {v2}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 62
    .end local v2    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v6

    move-object v4, v5

    .end local v5    # "gzipStream":Ljava/util/zip/GZIPOutputStream;
    .restart local v4    # "gzipStream":Ljava/util/zip/GZIPOutputStream;
    move-object v0, v1

    .end local v1    # "byteStream":Ljava/io/ByteArrayOutputStream;
    .restart local v0    # "byteStream":Ljava/io/ByteArrayOutputStream;
    :goto_0
    if-eqz v0, :cond_3

    .line 63
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 65
    :cond_3
    if-eqz v4, :cond_4

    .line 66
    invoke-virtual {v4}, Ljava/util/zip/GZIPOutputStream;->close()V

    .line 68
    :cond_4
    const/4 v0, 0x0

    .line 69
    const/4 v4, 0x0

    throw v6

    .line 62
    :catchall_1
    move-exception v6

    goto :goto_0

    .end local v0    # "byteStream":Ljava/io/ByteArrayOutputStream;
    .restart local v1    # "byteStream":Ljava/io/ByteArrayOutputStream;
    :catchall_2
    move-exception v6

    move-object v0, v1

    .end local v1    # "byteStream":Ljava/io/ByteArrayOutputStream;
    .restart local v0    # "byteStream":Ljava/io/ByteArrayOutputStream;
    goto :goto_0
.end method

.method public write(Ljava/lang/String;II)V
    .locals 2
    .param p1, "str"    # Ljava/lang/String;
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 75
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "This writer does not support the write(String,int,int) method"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public write([C)V
    .locals 2
    .param p1, "chars"    # [C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 80
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "This writer does not support the write(char[]) method"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public write([CII)V
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
    .line 85
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "This writer does not support the write(char[],int,int) method"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
