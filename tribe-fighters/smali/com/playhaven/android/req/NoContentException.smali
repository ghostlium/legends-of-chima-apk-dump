.class public Lcom/playhaven/android/req/NoContentException;
.super Lcom/playhaven/android/PlayHavenException;
.source "NoContentException.java"


# static fields
.field private static final message:Ljava/lang/String; = "The request was successful but did not contain any displayable content. This may have occurred because there are no content units assigned to this placement; all content units assigned to this placement are suppressed by frequency caps or targeting; no ad campaigns are available at this time; or an invalid placement was requested. Visit the PlayHaven Dashboard for more details."

.field private static final serialVersionUID:J = 0x340761b31ec7c8f0L


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 36
    const-string v0, "The request was successful but did not contain any displayable content. This may have occurred because there are no content units assigned to this placement; all content units assigned to this placement are suppressed by frequency caps or targeting; no ad campaigns are available at this time; or an invalid placement was requested. Visit the PlayHaven Dashboard for more details."

    invoke-direct {p0, v0}, Lcom/playhaven/android/PlayHavenException;-><init>(Ljava/lang/String;)V

    .line 37
    return-void
.end method
