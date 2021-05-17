.class public Lcom/amazon/ags/storage/EncryptionStringObfuscator;
.super Ljava/lang/Object;
.source "EncryptionStringObfuscator.java"

# interfaces
.implements Lcom/amazon/ags/storage/StringObfuscator;


# static fields
.field private static final ALGORITHM:Ljava/lang/String; = "DES"

.field private static final TAG:Ljava/lang/String;

.field private static final UTF8:Ljava/lang/String; = "UTF8"


# instance fields
.field private final key:Ljavax/crypto/SecretKey;

.field private final valid:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 22
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "GC_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-class v1, Lcom/amazon/ags/storage/EncryptionStringObfuscator;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/ags/storage/EncryptionStringObfuscator;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>([B)V
    .locals 10
    .param p1, "secretKey"    # [B

    .prologue
    const/16 v9, 0x8

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    if-eqz p1, :cond_0

    array-length v8, p1

    if-nez v8, :cond_1

    .line 29
    :cond_0
    new-instance v8, Ljava/lang/IllegalArgumentException;

    const-string v9, "secretKey must be non-null"

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 32
    :cond_1
    move-object v1, p1

    .line 36
    .local v1, "finalSecretKeyBytes":[B
    array-length v8, p1

    if-ge v8, v9, :cond_3

    .line 37
    new-array v1, v9, [B

    .line 39
    const/4 v3, 0x0

    .line 40
    .local v3, "inputArrayIndex":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v9, :cond_3

    .line 41
    aget-byte v8, p1, v3

    aput-byte v8, v1, v2

    .line 43
    add-int/lit8 v3, v3, 0x1

    .line 44
    array-length v8, p1

    if-lt v3, v8, :cond_2

    .line 45
    const/4 v3, 0x0

    .line 40
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 50
    .end local v2    # "i":I
    .end local v3    # "inputArrayIndex":I
    :cond_3
    const/4 v6, 0x0

    .line 51
    .local v6, "localKey":Ljavax/crypto/SecretKey;
    const/4 v7, 0x0

    .line 54
    .local v7, "localValid":Z
    :try_start_0
    new-instance v5, Ljavax/crypto/spec/DESKeySpec;

    invoke-direct {v5, v1}, Ljavax/crypto/spec/DESKeySpec;-><init>([B)V

    .line 55
    .local v5, "keySpec":Ljavax/crypto/spec/DESKeySpec;
    const-string v8, "DES"

    invoke-static {v8}, Ljavax/crypto/SecretKeyFactory;->getInstance(Ljava/lang/String;)Ljavax/crypto/SecretKeyFactory;

    move-result-object v4

    .line 57
    .local v4, "keyFactory":Ljavax/crypto/SecretKeyFactory;
    invoke-virtual {v4, v5}, Ljavax/crypto/SecretKeyFactory;->generateSecret(Ljava/security/spec/KeySpec;)Ljavax/crypto/SecretKey;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v6

    .line 58
    const/4 v7, 0x1

    .line 63
    .end local v4    # "keyFactory":Ljavax/crypto/SecretKeyFactory;
    .end local v5    # "keySpec":Ljavax/crypto/spec/DESKeySpec;
    :goto_1
    iput-object v6, p0, Lcom/amazon/ags/storage/EncryptionStringObfuscator;->key:Ljavax/crypto/SecretKey;

    .line 64
    iput-boolean v7, p0, Lcom/amazon/ags/storage/EncryptionStringObfuscator;->valid:Z

    .line 65
    return-void

    .line 59
    :catch_0
    move-exception v0

    .line 60
    .local v0, "e":Ljava/lang/Exception;
    sget-object v8, Lcom/amazon/ags/storage/EncryptionStringObfuscator;->TAG:Ljava/lang/String;

    const-string v9, "Failed to constructor secret key"

    invoke-static {v8, v9, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1
.end method


# virtual methods
.method public obfuscate(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p1, "input"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 75
    iget-boolean v5, p0, Lcom/amazon/ags/storage/EncryptionStringObfuscator;->valid:Z

    if-nez v5, :cond_1

    .line 94
    :cond_0
    :goto_0
    return-object v4

    .line 79
    :cond_1
    if-eqz p1, :cond_0

    .line 84
    :try_start_0
    const-string v5, "DES"

    invoke-static {v5}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v0

    .line 85
    .local v0, "cipher":Ljavax/crypto/Cipher;
    const-string v5, "UTF8"

    invoke-virtual {p1, v5}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v2

    .line 87
    .local v2, "inputBytes":[B
    const/4 v5, 0x1

    iget-object v6, p0, Lcom/amazon/ags/storage/EncryptionStringObfuscator;->key:Ljavax/crypto/SecretKey;

    invoke-virtual {v0, v5, v6}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 89
    invoke-virtual {v0, v2}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v3

    .line 91
    .local v3, "scrambledBytes":[B
    const/4 v5, 0x0

    invoke-static {v3, v5}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    goto :goto_0

    .line 92
    .end local v0    # "cipher":Ljavax/crypto/Cipher;
    .end local v2    # "inputBytes":[B
    .end local v3    # "scrambledBytes":[B
    :catch_0
    move-exception v1

    .line 93
    .local v1, "e":Ljava/lang/Exception;
    sget-object v5, Lcom/amazon/ags/storage/EncryptionStringObfuscator;->TAG:Ljava/lang/String;

    const-string v6, "Failed to obfuscate string"

    invoke-static {v5, v6, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public unobfuscate(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p1, "input"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 106
    iget-boolean v4, p0, Lcom/amazon/ags/storage/EncryptionStringObfuscator;->valid:Z

    if-nez v4, :cond_1

    .line 123
    :cond_0
    :goto_0
    return-object v3

    .line 110
    :cond_1
    if-eqz p1, :cond_0

    .line 115
    :try_start_0
    const-string v4, "DES"

    invoke-static {v4}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v0

    .line 116
    .local v0, "cipher":Ljavax/crypto/Cipher;
    const-string v4, "UTF8"

    invoke-virtual {p1, v4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v4

    const/4 v5, 0x0

    invoke-static {v4, v5}, Landroid/util/Base64;->decode([BI)[B

    move-result-object v2

    .line 118
    .local v2, "inputBytes":[B
    const/4 v4, 0x2

    iget-object v5, p0, Lcom/amazon/ags/storage/EncryptionStringObfuscator;->key:Ljavax/crypto/SecretKey;

    invoke-virtual {v0, v4, v5}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 120
    new-instance v4, Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v5

    const-string v6, "UTF8"

    invoke-direct {v4, v5, v6}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v3, v4

    goto :goto_0

    .line 121
    .end local v0    # "cipher":Ljavax/crypto/Cipher;
    .end local v2    # "inputBytes":[B
    :catch_0
    move-exception v1

    .line 122
    .local v1, "e":Ljava/lang/Exception;
    sget-object v4, Lcom/amazon/ags/storage/EncryptionStringObfuscator;->TAG:Ljava/lang/String;

    const-string v5, "Failed to unobfuscate string"

    invoke-static {v4, v5, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method
