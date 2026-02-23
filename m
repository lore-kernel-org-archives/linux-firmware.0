Return-Path: <SRS0=SwCx=A3=gmail.com=roman.packagingservices@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B228AEC111B
	for <linux-firmware@archiver.kernel.org>; Mon, 23 Feb 2026 18:07:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7E70AC116D0; Mon, 23 Feb 2026 18:07:23 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C008EC116C6
	for <linux-firmware@kernel.org>; Mon, 23 Feb 2026 18:07:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C008EC116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-46394090d2fso1370182b6e.3
        for <linux-firmware@kernel.org>; Mon, 23 Feb 2026 10:07:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771870040; cv=none;
        d=google.com; s=arc-20240605;
        b=d794gG72zreAJtII57BnIWXnz8yCKHwrltLn4te+oHDHPn8QumJPburR+VBgqbSH2l
         IX1mHZF0aFKLejnlH8MN44JxGfqinpn4QQJh1azeLEYN7yIP+Zl0LE9aaV/RA5ToJ2Rs
         kLf4ZC1PqD2kB0hTq4rhn4yx/KF7DZFjkv3AgKo1+wrdiVnfu0vANmA1ip8PMVyuPs12
         EW3rz3DPJx2jmXKLND5svn6ViERR1KVjVUkfBIKcwuBrebd0N0UC9clGiJretYvQaeH4
         CS5HI1NSbeLL8DOVz3y5gvdMstreKv4QNU4ZazNtbk/hb1t1D1hBHVFQ63ek4lVtX8QL
         3KrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=/a5AKgaiviJq2JQ/y9pATyMFLcG36VnBxjMA1v9ZOb4=;
        fh=thzlYDAT27MWbzz3if4rQyeooyybPz7D/zeQezHlJZA=;
        b=ep1P29DQMTXMOKa71ZQf7kxfzKp1CV3aBj+9LwNGPEwh7wwiaNWUdjhw3eN07ecKx0
         MW/KB+kzvr6NteoXTb3nhzVR0Zo2lY8XoPuO6K6DkcwkXd5PyPYDjn9KXI6noqifzLHL
         t4nMXWhwleI5o/PVb1BxU/Fp9TNk8aOIOjPKGTcMCBRO0zu/cQilIcvECNMEwuc5UP+F
         TVqew2FztMXPCoz+mfMCxRVF9ay4rBEPKN4Tvg6LSClvXkAulZeuhd6F4wTRDIlfCPs4
         FmSi7d+o3f+qSo+wftUJj+MVLvLZZKfB5WxJYgIJohfLjTvHYh4EIbgo6xT92DWrSCBH
         WUeA==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771870040; x=1772474840; darn=kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/a5AKgaiviJq2JQ/y9pATyMFLcG36VnBxjMA1v9ZOb4=;
        b=dOTgIM1DKgFw4oidUHy9VpRkesoL5KdKJrDXYotwC9Bn+KXDhuOq81/7M9vau9pwcW
         bclrHXcxXR8BzGQyldADnjt4SFptVdYQlH61EToS+VH5gKrMgspmgiU9t87cwjU3KCA8
         +uga6cMS57r6Kl9eZTXJn2f8EacsiJuGkBYJFSIXxjDvB4iBhAvVTv5KoSNAjP9vLVJQ
         Utmvv5nTru+HrXUlYj9v3xgfcfX82ikc2ubAmOZRgAHt8vPUOjNUMazjUjwksqSrbD5a
         Alhd2dDs2Ej8kd1AlRUY9rD7bm809xi1x0N4YMNrjgvKBeyAO/FyHPhnugaIpywUAVAb
         lVFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771870040; x=1772474840;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/a5AKgaiviJq2JQ/y9pATyMFLcG36VnBxjMA1v9ZOb4=;
        b=uQG+BjGGi6r3kEkT90IKzr05wJjS55F42jeLILfaSqSF/Gr47bVBBQH0cJ38/O/AVP
         v0h/xxD2Fmkt/rXpHhn1abT26zH+kIFIWMNVcgIUfWa7NDoL9sLmomL9dUivvqKpwytr
         CJfJktpBPb978XA24XkEfUipyFXTtiPdzehIwwixOYtBeDBMYySkpt8TUaVy09tnq2vW
         VDm3c4FQ7jkl+0EeaF7gSY3sax+zMyuonWgpGsv/kP4fsSkfbmleaKslmM03E6oQx59/
         +oGlevll8rcQDJIm1/g5o1KOC+8oYYseBOJMMHAuNRnIemsxPb2Y33tBWZUXqsMK4U6n
         aKvA==
X-Gm-Message-State: AOJu0Yy/qja/UqzjIDFHPQX2cUh/BMdorD9urvXbuA0xewJ5nZH7vuDF
	50xUnsFMcpYCUikgtunzOYmPXvilvJ8mqAuaAjJl9TCZWO7aygbc1bxxqynZZgnjUCm5JY+mxvU
	cGMrwvf8Mm5LrH8xU2K1cltQooXcZrt0Z5A==
X-Gm-Gg: AZuq6aLtQeR7YZwMhoev/D3NblaGO5GlsG6EoycmUofAxfGcRG0GhRLKXKyT7EVirU7
	zzLP4wqr5FFSfnAvNf+IuhlKxBMLTiRewx1kHnMWWgVN6QJauqY3OvICZoDPKFo+puCvJ2qoDc6
	cpa45IbjIWkPsoTneybSjk95W+ur7vmXvoRG31+43VFiORGapLUnvrYnZDtvr8SGuqckTte3DmP
	nUxUwli+qKiNxyj0W+8M1e82nafHoL5NpDF+JePD5mAFnqE+uS9AHsLdhcMrhg+/pz4L/yMBa2C
	hEXmDg+a8c1G2lyHfQOa0wpG4PhENXRyIu1GgidfiH0MuWT424vCQUhdFr7TIHZ+ldir+FyoOh6
	gQnNTWOaUJJhK
X-Received: by 2002:a05:6808:1808:b0:450:760b:cc9e with SMTP id
 5614622812f47-464461bf122mr4654238b6e.27.1771870040432; Mon, 23 Feb 2026
 10:07:20 -0800 (PST)
MIME-Version: 1.0
From: Roman Carter <roman.packagingservices@gmail.com>
Date: Mon, 23 Feb 2026 23:07:09 +0500
X-Gm-Features: AaiRm53g9lmH2gDCe7rhe87tKdsp1p1h8KEN2lv6ydhZcpRuwHToJN8qAzWFCuo
Message-ID: <CAOvXnNvE-pMOxU5Z1UF7nSPSJm4X=qV5E+d0fcC7wKHzNO_POA@mail.gmail.com>
Subject: Packaging Made Easy
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Content-Type: multipart/alternative; boundary="0000000000005924d5064b81a4a1"

--0000000000005924d5064b81a4a1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I hope you are well.

We are a packaging company. We provide custom packaging boxes/labels in
every size, stocks and styles such as tuck boxes, rigid boxes, mailer
boxes, retail boxes, shopping bags or any other box as well.

Send your packaging details (Size: L W H), quantity and box style so we can
assist you, we=E2=80=99re also providing complimentary design services and =
shipping
on orders.

Let me know if you have any questions or any job you would like to try us
on. Thanks.

Roman Carter
My Packaging Services

--0000000000005924d5064b81a4a1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hi,<br><br>I hope you ar=
e well.<br><br>We are a packaging company. We provide custom packaging boxe=
s/labels in every size, stocks and styles such as tuck boxes, rigid boxes, =
mailer boxes, retail boxes, shopping bags or any other box as well.<br><br>=
Send your packaging details (Size: L W H), quantity and box style so we can=
 assist you, we=E2=80=99re also providing complimentary design services and=
 shipping on orders.<br><br>Let me know if you have any questions or any jo=
b you would like to try us on. Thanks.<br><br>Roman Carter</div><div dir=3D=
"ltr">My Packaging Services</div></div></div>

--0000000000005924d5064b81a4a1--
