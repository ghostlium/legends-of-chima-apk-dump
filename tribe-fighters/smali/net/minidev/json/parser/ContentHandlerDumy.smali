.class public Lnet/minidev/json/parser/ContentHandlerDumy;
.super Ljava/lang/Object;
.source "ContentHandlerDumy.java"

# interfaces
.implements Lnet/minidev/json/parser/ContentHandler;


# static fields
.field public static HANDLER:Lnet/minidev/json/parser/ContentHandlerDumy;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 21
    new-instance v0, Lnet/minidev/json/parser/ContentHandlerDumy;

    invoke-direct {v0}, Lnet/minidev/json/parser/ContentHandlerDumy;-><init>()V

    sput-object v0, Lnet/minidev/json/parser/ContentHandlerDumy;->HANDLER:Lnet/minidev/json/parser/ContentHandlerDumy;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public endArray()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;
        }
    .end annotation

    .prologue
    .line 58
    const/4 v0, 0x0

    return v0
.end method

.method public endJSON()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;
        }
    .end annotation

    .prologue
    .line 29
    return-void
.end method

.method public endObject()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;
        }
    .end annotation

    .prologue
    .line 38
    const/4 v0, 0x0

    return v0
.end method

.method public endObjectEntry()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;
        }
    .end annotation

    .prologue
    .line 48
    const/4 v0, 0x0

    return v0
.end method

.method public primitive(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;
        }
    .end annotation

    .prologue
    .line 63
    const/4 v0, 0x0

    return v0
.end method

.method public startArray()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;
        }
    .end annotation

    .prologue
    .line 53
    const/4 v0, 0x0

    return v0
.end method

.method public startJSON()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;
        }
    .end annotation

    .prologue
    .line 25
    return-void
.end method

.method public startObject()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 33
    const/4 v0, 0x0

    return v0
.end method

.method public startObjectEntry(Ljava/lang/String;)Z
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;
        }
    .end annotation

    .prologue
    .line 43
    const/4 v0, 0x0

    return v0
.end method
