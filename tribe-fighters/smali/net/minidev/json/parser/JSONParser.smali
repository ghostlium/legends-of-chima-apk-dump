.class public Lnet/minidev/json/parser/JSONParser;
.super Ljava/lang/Object;
.source "JSONParser.java"


# static fields
.field public static final ACCEPT_LEADING_ZERO:I = 0x20

.field public static final ACCEPT_NAN:I = 0x4

.field public static final ACCEPT_NON_QUOTE:I = 0x2

.field public static final ACCEPT_SIMPLE_QUOTE:I = 0x1

.field public static final ACCEPT_TAILLING_DATA:I = 0x100

.field public static final ACCEPT_USELESS_COMMA:I = 0x40

.field public static DEFAULT_PERMISSIVE_MODE:I = 0x0

.field public static final IGNORE_CONTROL_CHAR:I = 0x8

.field public static final MODE_JSON_SIMPLE:I = 0x1c0

.field public static final MODE_PERMISSIVE:I = -0x1

.field public static final MODE_RFC4627:I = 0x190

.field public static final MODE_STRICTEST:I = 0x90

.field public static final USE_HI_PRECISION_FLOAT:I = 0x80

.field public static final USE_INTEGER_STORAGE:I = 0x10


# instance fields
.field private mode:I

.field private pBytes:Lnet/minidev/json/parser/JSONParserByteArray;

.field private pSBintream:Lnet/minidev/json/parser/JSONParserInputStream;

.field private pStream:Lnet/minidev/json/parser/JSONParserReader;

.field private pString:Lnet/minidev/json/parser/JSONParserString;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 105
    const-string v0, "JSON_SMART_SIMPLE"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    const/16 v0, 0x1c0

    :goto_0
    sput v0, Lnet/minidev/json/parser/JSONParser;->DEFAULT_PERMISSIVE_MODE:I

    return-void

    :cond_0
    const/4 v0, -0x1

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 120
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 121
    sget v0, Lnet/minidev/json/parser/JSONParser;->DEFAULT_PERMISSIVE_MODE:I

    iput v0, p0, Lnet/minidev/json/parser/JSONParser;->mode:I

    .line 122
    return-void
.end method

.method public constructor <init>(I)V
    .locals 0
    .param p1, "permissifMode"    # I

    .prologue
    .line 124
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 125
    iput p1, p0, Lnet/minidev/json/parser/JSONParser;->mode:I

    .line 126
    return-void
.end method


# virtual methods
.method public parse(Ljava/io/InputStream;)Ljava/lang/Object;
    .locals 2
    .param p1, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;
        }
    .end annotation

    .prologue
    .line 215
    iget-object v0, p0, Lnet/minidev/json/parser/JSONParser;->pSBintream:Lnet/minidev/json/parser/JSONParserInputStream;

    if-nez v0, :cond_0

    .line 216
    new-instance v0, Lnet/minidev/json/parser/JSONParserInputStream;

    iget v1, p0, Lnet/minidev/json/parser/JSONParser;->mode:I

    invoke-direct {v0, v1}, Lnet/minidev/json/parser/JSONParserInputStream;-><init>(I)V

    iput-object v0, p0, Lnet/minidev/json/parser/JSONParser;->pSBintream:Lnet/minidev/json/parser/JSONParserInputStream;

    .line 217
    :cond_0
    iget-object v0, p0, Lnet/minidev/json/parser/JSONParser;->pSBintream:Lnet/minidev/json/parser/JSONParserInputStream;

    invoke-virtual {v0, p1}, Lnet/minidev/json/parser/JSONParserInputStream;->parse(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public parse(Ljava/io/InputStream;Lnet/minidev/json/parser/ContainerFactory;)Ljava/lang/Object;
    .locals 2
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "containerFactory"    # Lnet/minidev/json/parser/ContainerFactory;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;
        }
    .end annotation

    .prologue
    .line 225
    iget-object v0, p0, Lnet/minidev/json/parser/JSONParser;->pSBintream:Lnet/minidev/json/parser/JSONParserInputStream;

    if-nez v0, :cond_0

    .line 226
    new-instance v0, Lnet/minidev/json/parser/JSONParserInputStream;

    iget v1, p0, Lnet/minidev/json/parser/JSONParser;->mode:I

    invoke-direct {v0, v1}, Lnet/minidev/json/parser/JSONParserInputStream;-><init>(I)V

    iput-object v0, p0, Lnet/minidev/json/parser/JSONParser;->pSBintream:Lnet/minidev/json/parser/JSONParserInputStream;

    .line 227
    :cond_0
    iget-object v0, p0, Lnet/minidev/json/parser/JSONParser;->pSBintream:Lnet/minidev/json/parser/JSONParserInputStream;

    invoke-virtual {v0, p1, p2}, Lnet/minidev/json/parser/JSONParserInputStream;->parse(Ljava/io/InputStream;Lnet/minidev/json/parser/ContainerFactory;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public parse(Ljava/io/InputStream;Lnet/minidev/json/parser/ContainerFactory;Lnet/minidev/json/parser/ContentHandler;)Ljava/lang/Object;
    .locals 2
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "containerFactory"    # Lnet/minidev/json/parser/ContainerFactory;
    .param p3, "handler"    # Lnet/minidev/json/parser/ContentHandler;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;
        }
    .end annotation

    .prologue
    .line 236
    iget-object v0, p0, Lnet/minidev/json/parser/JSONParser;->pSBintream:Lnet/minidev/json/parser/JSONParserInputStream;

    if-nez v0, :cond_0

    .line 237
    new-instance v0, Lnet/minidev/json/parser/JSONParserInputStream;

    iget v1, p0, Lnet/minidev/json/parser/JSONParser;->mode:I

    invoke-direct {v0, v1}, Lnet/minidev/json/parser/JSONParserInputStream;-><init>(I)V

    iput-object v0, p0, Lnet/minidev/json/parser/JSONParser;->pSBintream:Lnet/minidev/json/parser/JSONParserInputStream;

    .line 238
    :cond_0
    iget-object v0, p0, Lnet/minidev/json/parser/JSONParser;->pSBintream:Lnet/minidev/json/parser/JSONParserInputStream;

    invoke-virtual {v0, p1, p2}, Lnet/minidev/json/parser/JSONParserInputStream;->parse(Ljava/io/InputStream;Lnet/minidev/json/parser/ContainerFactory;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public parse(Ljava/io/Reader;)Ljava/lang/Object;
    .locals 2
    .param p1, "in"    # Ljava/io/Reader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;
        }
    .end annotation

    .prologue
    .line 185
    iget-object v0, p0, Lnet/minidev/json/parser/JSONParser;->pStream:Lnet/minidev/json/parser/JSONParserReader;

    if-nez v0, :cond_0

    .line 186
    new-instance v0, Lnet/minidev/json/parser/JSONParserReader;

    iget v1, p0, Lnet/minidev/json/parser/JSONParser;->mode:I

    invoke-direct {v0, v1}, Lnet/minidev/json/parser/JSONParserReader;-><init>(I)V

    iput-object v0, p0, Lnet/minidev/json/parser/JSONParser;->pStream:Lnet/minidev/json/parser/JSONParserReader;

    .line 187
    :cond_0
    iget-object v0, p0, Lnet/minidev/json/parser/JSONParser;->pStream:Lnet/minidev/json/parser/JSONParserReader;

    invoke-virtual {v0, p1}, Lnet/minidev/json/parser/JSONParserReader;->parse(Ljava/io/Reader;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public parse(Ljava/io/Reader;Lnet/minidev/json/parser/ContainerFactory;)Ljava/lang/Object;
    .locals 2
    .param p1, "in"    # Ljava/io/Reader;
    .param p2, "containerFactory"    # Lnet/minidev/json/parser/ContainerFactory;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;
        }
    .end annotation

    .prologue
    .line 195
    iget-object v0, p0, Lnet/minidev/json/parser/JSONParser;->pStream:Lnet/minidev/json/parser/JSONParserReader;

    if-nez v0, :cond_0

    .line 196
    new-instance v0, Lnet/minidev/json/parser/JSONParserReader;

    iget v1, p0, Lnet/minidev/json/parser/JSONParser;->mode:I

    invoke-direct {v0, v1}, Lnet/minidev/json/parser/JSONParserReader;-><init>(I)V

    iput-object v0, p0, Lnet/minidev/json/parser/JSONParser;->pStream:Lnet/minidev/json/parser/JSONParserReader;

    .line 197
    :cond_0
    iget-object v0, p0, Lnet/minidev/json/parser/JSONParser;->pStream:Lnet/minidev/json/parser/JSONParserReader;

    invoke-virtual {v0, p1, p2}, Lnet/minidev/json/parser/JSONParserReader;->parse(Ljava/io/Reader;Lnet/minidev/json/parser/ContainerFactory;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public parse(Ljava/io/Reader;Lnet/minidev/json/parser/ContainerFactory;Lnet/minidev/json/parser/ContentHandler;)Ljava/lang/Object;
    .locals 2
    .param p1, "in"    # Ljava/io/Reader;
    .param p2, "containerFactory"    # Lnet/minidev/json/parser/ContainerFactory;
    .param p3, "handler"    # Lnet/minidev/json/parser/ContentHandler;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;
        }
    .end annotation

    .prologue
    .line 205
    iget-object v0, p0, Lnet/minidev/json/parser/JSONParser;->pStream:Lnet/minidev/json/parser/JSONParserReader;

    if-nez v0, :cond_0

    .line 206
    new-instance v0, Lnet/minidev/json/parser/JSONParserReader;

    iget v1, p0, Lnet/minidev/json/parser/JSONParser;->mode:I

    invoke-direct {v0, v1}, Lnet/minidev/json/parser/JSONParserReader;-><init>(I)V

    iput-object v0, p0, Lnet/minidev/json/parser/JSONParser;->pStream:Lnet/minidev/json/parser/JSONParserReader;

    .line 207
    :cond_0
    iget-object v0, p0, Lnet/minidev/json/parser/JSONParser;->pStream:Lnet/minidev/json/parser/JSONParserReader;

    invoke-virtual {v0, p1, p2}, Lnet/minidev/json/parser/JSONParserReader;->parse(Ljava/io/Reader;Lnet/minidev/json/parser/ContainerFactory;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public parse(Ljava/lang/String;)Ljava/lang/Object;
    .locals 2
    .param p1, "in"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;
        }
    .end annotation

    .prologue
    .line 133
    iget-object v0, p0, Lnet/minidev/json/parser/JSONParser;->pString:Lnet/minidev/json/parser/JSONParserString;

    if-nez v0, :cond_0

    .line 134
    new-instance v0, Lnet/minidev/json/parser/JSONParserString;

    iget v1, p0, Lnet/minidev/json/parser/JSONParser;->mode:I

    invoke-direct {v0, v1}, Lnet/minidev/json/parser/JSONParserString;-><init>(I)V

    iput-object v0, p0, Lnet/minidev/json/parser/JSONParser;->pString:Lnet/minidev/json/parser/JSONParserString;

    .line 135
    :cond_0
    iget-object v0, p0, Lnet/minidev/json/parser/JSONParser;->pString:Lnet/minidev/json/parser/JSONParserString;

    invoke-virtual {v0, p1}, Lnet/minidev/json/parser/JSONParserString;->parse(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public parse(Ljava/lang/String;Lnet/minidev/json/parser/ContainerFactory;)Ljava/lang/Object;
    .locals 2
    .param p1, "in"    # Ljava/lang/String;
    .param p2, "containerFactory"    # Lnet/minidev/json/parser/ContainerFactory;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;
        }
    .end annotation

    .prologue
    .line 143
    iget-object v0, p0, Lnet/minidev/json/parser/JSONParser;->pString:Lnet/minidev/json/parser/JSONParserString;

    if-nez v0, :cond_0

    .line 144
    new-instance v0, Lnet/minidev/json/parser/JSONParserString;

    iget v1, p0, Lnet/minidev/json/parser/JSONParser;->mode:I

    invoke-direct {v0, v1}, Lnet/minidev/json/parser/JSONParserString;-><init>(I)V

    iput-object v0, p0, Lnet/minidev/json/parser/JSONParser;->pString:Lnet/minidev/json/parser/JSONParserString;

    .line 145
    :cond_0
    iget-object v0, p0, Lnet/minidev/json/parser/JSONParser;->pString:Lnet/minidev/json/parser/JSONParserString;

    invoke-virtual {v0, p1, p2}, Lnet/minidev/json/parser/JSONParserString;->parse(Ljava/lang/String;Lnet/minidev/json/parser/ContainerFactory;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public parse(Ljava/lang/String;Lnet/minidev/json/parser/ContainerFactory;Lnet/minidev/json/parser/ContentHandler;)Ljava/lang/Object;
    .locals 2
    .param p1, "in"    # Ljava/lang/String;
    .param p2, "containerFactory"    # Lnet/minidev/json/parser/ContainerFactory;
    .param p3, "handler"    # Lnet/minidev/json/parser/ContentHandler;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;
        }
    .end annotation

    .prologue
    .line 149
    iget-object v0, p0, Lnet/minidev/json/parser/JSONParser;->pString:Lnet/minidev/json/parser/JSONParserString;

    if-nez v0, :cond_0

    .line 150
    new-instance v0, Lnet/minidev/json/parser/JSONParserString;

    iget v1, p0, Lnet/minidev/json/parser/JSONParser;->mode:I

    invoke-direct {v0, v1}, Lnet/minidev/json/parser/JSONParserString;-><init>(I)V

    iput-object v0, p0, Lnet/minidev/json/parser/JSONParser;->pString:Lnet/minidev/json/parser/JSONParserString;

    .line 151
    :cond_0
    iget-object v0, p0, Lnet/minidev/json/parser/JSONParser;->pString:Lnet/minidev/json/parser/JSONParserString;

    invoke-virtual {v0, p1, p2, p3}, Lnet/minidev/json/parser/JSONParserString;->parse(Ljava/lang/String;Lnet/minidev/json/parser/ContainerFactory;Lnet/minidev/json/parser/ContentHandler;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public parse([B)Ljava/lang/Object;
    .locals 2
    .param p1, "in"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;
        }
    .end annotation

    .prologue
    .line 159
    iget-object v0, p0, Lnet/minidev/json/parser/JSONParser;->pBytes:Lnet/minidev/json/parser/JSONParserByteArray;

    if-nez v0, :cond_0

    .line 160
    new-instance v0, Lnet/minidev/json/parser/JSONParserByteArray;

    iget v1, p0, Lnet/minidev/json/parser/JSONParser;->mode:I

    invoke-direct {v0, v1}, Lnet/minidev/json/parser/JSONParserByteArray;-><init>(I)V

    iput-object v0, p0, Lnet/minidev/json/parser/JSONParser;->pBytes:Lnet/minidev/json/parser/JSONParserByteArray;

    .line 161
    :cond_0
    iget-object v0, p0, Lnet/minidev/json/parser/JSONParser;->pBytes:Lnet/minidev/json/parser/JSONParserByteArray;

    invoke-virtual {v0, p1}, Lnet/minidev/json/parser/JSONParserByteArray;->parse([B)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public parse([BLnet/minidev/json/parser/ContainerFactory;)Ljava/lang/Object;
    .locals 2
    .param p1, "in"    # [B
    .param p2, "containerFactory"    # Lnet/minidev/json/parser/ContainerFactory;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;
        }
    .end annotation

    .prologue
    .line 169
    iget-object v0, p0, Lnet/minidev/json/parser/JSONParser;->pBytes:Lnet/minidev/json/parser/JSONParserByteArray;

    if-nez v0, :cond_0

    .line 170
    new-instance v0, Lnet/minidev/json/parser/JSONParserByteArray;

    iget v1, p0, Lnet/minidev/json/parser/JSONParser;->mode:I

    invoke-direct {v0, v1}, Lnet/minidev/json/parser/JSONParserByteArray;-><init>(I)V

    iput-object v0, p0, Lnet/minidev/json/parser/JSONParser;->pBytes:Lnet/minidev/json/parser/JSONParserByteArray;

    .line 171
    :cond_0
    iget-object v0, p0, Lnet/minidev/json/parser/JSONParser;->pBytes:Lnet/minidev/json/parser/JSONParserByteArray;

    invoke-virtual {v0, p1, p2}, Lnet/minidev/json/parser/JSONParserByteArray;->parse([BLnet/minidev/json/parser/ContainerFactory;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public parse([BLnet/minidev/json/parser/ContainerFactory;Lnet/minidev/json/parser/ContentHandler;)Ljava/lang/Object;
    .locals 2
    .param p1, "in"    # [B
    .param p2, "containerFactory"    # Lnet/minidev/json/parser/ContainerFactory;
    .param p3, "handler"    # Lnet/minidev/json/parser/ContentHandler;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;
        }
    .end annotation

    .prologue
    .line 175
    iget-object v0, p0, Lnet/minidev/json/parser/JSONParser;->pBytes:Lnet/minidev/json/parser/JSONParserByteArray;

    if-nez v0, :cond_0

    .line 176
    new-instance v0, Lnet/minidev/json/parser/JSONParserByteArray;

    iget v1, p0, Lnet/minidev/json/parser/JSONParser;->mode:I

    invoke-direct {v0, v1}, Lnet/minidev/json/parser/JSONParserByteArray;-><init>(I)V

    iput-object v0, p0, Lnet/minidev/json/parser/JSONParser;->pBytes:Lnet/minidev/json/parser/JSONParserByteArray;

    .line 177
    :cond_0
    iget-object v0, p0, Lnet/minidev/json/parser/JSONParser;->pBytes:Lnet/minidev/json/parser/JSONParserByteArray;

    invoke-virtual {v0, p1, p2, p3}, Lnet/minidev/json/parser/JSONParserByteArray;->parse([BLnet/minidev/json/parser/ContainerFactory;Lnet/minidev/json/parser/ContentHandler;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
