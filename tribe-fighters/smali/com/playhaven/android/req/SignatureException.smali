.class public Lcom/playhaven/android/req/SignatureException;
.super Lcom/playhaven/android/PlayHavenException;
.source "SignatureException.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/playhaven/android/req/SignatureException$Type;
    }
.end annotation


# static fields
.field private static final messageFmt:Ljava/lang/String; = "The request returned an invalid %s signature. %s"

.field private static final serialVersionUID:J = 0x7e3f7559e96ccb66L


# direct methods
.method public constructor <init>(Lcom/playhaven/android/req/SignatureException$Type;)V
    .locals 1
    .param p1, "type"    # Lcom/playhaven/android/req/SignatureException$Type;

    .prologue
    .line 39
    const-string v0, ""

    invoke-direct {p0, p1, v0}, Lcom/playhaven/android/req/SignatureException;-><init>(Lcom/playhaven/android/req/SignatureException$Type;Ljava/lang/String;)V

    .line 40
    return-void
.end method

.method public constructor <init>(Lcom/playhaven/android/req/SignatureException$Type;Ljava/lang/String;)V
    .locals 3
    .param p1, "type"    # Lcom/playhaven/android/req/SignatureException$Type;
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 47
    const-string v0, "The request returned an invalid %s signature. %s"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const/4 v2, 0x1

    aput-object p2, v1, v2

    invoke-direct {p0, v0, v1}, Lcom/playhaven/android/PlayHavenException;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 48
    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;Lcom/playhaven/android/req/SignatureException$Type;)V
    .locals 4
    .param p1, "cause"    # Ljava/lang/Throwable;
    .param p2, "type"    # Lcom/playhaven/android/req/SignatureException$Type;

    .prologue
    .line 55
    const-string v0, "The request returned an invalid %s signature. %s"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    const/4 v2, 0x1

    const-string v3, ""

    aput-object v3, v1, v2

    invoke-direct {p0, p1, v0, v1}, Lcom/playhaven/android/PlayHavenException;-><init>(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 56
    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;Lcom/playhaven/android/req/SignatureException$Type;Ljava/lang/String;)V
    .locals 3
    .param p1, "cause"    # Ljava/lang/Throwable;
    .param p2, "type"    # Lcom/playhaven/android/req/SignatureException$Type;
    .param p3, "message"    # Ljava/lang/String;

    .prologue
    .line 63
    const-string v0, "The request returned an invalid %s signature. %s"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    const/4 v2, 0x1

    aput-object p3, v1, v2

    invoke-direct {p0, p1, v0, v1}, Lcom/playhaven/android/PlayHavenException;-><init>(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 64
    return-void
.end method
