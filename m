Return-Path: <SRS0=j79q=4M=gmail.com=narris.mypackagingpro@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA4A7CAC5B0
	for <linux-firmware@archiver.kernel.org>; Fri,  3 Oct 2025 13:44:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 96506C4CEFC; Fri,  3 Oct 2025 13:44:53 +0000 (UTC)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D5C72C4CEFA
	for <linux-firmware@kernel.org>; Fri,  3 Oct 2025 13:44:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D5C72C4CEFA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-8e32821b5bcso826288241.0
        for <linux-firmware@kernel.org>; Fri, 03 Oct 2025 06:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759499088; x=1760103888; darn=kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FFVQLTdPNg4vzILeJOfq93bFIjcJrKXHbUBO8Et0fqc=;
        b=Xmh15AkJQf/hGQfaU0mHGfAjfWuX+s4+53ZKxjka5XOzz/Yv9R2nPyPCCBxvu/Ulf7
         Mp5eyLT6lO3IAomyYPX8dlTEATxhAdJfXZUq7TZSxkbutWv62DywEM+5YXMgEiUt05lJ
         otTKx2rNN2BdMAWX/Ilg3bBRlZrUSFOWldxBLo2568YU6quYHusxfW2PAlup7kUGmRWP
         ofIPFC856lc92CmKhSEfvWR+dEnBgaiOzFgLxKgzHCCca/JSxhdXDaRguGBe3ckOegcm
         ILyN7s+031A8i7C789jlIHo1TMvwcLUMSbY3Ge28N5KvKDHSJB5yEWz1J1LycTAe6Bwq
         ck2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759499088; x=1760103888;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FFVQLTdPNg4vzILeJOfq93bFIjcJrKXHbUBO8Et0fqc=;
        b=kvynynAXH2FY1nTgyvCfInc2/9JkeAgoylTEQyjCI89Mbxpz3TdrwCAuRXqchi5CIe
         g33lA7cSlwaeUOT7YxRf5m4Dae468Gt9VUUVQRq4JFef3E8Uzq0q54prmM037CcOMHOS
         UnixWHacHFuVQJpLd5cY2hHSt1G/Gc/R7OXCkbHute7TqhvXYb1EPGwzaaiRcliTSWGg
         KKvkv4juoTwS7IKc4FOy9nmKoB/B7qauBB0+8UDwtcGiaeYIKQ2QYrsU/bBPEQln8OO1
         4ARUsbX3ZSGO3MZtJho2zEaAm3W+WKhmzstsLOrxHcKGQlO64Nu4DNK3Skjw+kpVv+uf
         i4lA==
X-Gm-Message-State: AOJu0YzLA0Y0RuZwsimAJ31LHq7CFw3nrUFTgBefoAuzlUaU8bhRuR4r
	h3FVBRyz+TDtJ9janGwjthihVVMP5aCaAh2V3doNtWN3xYslIEWC3sZzr1Krso0Lfl1cIBqiQbO
	oSOvlBmvmb1M5yxu5JRkTkCITiTVuLQdL5g==
X-Gm-Gg: ASbGncsLKe45Rc16m+2YbyxJ3+stVZEEXoYRTj6bnbTPrNhxLxrSRvYJBRA3K3Mkfzc
	P9X9BtAOZH+lKCUDwVNGBeCaDRn1YMK4PUa2tTlisOzeJ2Uv2zmi4dlNcTY02290l+VAS+ce7YU
	DpRty0BVEVUsoTQnKD4hRCBKA33fWMbED30/p0x2T8u7su912FIjuR32NIkMGuED3IdA8YsG8He
	pe+nciAPuRslCS3w4u20B0/WLGo3JjpYaJvtBESyhVIrmWk6GJ4X5Q6hmXwOGf86kQ3vDBOA4Q=
X-Google-Smtp-Source: AGHT+IEFNusx9xy8sAzxAPSedvUyGPueA1tNeTW4Cj0UDNyYNUBE4vaYcvKrCCPuq1AWiBShyxBsPB934ZmkG6Uhsdo=
X-Received: by 2002:a05:6102:dcf:b0:527:8b63:78e1 with SMTP id
 ada2fe7eead31-5d41d00141bmr1190236137.1.1759499088511; Fri, 03 Oct 2025
 06:44:48 -0700 (PDT)
MIME-Version: 1.0
From: Narris Makan <narris.mypackagingpro@gmail.com>
Date: Thu, 2 Oct 2025 18:41:52 -0300
X-Gm-Features: AS18NWC9camjyz0OYptYzOAtNsLxkoV3EHMkji7HDkdWmWGL9GXCfAPvxHzAzT0
Message-ID: <CANUoVA+OvMWUj1_wjgd9qEmxW+YtAPJrJjmsLGzScV3yZooRAQ@mail.gmail.com>
Subject: Custom Labels & Boxes
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Content-Type: multipart/alternative; boundary="00000000000027486e0640414ebf"

--00000000000027486e0640414ebf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I hope you are well.

We are a packaging company. We provide custom packaging boxes/labels in
every size, stocks and styles such as tuck boxes, rigid boxes, mailer
boxes, retail boxes, shopping bags or any other box as well.

Send your packaging details (Size: L W H), quantity and box style so
we can assist you, we=E2=80=99re also providing complimentary design servic=
es
and shipping on all orders.

Let me know if you have any questions or any job you would like to try
us on. Thanks.
Best regards,
Narris Makan
Marketing Executive
My Packaging Pro.

--00000000000027486e0640414ebf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi,<br><br>
I hope you are well.<br><br>
We are a packaging company. We provide custom packaging boxes/labels in eve=
ry size, stocks and styles such as tuck boxes, rigid boxes, mailer boxes, r=
etail boxes, shopping bags or any other box as well.<br><br>
Send your packaging details (Size: L W H), quantity and box style so<br>
we can assist you, we=E2=80=99re also providing complimentary design servic=
es<br>
and shipping on all orders.<br><br>
Let me know if you have any questions or any job you would like to try<br>
us on. Thanks.<div>Best regards,<div>Narris Makan<br><div><div>Marketing Ex=
ecutive</div><div>My Packaging Pro.</div></div></div></div></div></div>

--00000000000027486e0640414ebf--
