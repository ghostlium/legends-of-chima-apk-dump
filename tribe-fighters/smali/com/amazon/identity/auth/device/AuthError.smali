.class public Lcom/amazon/identity/auth/device/AuthError;
.super Ljava/lang/Exception;
.source "AuthError.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;,
        Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;
    }
.end annotation


# static fields
.field public static final AUTH_ERROR_EXECEPTION:Ljava/lang/String; = "AUTH_ERROR_EXECEPTION"

.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/amazon/identity/auth/device/AuthError;",
            ">;"
        }
    .end annotation
.end field

.field private static final LOG_TAG:Ljava/lang/String;

.field public static final RESULT_AUTH_ERROR:I = 0x1

.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private final _type:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 35
    const-class v0, Lcom/amazon/identity/auth/device/AuthError;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/identity/auth/device/AuthError;->LOG_TAG:Ljava/lang/String;

    .line 230
    new-instance v0, Lcom/amazon/identity/auth/device/AuthError$1;

    invoke-direct {v0}, Lcom/amazon/identity/auth/device/AuthError$1;-><init>()V

    sput-object v0, Lcom/amazon/identity/auth/device/AuthError;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 3
    .param p1, "source"    # Landroid/os/Parcel;

    .prologue
    .line 203
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    const-class v0, Ljava/lang/Throwable;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readValue(Ljava/lang/ClassLoader;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Throwable;

    invoke-virtual {p1}, Landroid/os/Parcel;->readSerializable()Ljava/io/Serializable;

    move-result-object v1

    check-cast v1, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    invoke-direct {p0, v2, v0, v1}, Lcom/amazon/identity/auth/device/AuthError;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;)V

    .line 204
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;)V
    .locals 0
    .param p1, "detailMessage"    # Ljava/lang/String;
    .param p2, "type"    # Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    .prologue
    .line 153
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 154
    iput-object p2, p0, Lcom/amazon/identity/auth/device/AuthError;->_type:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    .line 155
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;)V
    .locals 0
    .param p1, "detailMessage"    # Ljava/lang/String;
    .param p2, "throwable"    # Ljava/lang/Throwable;
    .param p3, "type"    # Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    .prologue
    .line 163
    invoke-direct {p0, p1, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 164
    iput-object p3, p0, Lcom/amazon/identity/auth/device/AuthError;->_type:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    .line 165
    return-void
.end method

.method public static extractError(Landroid/content/Intent;)Lcom/amazon/identity/auth/device/AuthError;
    .locals 5
    .param p0, "intent"    # Landroid/content/Intent;

    .prologue
    .line 251
    const/4 v1, 0x0

    .line 254
    .local v1, "authError":Lcom/amazon/identity/auth/device/AuthError;
    :try_start_0
    const-string v3, "AUTH_ERROR_EXECEPTION"

    invoke-virtual {p0, v3}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/amazon/identity/auth/device/AuthError;

    move-object v1, v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 260
    :goto_0
    return-object v1

    .line 256
    :catch_0
    move-exception v2

    .line 258
    .local v2, "e":Ljava/lang/Exception;
    sget-object v3, Lcom/amazon/identity/auth/device/AuthError;->LOG_TAG:Ljava/lang/String;

    const-string v4, "Error Extracting AuthError"

    invoke-static {v3, v4}, Lcom/amazon/identity/auth/device/utils/MAPLog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public static extractError(Landroid/os/Bundle;)Lcom/amazon/identity/auth/device/AuthError;
    .locals 5
    .param p0, "bundle"    # Landroid/os/Bundle;

    .prologue
    .line 271
    const/4 v1, 0x0

    .line 274
    .local v1, "authError":Lcom/amazon/identity/auth/device/AuthError;
    :try_start_0
    const-string v3, "AUTH_ERROR_EXECEPTION"

    invoke-virtual {p0, v3}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/amazon/identity/auth/device/AuthError;

    move-object v1, v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 280
    :goto_0
    return-object v1

    .line 276
    :catch_0
    move-exception v2

    .line 278
    .local v2, "e":Ljava/lang/Exception;
    sget-object v3, Lcom/amazon/identity/auth/device/AuthError;->LOG_TAG:Ljava/lang/String;

    const-string v4, "Error Extracting AuthError"

    invoke-static {v3, v4}, Lcom/amazon/identity/auth/device/utils/MAPLog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public static getAuthError(Ljava/lang/Throwable;Ljava/lang/Class;)Lcom/amazon/identity/auth/device/AuthError;
    .locals 1
    .param p0, "throwable"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Throwable;",
            "Ljava/lang/Class",
            "<TT;>;)",
            "Lcom/amazon/identity/auth/device/AuthError;"
        }
    .end annotation

    .prologue
    .line 330
    .local p1, "c":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    sget-object v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_UNKNOWN:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    invoke-static {p0, p1, v0}, Lcom/amazon/identity/auth/device/AuthError;->getAuthError(Ljava/lang/Throwable;Ljava/lang/Class;Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;)Lcom/amazon/identity/auth/device/AuthError;

    move-result-object v0

    return-object v0
.end method

.method public static getAuthError(Ljava/lang/Throwable;Ljava/lang/Class;Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;)Lcom/amazon/identity/auth/device/AuthError;
    .locals 3
    .param p0, "throwable"    # Ljava/lang/Throwable;
    .param p2, "type"    # Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Throwable;",
            "Ljava/lang/Class",
            "<TT;>;",
            "Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;",
            ")",
            "Lcom/amazon/identity/auth/device/AuthError;"
        }
    .end annotation

    .prologue
    .line 342
    .local p1, "c":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    new-instance v0, Lcom/amazon/identity/auth/device/AuthError;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unexpected error in "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, p0, p2}, Lcom/amazon/identity/auth/device/AuthError;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;)V

    return-object v0
.end method

.method public static getErrorBundle(Landroid/content/Intent;)Landroid/os/Bundle;
    .locals 1
    .param p0, "intent"    # Landroid/content/Intent;

    .prologue
    .line 304
    invoke-static {p0}, Lcom/amazon/identity/auth/device/AuthError;->extractError(Landroid/content/Intent;)Lcom/amazon/identity/auth/device/AuthError;

    move-result-object v0

    invoke-static {v0}, Lcom/amazon/identity/auth/device/AuthError;->getErrorBundle(Lcom/amazon/identity/auth/device/AuthError;)Landroid/os/Bundle;

    move-result-object v0

    return-object v0
.end method

.method public static getErrorBundle(Lcom/amazon/identity/auth/device/AuthError;)Landroid/os/Bundle;
    .locals 2
    .param p0, "e"    # Lcom/amazon/identity/auth/device/AuthError;

    .prologue
    .line 291
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 292
    .local v0, "errorBundle":Landroid/os/Bundle;
    const-string v1, "AUTH_ERROR_EXECEPTION"

    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 293
    return-object v0
.end method

.method public static getErrorBundle(Ljava/lang/Throwable;Ljava/lang/Class;Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;)Landroid/os/Bundle;
    .locals 1
    .param p0, "throwable"    # Ljava/lang/Throwable;
    .param p2, "authErrorType"    # Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Throwable;",
            "Ljava/lang/Class",
            "<TT;>;",
            "Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;",
            ")",
            "Landroid/os/Bundle;"
        }
    .end annotation

    .prologue
    .line 318
    .local p1, "c":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-static {p0, p1, p2}, Lcom/amazon/identity/auth/device/AuthError;->getAuthError(Ljava/lang/Throwable;Ljava/lang/Class;Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;)Lcom/amazon/identity/auth/device/AuthError;

    move-result-object v0

    invoke-static {v0}, Lcom/amazon/identity/auth/device/AuthError;->getErrorBundle(Lcom/amazon/identity/auth/device/AuthError;)Landroid/os/Bundle;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 196
    const/4 v0, 0x0

    return v0
.end method

.method public getCategory()Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;
    .locals 1

    .prologue
    .line 171
    iget-object v0, p0, Lcom/amazon/identity/auth/device/AuthError;->_type:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    invoke-virtual {v0}, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->getCategory()Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;

    move-result-object v0

    return-object v0
.end method

.method public getType()Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;
    .locals 1

    .prologue
    .line 178
    iget-object v0, p0, Lcom/amazon/identity/auth/device/AuthError;->_type:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 187
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "AuthError cat= "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/amazon/identity/auth/device/AuthError;->_type:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    invoke-virtual {v1}, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->getCategory()Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " type="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/amazon/identity/auth/device/AuthError;->_type:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " - "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-super {p0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 211
    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/AuthError;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 212
    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/AuthError;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 214
    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/AuthError;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeValue(Ljava/lang/Object;)V

    .line 220
    :goto_0
    iget-object v0, p0, Lcom/amazon/identity/auth/device/AuthError;->_type:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeSerializable(Ljava/io/Serializable;)V

    .line 221
    return-void

    .line 218
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeValue(Ljava/lang/Object;)V

    goto :goto_0
.end method
