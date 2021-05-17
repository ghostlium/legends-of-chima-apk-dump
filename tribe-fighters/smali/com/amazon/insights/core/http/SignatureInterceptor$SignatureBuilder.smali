.class final Lcom/amazon/insights/core/http/SignatureInterceptor$SignatureBuilder;
.super Ljava/lang/Object;
.source "SignatureInterceptor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/amazon/insights/core/http/SignatureInterceptor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "SignatureBuilder"
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "SignatureBuilder"


# instance fields
.field private body:[B

.field private fullPath:Ljava/lang/String;

.field private httpVerb:Ljava/lang/String;

.field private isBinaryRequest:Z

.field private privateKey:Ljava/lang/String;

.field private timestamp:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 88
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 98
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/amazon/insights/core/http/SignatureInterceptor$SignatureBuilder;->isBinaryRequest:Z

    return-void
.end method

.method private createHash()[B
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .prologue
    .line 159
    const-string v0, ""

    .line 161
    .local v0, "body":Ljava/lang/String;
    :try_start_0
    iget-boolean v5, p0, Lcom/amazon/insights/core/http/SignatureInterceptor$SignatureBuilder;->isBinaryRequest:Z

    if-eqz v5, :cond_0

    .line 162
    new-instance v1, Ljava/lang/String;

    iget-object v5, p0, Lcom/amazon/insights/core/http/SignatureInterceptor$SignatureBuilder;->body:[B

    invoke-static {v5}, Lorg/apache/commons/codec/binary/Base64;->encodeBase64([B)[B

    move-result-object v5

    const-string v6, "UTF-8"

    invoke-direct {v1, v5, v6}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v0    # "body":Ljava/lang/String;
    .local v1, "body":Ljava/lang/String;
    move-object v0, v1

    .line 169
    .end local v1    # "body":Ljava/lang/String;
    .restart local v0    # "body":Ljava/lang/String;
    :goto_0
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Lcom/amazon/insights/core/http/SignatureInterceptor$SignatureBuilder;->httpVerb:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/amazon/insights/core/http/SignatureInterceptor$SignatureBuilder;->fullPath:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/amazon/insights/core/http/SignatureInterceptor$SignatureBuilder;->timestamp:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/amazon/insights/core/http/SignatureInterceptor$SignatureBuilder;->privateKey:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 170
    .local v2, "corpus":Ljava/lang/String;
    const-string v5, "SHA-256"

    invoke-static {v5}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v3

    .line 171
    .local v3, "digest":Ljava/security/MessageDigest;
    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v4

    .line 172
    .local v4, "result":[B
    return-object v4

    .line 164
    .end local v2    # "corpus":Ljava/lang/String;
    .end local v3    # "digest":Ljava/security/MessageDigest;
    .end local v4    # "result":[B
    :cond_0
    :try_start_1
    new-instance v1, Ljava/lang/String;

    iget-object v5, p0, Lcom/amazon/insights/core/http/SignatureInterceptor$SignatureBuilder;->body:[B

    const-string v6, "UTF-8"

    invoke-direct {v1, v5, v6}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_0

    .end local v0    # "body":Ljava/lang/String;
    .restart local v1    # "body":Ljava/lang/String;
    move-object v0, v1

    .end local v1    # "body":Ljava/lang/String;
    .restart local v0    # "body":Ljava/lang/String;
    goto :goto_0

    .line 166
    :catch_0
    move-exception v5

    goto :goto_0
.end method


# virtual methods
.method public createSignature()Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/insights/core/http/SignatureBuilderException;
        }
    .end annotation

    .prologue
    .line 144
    const/4 v2, 0x0

    .line 146
    .local v2, "signature":Ljava/lang/String;
    :try_start_0
    invoke-direct {p0}, Lcom/amazon/insights/core/http/SignatureInterceptor$SignatureBuilder;->createHash()[B

    move-result-object v1

    .line 147
    .local v1, "hash":[B
    if-eqz v1, :cond_0

    .line 148
    new-instance v2, Ljava/lang/String;

    .end local v2    # "signature":Ljava/lang/String;
    invoke-static {v1}, Lorg/apache/commons/codec/binary/Base64;->encodeBase64([B)[B

    move-result-object v3

    const-string v4, "UTF-8"

    invoke-direct {v2, v3, v4}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_1

    .line 155
    .restart local v2    # "signature":Ljava/lang/String;
    :cond_0
    return-object v2

    .line 150
    .end local v1    # "hash":[B
    .end local v2    # "signature":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 151
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v3, Lcom/amazon/insights/core/http/SignatureBuilderException;

    const-string v4, "SHA-256 unsupported"

    invoke-direct {v3, v4, v0}, Lcom/amazon/insights/core/http/SignatureBuilderException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 152
    .end local v0    # "e":Ljava/security/NoSuchAlgorithmException;
    :catch_1
    move-exception v0

    .line 153
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v3, Lcom/amazon/insights/core/http/SignatureBuilderException;

    const-string v4, "UTF-8 encoding unsupported"

    invoke-direct {v3, v4, v0}, Lcom/amazon/insights/core/http/SignatureBuilderException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method public isBinaryRequest(Z)Lcom/amazon/insights/core/http/SignatureInterceptor$SignatureBuilder;
    .locals 0
    .param p1, "isBinaryRequest"    # Z

    .prologue
    .line 127
    iput-boolean p1, p0, Lcom/amazon/insights/core/http/SignatureInterceptor$SignatureBuilder;->isBinaryRequest:Z

    .line 128
    return-object p0
.end method

.method public withBody([B)Lcom/amazon/insights/core/http/SignatureInterceptor$SignatureBuilder;
    .locals 0
    .param p1, "body"    # [B

    .prologue
    .line 132
    iput-object p1, p0, Lcom/amazon/insights/core/http/SignatureInterceptor$SignatureBuilder;->body:[B

    .line 133
    return-object p0
.end method

.method public withFullPath(Ljava/lang/String;)Lcom/amazon/insights/core/http/SignatureInterceptor$SignatureBuilder;
    .locals 0
    .param p1, "fullPath"    # Ljava/lang/String;

    .prologue
    .line 117
    iput-object p1, p0, Lcom/amazon/insights/core/http/SignatureInterceptor$SignatureBuilder;->fullPath:Ljava/lang/String;

    .line 118
    return-object p0
.end method

.method public withHttpMethod(Lcom/amazon/insights/core/http/HttpClient$HttpMethod;)Lcom/amazon/insights/core/http/SignatureInterceptor$SignatureBuilder;
    .locals 1
    .param p1, "httpMethod"    # Lcom/amazon/insights/core/http/HttpClient$HttpMethod;

    .prologue
    .line 108
    invoke-virtual {p1}, Lcom/amazon/insights/core/http/HttpClient$HttpMethod;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/amazon/insights/core/http/SignatureInterceptor$SignatureBuilder;->withHttpVerb(Ljava/lang/String;)Lcom/amazon/insights/core/http/SignatureInterceptor$SignatureBuilder;

    move-result-object v0

    return-object v0
.end method

.method public withHttpVerb(Ljava/lang/String;)Lcom/amazon/insights/core/http/SignatureInterceptor$SignatureBuilder;
    .locals 0
    .param p1, "httpVerb"    # Ljava/lang/String;

    .prologue
    .line 112
    iput-object p1, p0, Lcom/amazon/insights/core/http/SignatureInterceptor$SignatureBuilder;->httpVerb:Ljava/lang/String;

    .line 113
    return-object p0
.end method

.method public withPrivateKey(Ljava/lang/String;)Lcom/amazon/insights/core/http/SignatureInterceptor$SignatureBuilder;
    .locals 0
    .param p1, "privateKey"    # Ljava/lang/String;

    .prologue
    .line 103
    iput-object p1, p0, Lcom/amazon/insights/core/http/SignatureInterceptor$SignatureBuilder;->privateKey:Ljava/lang/String;

    .line 104
    return-object p0
.end method

.method public withTimestamp(Ljava/lang/String;)Lcom/amazon/insights/core/http/SignatureInterceptor$SignatureBuilder;
    .locals 0
    .param p1, "timestamp"    # Ljava/lang/String;

    .prologue
    .line 122
    iput-object p1, p0, Lcom/amazon/insights/core/http/SignatureInterceptor$SignatureBuilder;->timestamp:Ljava/lang/String;

    .line 123
    return-object p0
.end method
