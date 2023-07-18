Return-Path: <SRS0=rILA=DE=canonical.com=benjamin.drung@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02192EB64DC
	for <linux-firmware@archiver.kernel.org>; Tue, 18 Jul 2023 18:31:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B7AFEC433C9; Tue, 18 Jul 2023 18:31:28 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 333A8C433C7
	for <linux-firmware@kernel.org>; Tue, 18 Jul 2023 18:31:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 333A8C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 3527A3F0F8
	for <linux-firmware@kernel.org>; Tue, 18 Jul 2023 18:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1689705084;
	bh=8N7fdCAbj412Rhu7jD3slIa35xTSVRXoOaOhGRu4+u8=;
	h=Message-ID:Subject:From:Reply-To:To:Date:Content-Type:
	 MIME-Version;
	b=vMFjSaFsNZQGaDSOn+z5QAOjP0H3W3NsWwJCB1iKHZrbIImSRe/0killtVwSuYMi4
	 1Ig0GqfkUDploJVS0jJtWayCKsgSVJ+uLKAg/Fsf/zfg+upMQBa1DNi9IycjaOadFj
	 gu9pP4YQ9K7A6qA0nVqc9cwnEq6DiLy1C30rqniF+biIroaieyR1qidqqQOdlTVUyU
	 jVcek+GKb2dE6xkrISWNB8aG3Il67/iBrhwxsiTHT6YPtNkqC2fqp3p4B2CpiTGHe0
	 v3KOqO5cbAILm+vqpzaPvbww7wF7sIggZWTshrqFMAzm0nf3mQ4ibeITlpaS2u8apu
	 RcVEsBCtXZNog==
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-993d5006993so369891966b.3
        for <linux-firmware@kernel.org>; Tue, 18 Jul 2023 11:31:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689705084; x=1692297084;
        h=mime-version:user-agent:date:to:reply-to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8N7fdCAbj412Rhu7jD3slIa35xTSVRXoOaOhGRu4+u8=;
        b=CvzFtwPcwhBJf22YucrfTCvtYrLKDd6+CKnMYmzSgpgusK7KSlPBLtktg/ATv9bGpX
         rl9+TiYrNxizSBKJWTAmDq29rJl5sgo6TsCoXw6zj2oERMwmdUxsxCuAtFhpN0UivlrL
         +m34Repk9xIat5L02tpd/QDbmW6BQovYQd3udzToRgPDLO7x1/B/C/pO7ypIvvjrvGrL
         Zv/3pIyZG0tv4R2r3+YLHSO96IJfw8hSDJpGeByaPXb4KZ8jpolnRTi87zVpqJLhvmK2
         83SBk0u8Wa6UgsM9O+AgWFm0gLV/s7J1kaNhW1YOt9Eq/T4Krm1oqB49Q9opvOjno+44
         nQuw==
X-Gm-Message-State: ABy/qLb0k3CIRs83ZjNgu8RzPVU59dEZ5lJmwLO1nPO4h6i1LZiR8x/J
	MGLYP4wEopXrFnMDG2PttQMWvHtQrxn5aQG0zJ2C2DQ7Z1r+0TvoA//9gI/vsYhRPDvhcCC2Jsq
	GnoLDI8b+5vPWliFH/edG5qi3taH/+zOWN4v1/9UdN8fgcQ==
X-Received: by 2002:a17:906:109b:b0:98d:63c5:d147 with SMTP id u27-20020a170906109b00b0098d63c5d147mr573042eju.47.1689705083904;
        Tue, 18 Jul 2023 11:31:23 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFXHPWR8K5ZydIqJ7JaMyrA5hIm8SPX6xAwKYyk07fi/wd+VdCKxFtVpRhs8qEbpzzT4fcCrg==
X-Received: by 2002:a17:906:109b:b0:98d:63c5:d147 with SMTP id u27-20020a170906109b00b0098d63c5d147mr573030eju.47.1689705083527;
        Tue, 18 Jul 2023 11:31:23 -0700 (PDT)
Received: from deep-thought.gnur.de (ip5b401d0b.dynamic.kabel-deutschland.de. [91.64.29.11])
        by smtp.gmail.com with ESMTPSA id s5-20020a1709062ec500b0098dfec235ccsm1318297eji.47.2023.07.18.11.31.22
        for <linux-firmware@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 11:31:23 -0700 (PDT)
Message-ID: <c151f7d4837d3a07143ee5191d3f5e57bc6ded2c.camel@canonical.com>
Subject: [PATCH] copy-firmware: Fix linking directories when using
 compression
From: Benjamin Drung <benjamin.drung@canonical.com>
Reply-To: linux-firmware@kernel.org, benjamin.drung@canonical.com
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Date: Tue, 18 Jul 2023 20:31:22 +0200
Content-Type: multipart/mixed; boundary="=-twfeh8DkauIbU6sL+sM+"
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0

--=-twfeh8DkauIbU6sL+sM+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

When `copy-firmware` is called with `--xz` or `--zstd` it will create
broken symlinks for directories:

```
$ ./copy-firmware -v --zstd $dir
[...]
creating link qcom/LENOVO/21BX.zst -> ../sc8280xp/LENOVO/21BX.zst
```

The original target `../sc8280xp/LENOVO/21BX` is a directory. Adding the
compression extension to the directory name breaks the link. The
directory `qcom/sc8280xp/LENOVO/21BX` exists but
`qcom/sc8280xp/LENOVO/21BX.zst` does not exist.

The relative symlink needs to be resolved. If it points to a directory,
create the symlink without the compression extension.

--=20
Benjamin Drung
Debian & Ubuntu Developer

--=-twfeh8DkauIbU6sL+sM+
Content-Disposition: attachment;
	filename*0=0001-copy-firmware-Fix-linking-directories-when-using-com.pat;
	filename*1=ch
Content-Transfer-Encoding: base64
Content-Type: text/x-patch;
	name="0001-copy-firmware-Fix-linking-directories-when-using-com.patch";
	charset="UTF-8"

RnJvbSAzNzRlZDdmMjI4ZmM3MzllOWI4MzkzYTE3YWFlNzFiMjcwYTUxMjE3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBCZW5qYW1pbiBEcnVuZyA8YmVuamFtaW4uZHJ1bmdAY2Fub25p
Y2FsLmNvbT4KRGF0ZTogVHVlLCAxOCBKdWwgMjAyMyAyMDoyMzo0MCArMDIwMApTdWJqZWN0OiBb
UEFUQ0hdIGNvcHktZmlybXdhcmU6IEZpeCBsaW5raW5nIGRpcmVjdG9yaWVzIHdoZW4gdXNpbmcg
Y29tcHJlc3Npb24KCldoZW4gYGNvcHktZmlybXdhcmVgIGlzIGNhbGxlZCB3aXRoIGAtLXh6YCBv
ciBgLS16c3RkYCBpdCB3aWxsIGNyZWF0ZQpicm9rZW4gc3ltbGlua3MgZm9yIGRpcmVjdG9yaWVz
OgoKYGBgCiQgLi9jb3B5LWZpcm13YXJlIC12IC0tenN0ZCAkZGlyClsuLi5dCmNyZWF0aW5nIGxp
bmsgcWNvbS9MRU5PVk8vMjFCWC56c3QgLT4gLi4vc2M4MjgweHAvTEVOT1ZPLzIxQlguenN0CmBg
YAoKVGhlIG9yaWdpbmFsIHRhcmdldCBgLi4vc2M4MjgweHAvTEVOT1ZPLzIxQlhgIGlzIGEgZGly
ZWN0b3J5LiBBZGRpbmcgdGhlCmNvbXByZXNzaW9uIGV4dGVuc2lvbiB0byB0aGUgZGlyZWN0b3J5
IG5hbWUgYnJlYWtzIHRoZSBsaW5rLiBUaGUKZGlyZWN0b3J5IGBxY29tL3NjODI4MHhwL0xFTk9W
Ty8yMUJYYCBleGlzdHMgYnV0CmBxY29tL3NjODI4MHhwL0xFTk9WTy8yMUJYLnpzdGAgZG9lcyBu
b3QgZXhpc3QuCgpUaGUgcmVsYXRpdmUgc3ltbGluayBuZWVkcyB0byBiZSByZXNvbHZlZC4gSWYg
aXQgcG9pbnRzIHRvIGEgZGlyZWN0b3J5LApjcmVhdGUgdGhlIHN5bWxpbmsgd2l0aG91dCB0aGUg
Y29tcHJlc3Npb24gZXh0ZW5zaW9uLgoKU2lnbmVkLW9mZi1ieTogQmVuamFtaW4gRHJ1bmcgPGJl
bmphbWluLmRydW5nQGNhbm9uaWNhbC5jb20+Ci0tLQogY29weS1maXJtd2FyZS5zaCB8IDEzICsr
KysrKysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2NvcHktZmlybXdhcmUuc2ggYi9jb3B5LWZpcm13YXJlLnNoCmlu
ZGV4IGE2YmU4Yzc0Li4xNDhmMGYxOSAxMDA3NTUKLS0tIGEvY29weS1maXJtd2FyZS5zaAorKysg
Yi9jb3B5LWZpcm13YXJlLnNoCkBAIC05NCw5ICs5NCwxNiBAQCBncmVwIC1FICdeTGluazonIFdI
RU5DRSB8IHNlZCAtZSAncy9eTGluazogKi8vZztzLy0+IC8vZycgfCB3aGlsZSByZWFkIGYgZDsg
ZG8KICAgICAgICAgICAgICR2ZXJib3NlICJXQVJOSU5HOiBtaXNzaW5nIHRhcmdldCBmb3Igc3lt
bGluayAkZiIKICAgICAgICAgZmkKICAgICBlbHNlCi0gICAgICAgIGluc3RhbGwgLWQgIiRkZXN0
ZGlyLyQoZGlybmFtZSAiJGYiKSIKLSAgICAgICAgJHZlcmJvc2UgImNyZWF0aW5nIGxpbmsgJGYk
Y29tcGV4dCAtPiAkZCRjb21wZXh0IgotICAgICAgICBsbiAtcyAiJGQkY29tcGV4dCIgIiRkZXN0
ZGlyLyRmJGNvbXBleHQiCisgICAgICAgIGRpcmVjdG9yeT0iJGRlc3RkaXIvJChkaXJuYW1lICIk
ZiIpIgorICAgICAgICBpbnN0YWxsIC1kICIkZGlyZWN0b3J5IgorICAgICAgICB0YXJnZXQ9IiQo
Y2QgIiRkaXJlY3RvcnkiICYmIHJlYWxwYXRoIC1tIC1zICIkZCIpIgorICAgICAgICBpZiB0ZXN0
IC1kICIkdGFyZ2V0IjsgdGhlbgorICAgICAgICAgICAgJHZlcmJvc2UgImNyZWF0aW5nIGxpbmsg
JGYgLT4gJGQiCisgICAgICAgICAgICBsbiAtcyAiJGQiICIkZGVzdGRpci8kZiIKKyAgICAgICAg
ZWxzZQorICAgICAgICAgICAgJHZlcmJvc2UgImNyZWF0aW5nIGxpbmsgJGYkY29tcGV4dCAtPiAk
ZCRjb21wZXh0IgorICAgICAgICAgICAgbG4gLXMgIiRkJGNvbXBleHQiICIkZGVzdGRpci8kZiRj
b21wZXh0IgorICAgICAgICBmaQogICAgIGZpCiBkb25lCiAKLS0gCjIuMzkuMgoK


--=-twfeh8DkauIbU6sL+sM+--
