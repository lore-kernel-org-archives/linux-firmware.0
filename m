Return-Path: <SRS0=rILA=DE=canonical.com=benjamin.drung@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A42FCEB64DA
	for <linux-firmware@archiver.kernel.org>; Tue, 18 Jul 2023 11:29:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 60163C433C7; Tue, 18 Jul 2023 11:29:40 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D40B9C433C9
	for <linux-firmware@kernel.org>; Tue, 18 Jul 2023 11:29:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D40B9C433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 65D393F0F7
	for <linux-firmware@kernel.org>; Tue, 18 Jul 2023 11:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1689679768;
	bh=2SjkpK+NX674bSlhWbRAePofm+mXJr/M831shv+PFAw=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version;
	b=fhvnN3cNY2Ix+CTLu111vqsfbheu0YMni2tc5KG8oncMgTPlXwnA74SWRgJvH4SyO
	 sLMqtLruToXMT5e0CFAyVkUl3DKe0okwkj1zLciOswBlcjjXKkBYOCKRONcIXpXXDq
	 1f7SmhF8K9qYiJMJC9bjvC7JC0arwMphUa9gGoSGFvlldEKPkJoj5oSS+/6JMXrOS8
	 Brofe7cbUJHtE8qCug4T/kXjcH9Jn8UqXAQe7tdiiaEWvZM0X/X5bGVMjxPRXf9awP
	 sMPnJLmMbNKmNzfmf0V+Sxf+st60FrTEwmCsyvg/37JGPYdDaL70u28FIGiRDoGDTu
	 s6TY+x6I8Oceg==
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-989249538a1so299173266b.1
        for <linux-firmware@kernel.org>; Tue, 18 Jul 2023 04:29:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689679768; x=1692271768;
        h=mime-version:user-agent:date:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2SjkpK+NX674bSlhWbRAePofm+mXJr/M831shv+PFAw=;
        b=ABGST7Z+t9VNF4C/U9kbacBPiVG5URpL4aoRlKQX10Bg5RV9I6dTo9WQMT3pSa4+iv
         WmYxTo08tYyvExZxHt2BbC+mw6Z6ghrlT0JixsgEA6lJgtGb71MB6d5gBeLVk4tZqsjK
         53UMIGcjpEu0nLuIffrdnvRc2sUznl6PSX2ptbg52HXtGteyuLwvCn0FlG+JyF7FaGoG
         jAvdchSGPnzyzXpDvbcTRonu3Br63o+1cuJpfRYg0+Ms2qSgWiYk7C/t+wrRu62rZdKt
         wDbOyJ0FgDH1PGKWzruT8wPsaG1E0sqY0pNqpDUDHnB7St0ZQaTW+xsWwuqAU428HQGc
         n2Mg==
X-Gm-Message-State: ABy/qLYFJvSX/zrutJ2MlviQzIGGUFBIVpD+snwYaLNW0nRXL50ffjZC
	MaI2Qjuof8Ps1ZRexSPUz3XVVKiUOaO1wgDp7JbKGfbHDVe1GRg8+Y+DZ4ANIdhcroPLIfJFa8j
	G0uvvsRrv5VtCEPHculf7iL3QihgwuKxPzy4tjRqmt/w/7A==
X-Received: by 2002:a17:906:8052:b0:994:19ed:e92b with SMTP id x18-20020a170906805200b0099419ede92bmr11241846ejw.20.1689679767977;
        Tue, 18 Jul 2023 04:29:27 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGI1gGuwzCjwPzRh8mDmDUC2Y2t0Ym1GETStK5UO7XTwOgRpYoiBD3z8xwr9I5x+ZMYskniGw==
X-Received: by 2002:a17:906:8052:b0:994:19ed:e92b with SMTP id x18-20020a170906805200b0099419ede92bmr11241836ejw.20.1689679767692;
        Tue, 18 Jul 2023 04:29:27 -0700 (PDT)
Received: from deep-thought.gnur.de ([91.64.29.11])
        by smtp.gmail.com with ESMTPSA id p26-20020a170906b21a00b009929d998abcsm881740ejz.209.2023.07.18.04.29.26
        for <linux-firmware@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 04:29:27 -0700 (PDT)
Message-ID: <1addfae3b9a376ebbf39c0d05642394ebcfb9ee9.camel@canonical.com>
Subject: [PATCH] copy-firmware: Fix test: unexpected operator
From: Benjamin Drung <benjamin.drung@canonical.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Date: Tue, 18 Jul 2023 13:29:26 +0200
Content-Type: multipart/mixed; boundary="=-8HmI4ULrm/i4pcmH8T7p"
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0

--=-8HmI4ULrm/i4pcmH8T7p
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

dash is the default /bin/sh on Debian based system.

```
dash ./copy-firmware.sh --zstd example
./copy-firmware.sh: 37: test: unexpected operator
```

`=3D` should be used with the test command for POSIX conformance.

--=20
Benjamin Drung
Debian & Ubuntu Developer

--=-8HmI4ULrm/i4pcmH8T7p
Content-Disposition: attachment;
	filename="0001-copy-firmware-Fix-test-unexpected-operator.patch"
Content-Type: text/x-patch; name="0001-copy-firmware-Fix-test-unexpected-operator.patch";
	charset="UTF-8"
Content-Transfer-Encoding: base64

RnJvbSAxYzZkNzY2MWJkYTU5NDdiMDFmOGY1MDJiYzQ4ZTM2M2FhYzE3YTY4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBCZW5qYW1pbiBEcnVuZyA8YmVuamFtaW4uZHJ1bmdAY2Fub25p
Y2FsLmNvbT4KRGF0ZTogVHVlLCAxOCBKdWwgMjAyMyAxMzoyMDoyNCArMDIwMApTdWJqZWN0OiBb
UEFUQ0hdIGNvcHktZmlybXdhcmU6IEZpeCB0ZXN0OiB1bmV4cGVjdGVkIG9wZXJhdG9yCgpkYXNo
IGlzIHRoZSBkZWZhdWx0IC9iaW4vc2ggb24gRGViaWFuIGJhc2VkIHN5c3RlbS4KCmBgYApkYXNo
IC4vY29weS1maXJtd2FyZS5zaCAtLXpzdGQgZXhhbXBsZQouL2NvcHktZmlybXdhcmUuc2g6IDM3
OiB0ZXN0OiB1bmV4cGVjdGVkIG9wZXJhdG9yCmBgYAoKYD1gIHNob3VsZCBiZSB1c2VkIHdpdGgg
dGhlIHRlc3QgY29tbWFuZCBmb3IgUE9TSVggY29uZm9ybWFuY2UuCgpTaWduZWQtb2ZmLWJ5OiBC
ZW5qYW1pbiBEcnVuZyA8YmVuamFtaW4uZHJ1bmdAY2Fub25pY2FsLmNvbT4KLS0tCiBjb3B5LWZp
cm13YXJlLnNoIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2NvcHktZmlybXdhcmUuc2ggYi9jb3B5LWZpcm13YXJl
LnNoCmluZGV4IDU4ZWI3ZTM5Li5hNmJlOGM3NCAxMDA3NTUKLS0tIGEvY29weS1maXJtd2FyZS5z
aAorKysgYi9jb3B5LWZpcm13YXJlLnNoCkBAIC0yNCw3ICsyNCw3IEBAIHdoaWxlIHRlc3QgJCMg
LWd0IDA7IGRvCiAgICAgICAgICAgICA7OwogCiAgICAgICAgIC0teHopCi0gICAgICAgICAgICBp
ZiB0ZXN0ICIkY29tcGV4dCIgPT0gIi56c3QiOyB0aGVuCisgICAgICAgICAgICBpZiB0ZXN0ICIk
Y29tcGV4dCIgPSAiLnpzdCI7IHRoZW4KICAgICAgICAgICAgICAgICBlY2hvICJFUlJPUjogY2Fu
bm90IG1peCBYWiBhbmQgWlNURCBjb21wcmVzc2lvbiIKICAgICAgICAgICAgICAgICBleGl0IDEK
ICAgICAgICAgICAgIGZpCkBAIC0zNCw3ICszNCw3IEBAIHdoaWxlIHRlc3QgJCMgLWd0IDA7IGRv
CiAgICAgICAgICAgICA7OwogCiAgICAgICAgIC0tenN0ZCkKLSAgICAgICAgICAgIGlmIHRlc3Qg
IiRjb21wZXh0IiA9PSAiLnh6IjsgdGhlbgorICAgICAgICAgICAgaWYgdGVzdCAiJGNvbXBleHQi
ID0gIi54eiI7IHRoZW4KICAgICAgICAgICAgICAgICBlY2hvICJFUlJPUjogY2Fubm90IG1peCBY
WiBhbmQgWlNURCBjb21wcmVzc2lvbiIKICAgICAgICAgICAgICAgICBleGl0IDEKICAgICAgICAg
ICAgIGZpCi0tIAoyLjM5LjIKCg==


--=-8HmI4ULrm/i4pcmH8T7p--
